# chef-cd-workshop Cookbook

This cookbook installs and configures Jenkins to facilitate a Continuous
Delivery workshop for Chef cookbooks.

# Recipes
### default
In addition to installing Jenkins, this cookbook also installs Git, ChefDK, and
Docker to facilitate a Continuous Delivery workshop.  When complete, Jenkins
will have security enabled and a single user configured:

** Default Jenkins   User **  
admin / CDWorkshop

Once security is enabled, you will need a key pair to interact with
Jenkins.  This cookbook has a pre-generated key pair to facilitate classroom
use.  **You should not use the included key pair except for evaluation
purposes.**


# Attributes

`node['jenkins']['plugins']` - A array of Jenkins plugin IDs to install.
Default is `%w(ghprb chef-identity envinject ansicolor)`  
`node['jenkins']['admin']['username']` - Username of the automatically created
user.  Default is `'admin'`  
`node['jenkins']['admin']['password']` - Password of the automatically created
user.  Default is `'CDWorkshop'`  
`node['jenkins']['admin']['private_key']` - The private key used to interact with
a secured Jenkins node.  The related public key must be associated with a
Jenkins admin user.  
`node['jenkins']['admin']['public_key']` - The public key associated with the
admin user.

`node['jenkins']['git']['username']` - The git account username.  
`node['jenkins']['git']['oauth_token']` - The git account OAuth token.  
`node['jenkins']['git']['repo']['sample-cookbook']` - The URL to the sample-cookbook  used in the Jenkins verify and accept jobs.  
`node['jenkins']['git']['repo']['chef-repo']` - The URL to the chef-repo cookbook used in the Jenkins ship job.  
`node['jenkins']['chef']['identity']` - The chef identity name.  
`node['jenkins']['chef']['node_name']` - The chef node name.  
`node['jenkins']['chef']['org_name']` - The chef server organisation.  
`node['jenkins']['chef']['user_pem']` - The chef user pem.   

# Platforms
- CentOS 6.6+
- Ubuntu 14.04
