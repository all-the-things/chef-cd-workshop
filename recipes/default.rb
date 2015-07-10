#
# Cookbook Name:: chef-cd-workshop
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# add the EPEL repo so we can install Docker (docker-io)
case node["platform"]
when "centos"
  yum_repository 'epel' do
    description 'Extra Packages for Enterprise Linux'
    mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
    gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
    action :create
  end
when 'ubuntu'
  packagecloud_repo 'chef/stable'

  package 'delivery-cli'
  
  execute "apt_update" do
    command "apt-get update"
    action :run
  end
end

# Install Git
package 'git' do
  action :install
end

# Install ChefDK
chef_dk 'ChefDK' do 
  action :install
end

# Install the kitchen-docker driver into ChefDK's embedded Ruby. 
gem_package 'kitchen-docker' do
  gem_binary('/opt/chefdk/embedded/bin/gem')
  options('--no-user-install --install-dir /opt/chefdk/embedded/lib/ruby/gems/2.1.0')
  action :install
end

# Install Docker
case node["platform"]
when "centos"
  package 'docker-io' do
    action :install
  end
when 'ubuntu'
  docker_service 'default' do
    action [:create, :start]
  end
end

service 'docker' do
  action [:enable, :start]
end

# Install jenkins
include_recipe 'jenkins::java'
include_recipe 'jenkins::master'

# Add Jenkins to the Docker group so it create new containers
group 'docker' do
  append  true
  members 'jenkins'
  notifies :restart, 'service[jenkins]'
  notifies :restart, 'service[docker]'  
end

# Add Jenkins plugins
node['jenkins']['plugins'].each do |plugin|
  jenkins_plugin plugin do
    action :install
    notifies :restart, 'service[jenkins]'
  end
end

# Create Jenkins admin user and enable security using techniques found at
# http://pghalliday.com/jenkins/groovy/sonar/chef/configuration/management/2014/09/21/some-useful-jenkins-groovy-scripts.html

# The attributes of this cookbook include a pre-generated key pair.
# You should not use these keys as they are visible in a public GitHub repository.
admin_public_key = node['jenkins']['admin']['public_key']
admin_private_key = node['jenkins']['admin']['private_key']


# If security was enabled in a previous chef run then set the private key in the run_state
# now as required by the Jenkins cookbook
ruby_block 'set jenkins private key' do
  block do
    node.run_state[:jenkins_private_key] = admin_private_key
  end
  only_if { node.attribute?('security_enabled') }
end

# Create the admin user before enabling security.
jenkins_user node['jenkins']['admin']['username'] do
  password node['jenkins']['admin']['password']
  public_keys [admin_public_key]
  not_if { node.attribute?('security_enabled') }
  notifies :execute, 'jenkins_script[add_authentication]', :immediately
end

# Enable authentication and set the security model to allow admin rights
# to all logged-in users.
jenkins_script 'add_authentication' do
  command <<-EOH.gsub(/^ {4}/, '')
    import jenkins.model.*
    import hudson.security.*
    import org.jenkinsci.plugins.*

    def instance = Jenkins.getInstance()

    def hudsonRealm = new HudsonPrivateSecurityRealm(false)
    instance.setSecurityRealm(hudsonRealm)

    def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
    instance.setAuthorizationStrategy(strategy)

    instance.save()
  EOH
  notifies :create, 'ruby_block[set the security_enabled flag]', :immediately
  action :nothing
end

# Set the security enabled flag and set the run_state to use the configured private key
ruby_block 'set the security_enabled flag' do
  block do
    node.run_state[:jenkins_private_key] = admin_private_key
    node.normal['security_enabled'] = true
    node.save
  end
  action :nothing
end

jenkins_password_credentials node['jenkins']['git']['username'] do   
  id 'c1803003-e1b4-4957-86a1-327a0e9a6369'   
  description 'GitHub'   
  password node['jenkins']['git']['oauth_token'] 
end

node['jenkins']['jobs'].each do |job|
  jobconfig = job + '-config.xml'
  xml = File.join(Chef::Config[:file_cache_path], jobconfig)
  template jobconfig do
    source jobconfig + '.erb'
  end
  jenkins_job job do
    config jobconfig
    notifies :restart, 'service[jenkins]'
  end
end

knife_rb = File.join(Chef::Config[:file_cache_path], 'knife.rb')
template knife_rb do
  source 'knife.rb.erb'
  owner 'jenkins'
  group 'jenkins'
  mode '0644'
  notifies :restart, 'service[jenkins]'
end

template node['jenkins']['master']['home'] +'/io.chef.jenkins.ChefIdentityBuildWrapper.xml' do
  source 'io.chef.jenkins.ChefIdentityBuildWrapper.xml.erb'
  owner 'jenkins'
  group 'jenkins'
  mode '0644'
  variables(
    lazy {{
      :chef_id => node["jenkins"]["chef"]["identity"],
      :user_pem_key => Base64.encode64(node["jenkins"]["chef"]["user_pem"]),
      :knife_rb => Base64.encode64(File.read(knife_rb))
    }}
  )
  notifies :restart, 'service[jenkins]'
end

# jenkins_script 'config_chef_plugin' do
#   command <<-EOH.gsub(/^ {4}/, '')
#     import jenkins.model.*
#     import org.jenkinsci.plugins.*
#     import io.chef.jenkins.*

#     def desc = Jenkins.getInstance().getDescriptor("io.chef.jenkins.ChefIdentityBuildWrapper")
#     def chefIdentities = desc.getChefIdentities()
#     def chefIdentity = null
#     if (chefIdentities == null) {
#       chefIdentities = new ArrayList()
#     }
#     chefIdentities.add(new ChefIdentity('#{node["jenkins"]["chef"]["identity"]}', 'B', 'C'))
#   desc.setChefIdentities(chefIdentities)
#   desc.save()
#   EOH
# end

template node['jenkins']['master']['home'] +'/org.jenkinsci.plugins.ghprb.GhprbTrigger.xml' do
  source 'org.jenkinsci.plugins.ghprb.GhprbTrigger.xml.erb'
  owner 'jenkins'
  group 'jenkins'
  mode '0644'
  notifies :restart, 'service[jenkins]'
end
