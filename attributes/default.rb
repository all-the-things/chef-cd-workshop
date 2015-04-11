
default['jenkins']['plugins'] = %w(ghprb chef-identity envinject ansicolor)
default['jenkins']['admin']['username'] = 'admin'
default['jenkins']['admin']['password'] = 'CDWorkshop'

default['jenkins']['admin']['private_key'] = %q(
-----BEGIN RSA PRIVATE KEY-----
MIIEpgIBAAKCAQEA79u+zeC3SY0BDf5MGx+a9Xt5JKSwVI6gKpY9iftXLTue4V7j
Twz9nngfOeFJ4GVHOEE04cIWXUdj3YbXCjHN14kwOcHKDd5e0omyfrJPzDBVbqc7
s94QVInS5+CrqZxhy9DWGZi6VOg9etzgkFEDX2kyUijRNhh3x0A9pC4QkGmjFrqT
8xlPqEU/SiR5PcmNR0QT9EvPd2PQnhtKSUtQfFOBOK8pia/evyMARDh0JmDxZnK0
Rj7URsDTIUW2VIFTShSQG8i2ob27KaUbcDW1wZ7QRZxmaMUNiAxyPzquvgSGlVUG
paskdEaxkUiVsll600vRAALV16qcAT4HAv5DwQIDAQABAoIBAQC+oRD2IyDIre4m
pvLpo6bOb0GKo/EYYvpcnmduYHmak4XkbDuQOizfY2y93ZWPaC7AQOK8gjqwC+sM
xvvlOEv2fyv620+w0gjen11jYGgXSlq7xOGoRFcKOTeL3n3QIV+AUwu18DI3BRTH
rwAy8pARplO+BH6x1aRskVvsPkgf3Kstg/hHuU99d00wf4mFDYOKfzdeJJ8o7KZX
9oMvcjI4krPdeNljYw5IRLHN1epS/JhvdZbcuT5tosvCSC49/LL9UIxmZbXqgWUR
IgNRNCURAFgAwJzxvv29Dh6Dxdm3rRZ9knmXnfx22fJUUGPAVL8pztU3jw0r+dzH
e84k9zaBAoGBAP05vmYOiSUd9y+oDjrtLRkHDtp0OxujOQalX/KUyp4fzVyetu2w
miKAT/EUtb2BdkZHfJPMpONoQtjw3UXUdoiFB5jxVXZgOWcIJWb75KoCM9v6RCnk
rbaUIr7u6yfiNHdJJaP0uWa+saN/kAKJmHMCKjyzt8t6LlHz1BtiAsMZAoGBAPJ8
gkKTkRqXo+R7G5c+OWKvSrajUzwQRKAh7z0ilLjL1U0M9M8KKdRK65WlaWkXescO
p0yhHfNkHRtM+9iUCpc2O/49G1c3rjnLQX/FHHRhn7JSC67B3NCjCH/nZPVeYRlc
M/1xW1VZ24KF0YDNoOEiMEKXCdDGzsmyYtM3qILpAoGBALTQIpAlGPCT8Qjqax7Q
dD9Gtuhtzjbx2apRM623aOZ3tt/HxL78N1MjY/G05ACpDJcqPF4c5jArJnBZrOZL
y0e4FbCzwl6AXvye6HYcry5l3Dna/gkb7J5OMHE9kFQuRWBXrrTf7fLbf2RLlbz6
Gw0kIpythzOXzrNd87qJxYchAoGBAIqL001AzUZ5X94a7M/EcLtO1ox10wfdb6hi
2zN9/6V6aRwGDBYDg5TVXbd59DlkffUgDTy+TcOT7wF7QeYj580v4qVHushhev1w
gbMEJ1bjtIAJWr117LmUfTW/OzLqwuXfhaEIVJv2pHH2DZbfZk1b4GEbtTMBdINP
liGCipiJAoGBAKzbXbiQvEfgJwDy61ly/MM7iVNIYgzzb0oJtp3PyOBUSx8DE8ZT
rWRCplTX0NCp2yUJ6+Ick4S4lYnmdqpYoRFLS/JixPb/Cxp9BE3RoJVCKtX/g9Yu
O9AJlOMmkr+/ilubx0ros+4a3Ymto/rrnch7ZgYqJq8aW9DpiPjZfkZc
-----END RSA PRIVATE KEY-----
)

default['jenkins']['admin']['public_key'] = 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDv277N4LdJjQEN/kwbH5r1e3kkpLBUjqAqlj2J+1ctO57hXuNPDP2eeB854UngZUc4QTThwhZdR2PdhtcKMc3XiTA5wcoN3l7SibJ+sk/MMFVupzuz3hBUidLn4KupnGHL0NYZmLpU6D163OCQUQNfaTJSKNE2GHfHQD2kLhCQaaMWupPzGU+oRT9KJHk9yY1HRBP0S893Y9CeG0pJS1B8U4E4rymJr96/IwBEOHQmYPFmcrRGPtRGwNMhRbZUgVNKFJAbyLahvbsppRtwNbXBntBFnGZoxQ2IDHI/Oq6+BIaVVQalqyR0RrGRSJWyWXrTS9EAAtXXqpwBPgcC/kPB'

