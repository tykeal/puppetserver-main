forge 'http://forge.puppetlabs.com'

# Modules from the Puppet Forge

mod 'camptocamp/archive', '0.8.1'
mod 'camptocamp/augeas', '1.2.1'
mod 'camptocamp/dell', '0.3.1'
mod 'camptocamp/postfix', '1.2.10'
mod 'camptocamp/puppetserver', '0.9.0'
mod 'camptocamp/selinux', '0.1.19'
mod 'croddy/make', '0.0.5'
#mod 'datacentred/external_facts', '1.0.0'
mod 'external_facts',
  :git => 'https://github.com/tykeal/datacentred-external_facts.git',
  :ref => 'enable_puppet4'
#mod 'dhoppe/screen', '1.0.3'
# override dhoppe/screen until they support RedHat family installation
mod 'screen',
  :git => 'https://github.com/tykeal/puppet-screen',
  :ref => 'a9ea1942b8c00dccae5ba2ca4cf13c67f851bb6e'
mod 'engage/uwsgi', '1.2.0'
mod 'garethr/erlang', '0.3.0'
mod 'gentoo/portage', '2.3.0'
mod 'ghoneycutt/common', '1.3.0'
#mod 'ghoneycutt/nfs', :latest
# override forge module as it is broken for EL7
mod 'nfs',
  :git => 'https://github.com/ghoneycutt/puppet-module-nfs.git',
  :branch => 'el7'
mod 'ghoneycutt/rpcbind', '1.4.0'
mod 'ghoneycutt/types', '1.9.0'
mod 'ghoneycutt/vim', '2.10.0'
mod 'kemra102/auditd', '2.0.0'
mod 'jfryman/nginx', '0.2.7'
mod 'maestrodev/wget', '1.5.7'
mod 'mthibaut/users', '1.0.11'
mod 'nanliu/staging', '1.0.3'

mod 'openstack/cinder', '6.1.0'
mod 'openstack/glance', '6.1.0'
mod 'openstack/horizon', '6.1.0'
mod 'openstack/keystone', '6.1.0'
mod 'openstack/neutron', '6.1.0'
mod 'openstack/nova', '6.1.0'
mod 'openstack/openstack_extras', '6.0.0'

mod 'pdxcat/nrpe', '2.0.0'
mod 'puppet/jira', '1.3.0'
mod 'puppet/mcollective', '2.1.1'
mod 'puppetlabs/apache', '1.5.0'
mod 'puppetlabs/concat', '1.2.4'
mod 'puppetlabs/firewall', '1.7.1'
mod 'puppetlabs/gcc', '0.3.0'
mod 'puppetlabs/git', '0.4.0'
mod 'puppetlabs/inifile', '1.4.2'
mod 'puppetlabs/java', '1.3.0'
mod 'puppetlabs/java_ks', '1.3.1'
mod 'puppetlabs/mysql', '3.4.0'
mod 'puppetlabs/ntp', '4.1.0'
mod 'puppetlabs/pe_gem', '0.1.1'
mod 'puppetlabs/puppetdb', '5.0.0'
mod 'puppetlabs/postgresql', '4.4.2'
mod 'puppetlabs/rabbitmq', '5.2.3'
mod 'puppetlabs/ruby', '0.4.0'
mod 'puppetlabs/stdlib', '4.9.0'
mod 'puppetlabs/tagmail', '2.1.0'
mod 'puppetlabs/vcsrepo', '1.3.1'
mod 'richardc/datacat', '0.6.2'
mod 'rtyler/jenkins', '1.5.0'
mod 'saz/dnsmasq', '1.2.0'
mod 'saz/resolv_conf', '3.0.3'
mod 'saz/rsyslog', '3.5.1'
mod 'saz/ssh', '2.4.0'
mod 'saz/sudo', '3.0.9'
mod 'saz/timezone', '3.3.0'
#mod 'srf/rkhunter', '0.1.4'
# temporary override
mod 'stahnma/epel', '1.0.2'
mod 'rkhunter',
  :git => 'https://github.com/mmz-srf/puppet-rkhunter.git',
  :ref => '803ebabed06c4052ec03afdc876604abb2ac136e'
mod 'stankevich/python', '1.9.4'

mod 'thias/sysctl', '1.0.0'
mod 'tykeal/clm', '0.1.2'
mod 'tykeal/gerrit', '0.9.2'
#mod 'tykeal/nagios', ''
mod 'nagios',
  :git => 'https://github.com/tykeal/puppet-nagios.git',
  :ref => '51f17af90fdee229f7361bff40eaea49cb341063'
mod 'tykeal/sslmgmt', '1.0.0'
mod 'zack/r10k', '3.1.1'

mod 'pam',
  :git => 'https://github.com/herlo/puppet-module-pam.git'

mod 'nsswitch',
  :git => 'https://github.com/herlo/puppet-module-nsswitch.git'

mod 'totpcgi',
  :git => 'https://github.com/herlo/puppet-totpcgi.git'


# custom modules

# correct User for gerrit.linuxfoundation.org
mod 'profile',
  :git => 'https://github.com/tykeal/puppetserver-mod-profile.git'

mod 'role',
  :git => 'https://github.com/tykeal/puppetserver-mod-role.git'

# use the local_fw from LF
# firewall bits
mod 'local_fw',
  :git => 'https://gerrit.linuxfoundation.org/infra/p/puppet/modules/local_fw.git'

# vim: sw=2 sts=2 ts=2 et :
