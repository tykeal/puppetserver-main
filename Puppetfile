forge 'http://forge.puppetlabs.com'

# Modules from the Puppet Forge

# Camptocamp
mod 'camptocamp/archive', '0.8.1'
mod 'camptocamp/augeas', '1.4.2'
mod 'camptocamp/dell', '0.4.0'
mod 'camptocamp/postfix', '1.2.10'
mod 'camptocamp/puppetserver', '2.1.0'
mod 'camptocamp/selinux', '0.3.1'

mod 'croddy/make', '0.0.5'
mod 'darin/zypprepo', '1.0.2'
#mod 'datacentred/external_facts', '1.0.0'
mod 'external_facts',
  :git => 'https://github.com/tykeal/datacentred-external_facts.git',
  :ref => 'enable_puppet4'
mod 'dhoppe/screen', '1.1.1'
mod 'dprince/qpid', '1.0.3'
mod 'engage/uwsgi', '1.2.0'
mod 'garethr/erlang', '0.3.0'
mod 'gentoo/portage', '2.3.0'

# ghoneycutt
mod 'ghoneycutt/common', '1.5.0'
#mod 'ghoneycutt/nfs', :latest
# NOTE: last check (v1.11.2) still did not support EL7
# override forge module as it is broken for EL7
mod 'nfs',
  :git => 'https://github.com/ghoneycutt/puppet-module-nfs.git',
  :branch => 'el7'
mod 'ghoneycutt/nsswitch', '1.4.0'
# fork of ghoneycutt/pam (was originally forked by herlo but since he isn't here
# anymore tykeal pulled a fork so we could pin to an LF employee till we can get
# changes pushed into upstream
mod 'pam',
  :git => 'https://github.com/tykeal/puppet-module-pam.git',
  :ref => 'f604cd2a9c7e884acbc261c226420d862affe8cc'
mod 'ghoneycutt/rpcbind', '1.4.0'
mod 'ghoneycutt/types', '1.9.0'
mod 'ghoneycutt/vim', '2.11.0'

mod 'herculesteam/augeasproviders_core', '2.1.2'
mod 'kemra102/auditd', '2.0.0'
mod 'kemra102/ius', '1.1.0'
mod 'hubspot/nexus', '1.3.3'
mod 'jfryman/nginx', '0.3.0'
mod 'maestrodev/wget', '1.7.3'
mod 'mkrakowitzer/deploy', '0.0.3'
# point to a git version so we can do some debugging to create some patches
#mod 'mthibaut/users', '1.0.11'
mod 'users',
  :git => 'https://github.com/tykeal/puppet-users',
  :ref => '47559be0582fe95951507ae4ce1c17b4eb9de907'
mod 'nanliu/staging', '1.0.3'

# Openstack
mod 'openstack/cinder', '7.0.0'
mod 'openstack/glance', '7.0.0'
mod 'openstack/horizon', '7.0.0'
mod 'openstack/keystone', '7.0.0'
mod 'openstack/neutron', '7.0.0'
mod 'openstack/nova', '7.0.0'
mod 'openstack/openstacklib', '7.0.0'
mod 'openstack/openstack_extras', '7.0.0'
mod 'openstack/vswitch', '3.0.0'

mod 'pdxcat/nrpe', '2.0.0'

# Puppet community
mod 'puppet/jira', '1.3.0'
mod 'puppet/mcollective', '2.1.1'

# Puppetlabs
mod 'puppetlabs/apache', '1.10.0'
mod 'puppetlabs/apt', '2.2.2'
mod 'puppetlabs/concat', '2.1.0'
mod 'puppetlabs/corosync', '0.7.0'
mod 'puppetlabs/firewall', '1.8.1'
mod 'puppetlabs/gcc', '0.3.0'
mod 'puppetlabs/git', '0.4.0'
mod 'puppetlabs/inifile', '1.5.0'
mod 'puppetlabs/java', '1.5.0'
mod 'puppetlabs/java_ks', '1.4.1'
mod 'puppetlabs/mysql', '3.8.0'
mod 'puppetlabs/ntp', '4.2.0'
mod 'puppetlabs/pe_gem', '0.2.0'
mod 'puppetlabs/puppetdb', '5.1.2'
mod 'puppetlabs/postgresql', '4.7.1'
mod 'puppetlabs/rabbitmq', '5.4.0'
mod 'puppetlabs/ruby', '0.5.0'
mod 'puppetlabs/stdlib', '4.12.0'
mod 'puppetlabs/tagmail', '2.1.1'
mod 'puppetlabs/tomcat', '1.5.0'
mod 'puppetlabs/vcsrepo', '1.3.2'
mod 'puppetlabs/xinetd', '2.0.0'

mod 'richardc/datacat', '0.6.2'
mod 'rtyler/jenkins', '1.5.0'

# saz
mod 'saz/dnsmasq', '1.2.0'
mod 'saz-memcached', '2.8.1'
mod 'saz/resolv_conf', '3.0.5'
mod 'saz/rsyslog', '3.5.1'
mod 'saz/ssh', '2.8.1'
mod 'saz/sudo', '3.1.0'
mod 'saz/timezone', '3.3.0'

#mod 'srf/rkhunter', '0.1.4'
# temporary override
mod 'rkhunter',
  :git => 'https://github.com/mmz-srf/puppet-rkhunter.git',
  :ref => '803ebabed06c4052ec03afdc876604abb2ac136e'
mod 'stahnma/epel', '1.2.2'
mod 'stankevich/python', '1.11.0'

mod 'thias/sysctl', '1.0.6'

# tykeal
mod 'tykeal/clm', '1.0.0'
mod 'tykeal/gerrit', '1.0.0'
mod 'tykeal/ini_config', '1.1.0'
mod 'tykeal/jjb', '1.0.2'

#mod 'tykeal/nagios', ''
mod 'nagios',
  :git => 'https://github.com/tykeal/puppet-nagios.git',
  :ref => '561569e89cf0b9e22a7ecd735b79ae3b07773868'
#mod 'tykeal/nodepool', ''
mod 'nodepool',
  :git => 'https://github.com/tykeal/puppet-nodepool.git'
mod 'tykeal/sslmgmt', '1.0.1'
#mod 'tykeal/zuul', ''
mod 'zuul',
  :git => 'https://github.com/tykeal/puppet-zuul.git'
mod 'zack/r10k', '3.2.0'

# fork of herlo/totpcgi that has never hit the forge. Since herlo isn't here
# anymore tykeal pulled a fork so we could pin to an LF employee till we can
# re-evaluate / get released to the forge
mod 'totpcgi',
  :git => 'https://github.com/tykeal/puppet-totpcgi.git',
  :ref => '8bcff1bb7d9c71cac783da9e03fb0d44dc7754ef'


# custom modules

# correct User for gerrit.linuxfoundation.org
mod 'profile',
  :git => 'https://github.com/tykeal/puppetserver-mod-profile.git'

mod 'role',
  :git => 'https://github.com/tykeal/puppetserver-mod-role.git'

mod 'local_fw',
  :git => 'https://github.com/tykeal/puppetserver-mod-local_fw.git'

# vim: sw=2 sts=2 ts=2 et :
