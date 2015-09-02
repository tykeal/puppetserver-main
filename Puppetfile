forge 'http://forge.puppetlabs.com'

# Modules from the Puppet Forge

mod 'camptocamp/augeas', '1.2.1'
mod 'camptocamp/postfix', '1.2.10'
mod 'camptocamp/puppetserver', '0.9.0'
mod 'camptocamp/selinux', '0.1.19'
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
mod 'ghoneycutt/common', :latest
#mod 'ghoneycutt/nfs', :latest
# override forge module as it is broken for EL7
mod 'nfs',
  :git => 'https://github.com/ghoneycutt/puppet-module-nfs.git',
  :branch => 'el7'
mod 'ghoneycutt/rpcbind', :latest
mod 'ghoneycutt/types', :latest
mod 'ghoneycutt/vim', '2.10.0'
#mod 'jamtur01/opsgenie', '0.0.1'
# override forge module as it refuses to install
mod 'opsgenie',
  :git => 'https://github.com/jamtur01/puppet-opsgenie',
  :ref => 'b557acea9a1dc363fdb27f60c2a747b64699645d'

mod 'jfryman/nginx', '0.2.1'
mod 'maestrodev/wget', '1.5.7'
mod 'mthibaut/users', '1.0.11'
mod 'pdxcat/nrpe', '2.0.0'
mod 'puppetlabs/apache', '1.5.0'
mod 'puppetlabs/concat', '1.2.3'
mod 'puppetlabs/firewall', '1.6.0'
mod 'puppetlabs/gcc', '0.3.0'
mod 'puppetlabs/git', '0.4.0'
mod 'puppetlabs/inifile', :latest
mod 'puppetlabs/java', '1.3.0'
mod 'puppetlabs/mysql', '3.4.0'
mod 'puppetlabs/ntp', :latest
mod 'puppetlabs/puppetdb', '5.0.0'
mod 'puppetlabs/postgresql', '4.4.2'
mod 'puppetlabs/ruby', :latest
mod 'puppetlabs/stdlib', '4.6.0'
mod 'puppetlabs/vcsrepo', :latest
#mod 'rtyler/jenkins', '1.3.0'
# temporary override to get the latest dev bits
mod 'jenkins',
  :git => 'https://github.com/jenkinsci/puppet-jenkins.git',
  :ref => '21dd8b5a0aa9b65531f0b1955b3d51c77ceb1a7f'
mod 'saz/dnsmasq', '1.2.0'
mod 'saz/resolv_conf', '3.0.3'
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
mod 'tykeal/gerrit', '0.9.0'
#mod 'tykeal/nagios', ''
mod 'nagios',
  :git => 'https://github.com/tykeal/puppet-nagios.git',
  :ref => '16394998947f210caa025a7913314b8840e31236'
mod 'tykeal/sslmgmt', '1.0.0'
mod 'zack/r10k', '2.8.0'

mod 'bacula',
  :git => 'https://github.com/jordanconway/puppet-bacula.git'

mod 'pam',
  :git => 'https://github.com/herlo/puppet-module-pam.git'

mod 'nsswitch',
  :git => 'https://github.com/herlo/puppet-module-nsswitch.git'

mod 'totpcgi',
  :git => 'https://github.com/herlo/puppet-totpcgi.git'


# custom modules

# expect that /root/.ssh/config will have been setup to specify the
# correct User for gerrit.linuxfoundation.org
mod 'profile',
  :git => 'ssh://gerrit.linuxfoundation.org:29418/puppet/modules/profile.git'

mod 'role',
  :git => 'ssh://gerrit.linuxfoundation.org:29418/puppet/modules/role.git'

# firewall bits
mod 'local_fw',
  :git => 'ssh://gerrit.linuxfoundation.org:29418/puppet/modules/local_fw.git'

mod 'mailman3',
  :git => 'ssh://gerrit.linuxfoundation.org:29418/puppet/modules/mailman3.git',
  :ref => '104f4fa4bc7988b4da58ea9b757b944d82884d12'

# vim: sw=2 sts=2 ts=2 et :
