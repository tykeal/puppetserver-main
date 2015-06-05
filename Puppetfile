forge 'http://forge.puppetlabs.com'

# Modules from the Puppet Forge

mod 'camptocamp/augeas', '1.2.1'
mod 'camptocamp/puppetserver', '0.9.0'
mod 'datacentred/external_facts', '1.0.0'
#mod 'dhoppe/screen', '1.0.3'
# override dhoppe/screen until they support RedHat family installation
mod 'screen',
  :git => 'https://github.com/tykeal/puppet-screen',
  :ref => 'a9ea1942b8c00dccae5ba2ca4cf13c67f851bb6e'
mod 'ghoneycutt/vim', '2.10.0'
#mod 'jamtur01/opsgenie', '0.0.1'
# override forge module as it refuses to install
mod 'opsgenie',
  :git => 'https://github.com/jamtur01/puppet-opsgenie',
  :ref => 'b557acea9a1dc363fdb27f60c2a747b64699645d'

mod 'jfryman/nginx', '0.2.1'
mod 'maestrodev/wget', '1.5.7'
mod 'mjhas/postfix', '1.0.0'
mod 'mthibaut/users', '1.0.11'
mod 'puppetlabs/apache', '1.4.1'
mod 'puppetlabs/concat', '1.2.2'
mod 'puppetlabs/firewall', '1.5.0'
mod 'puppetlabs/gcc', '0.3.0'
mod 'puppetlabs/git', '0.3.0'
mod 'puppetlabs/inifile', :latest
mod 'puppetlabs/java', '1.2.0'
mod 'puppetlabs/mysql', '3.3.0'
mod 'puppetlabs/ntp', :latest
mod 'puppetlabs/puppetdb', '4.2.1'
mod 'puppetlabs/postgresql', '4.3.0'
mod 'puppetlabs/ruby', :latest
mod 'puppetlabs/stdlib', '4.6.0'
mod 'puppetlabs/vcsrepo', :latest
#mod 'rtyler/jenkins', '1.3.0'
# temporary override to get the latest dev bits
mod 'jenkins',
  :git => 'https://github.com/jenkinsci/puppet-jenkins.git',
  :ref => '21dd8b5a0aa9b65531f0b1955b3d51c77ceb1a7f'
mod 'saz/resolv_conf', '3.0.3'
mod 'saz/ssh', '2.4.0'
mod 'saz/sudo', '3.0.9'
mod 'saz/timezone', '3.3.0'
#mod 'srf/rkhunter', '0.1.4'
# temporary override
mod 'rkhunter',
  :git => 'https://github.com/mmz-srf/puppet-rkhunter.git',
  :ref => '803ebabed06c4052ec03afdc876604abb2ac136e'

mod 'thias/sysctl', '1.0.0'
# not released to puppetforge yet
# mod 'tykeal/gerrit'
mod 'gerrit',
  :git => 'https://github.com/tykeal/puppet-gerrit.git'
mod 'tykeal/sslmgmt', '0.1.0'
#mod 'sslmgmt',
#  :git => 'https://github.com/tykeal/puppet-sslmgmt.git'
mod 'zack/r10k', '2.8.0'

mod 'ghoneycutt/pam', '2.19.0'

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

# vim: sw=2 sts=2 ts=2 et :