default['jenkins']['jobs'] = %w(sample-cookbook-verify sample-cookbook-accept sample-cookbook-ship)
default['jenkins']['credentials']['username'] = 'alexmanly'
default['jenkins']['credentials']['password'] = 'f196f8ec882f54d77867feb7f26c274835ea4f01'
default['jenkins']['git']['cookbook']['repo'] = 'https://github.com/alexmanly/sample-cookbook'
default['jenkins']['git']['chef']['repo'] = 'https://github.com/alexmanly/chef-repo'
default['jenkins']['chef']['identity'] = 'apm-chefconf2015'
default['jenkins']['chef']['user_pem'] = %q(
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA5CUBUIWGvtXrBWDRE1kST/gKax83n8hZwDaAzdgC+O9/Djls
wEKDWrsiMYe/qPwKrBP40ahy7t5zTIMEaPh79O7PeE2IPeNGlO3FjvDDfl/EKHGA
tI1tCSQtBk8TwX4aA4qhhWApWvDJeW0x0DLAiqAqBhxzQns3i+gLYNgnAFk4K8f7
MHL1L9b5IXTmj3oMF8RRS+E2sUOVHtyNs4OY/tNE/rtNKM3jTt1o80RQf2j+gfGs
Zn/YQrDcl9IRMyk7bTz0oEeo0QKKAS9Bwh8YlLAPEodfF0QmtvPErsfH+tRVi1dZ
ZzTLCjCDG2VCUvUBifVGUL6naJ+cr9qZP+dvPQIDAQABAoIBAQCzUHqGBUzw9UWx
hnUN1fZUsEnQBEs95MTWFICMSXmcmvCsB2p4ek6vo2GuuFllwiPJODFa6CDdqi3J
NzjiIFudGY4rqhSpP9cb+v5J6OZej3qnpv5X6siGZM6WpNSMQkbD/dQR9pDKj3Jr
Y+3BDALVcilVgEr/N8Viy1EWHw4YcIuVjxAyFlurG9gKeHBxAqtvi46hf9R8R7HB
YTCuXmZIfMrZjACuOhJPIPz8mIwn570ysbbAxqnMVz0mz6Mdddyvdsc+uQLs+7gc
QQuJUs4XNz0W6iOeYRbszcL5uIDJWEzlS5XJHPD0Geiq6xM14PiNknjr4YbXSjXt
lRBUK7XpAoGBAPJIvqwSPR548sAkmFxWXMmDDCJpIK61be3k2L6v/0Iu4cm2ZkrR
kPk+UCdc+I/knDTT6Zzfvtk+91C9sm6r7QtlSm+TE29lTCKqbtFP8CfaISqMqLXl
oBz6+ArXAtWNuBTjnFwSid/EywteD+JwkAxkmb7bmg3xBc1dyGE2zqu7AoGBAPEP
WEg5V9+2bT9Ju9BDBM5QVqmoOWErDsmA814t2u56w35K6YTR0m0nqlRgGzjxnWYz
MNEP6AlyRTF9KZhN/y0hyJmZg2B24bS9iJu7axG4CWtV/lYiXBjacgfffDb96IEy
SgIbupBgTyEPbX9yzx9lu44lNGj/IABTLfOQXhVnAoGAOSDX/MDMMow4SQAYAOXI
OSeyS8bYEvnqssZcKRJcsOFXEfX1Rr0FXw/HXJC6d0tjXb19/yRu3tDPBfXExf26
Bg7bL1XRplmPSzk+qhIcQXlYiqzh9wnu6AZxSDUMkQg6mIpWywsAAYhojASg4DbE
cHekHPGw8IqdYKA1aF7A+pMCgYEAoLHCACN52MAbg5z7fpGumnojy2VBGu1BJkK3
+YhH8cIUoBQAJ3JX/Dv859JJU2R9sKtfV35rCCEMzzjIiac0/DkRKJOVaLDXNU1D
y8zcSyuL2+mvamvtSQQWD/mDLIWGgNmtTEp/y87n8Pn/3H4EZMHEjbVvgq7P/md0
snECxvECgYAJ0uvYY3GSpLsl4q7c4OtkuZMdaWFt23N3NJy7K46LqL9NGqFqjsIA
5N0lR4pIl1Y07fTPE2foxW/c9hSNPmyUfWvRne4tPp8WbUjrVT8DWNWn2gjIGiIm
qLJ+dl9Wr7EpbzjMOEsz+54ZUR5T7c2jEThfpUJ5YfZYoA1ePDM7Lw==
-----END RSA PRIVATE KEY-----
)
default['jenkins']['chef']['user_pem'] = %q(
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "alexmanly"
client_key               "#{current_dir}/user.pem"
chef_server_url          "https://api.opscode.com/organizations/apm-chefconf2015"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]
)