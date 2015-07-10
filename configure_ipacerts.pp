#####
# setup puppet certs on new system using IPA
# the machine must already be a registered host with an IPA server.
##

file { '/etc/pki/puppet':
  ensure  => directory,
  owner   => 'puppet',
  group   => 'puppet',
  mode    => '0771',
}

file { '/etc/pki/puppet/certs':
  ensure  => directory,
  owner   => 'puppet',
  group   => 'puppet',
  mode    => '0755',
  require => [
    File['/etc/pki/puppet'],
  ],
}

file { '/etc/pki/puppet/private':
  ensure  => directory,
  owner   => 'puppet',
  group   => 'puppet',
  mode    => '0750',
  require => [
    File['/etc/pki/puppet'],
  ],
}

file { '/etc/pki/puppet/private_keys':
  ensure  => link,
  target  => '/etc/pki/puppet/private',
  require => [
    File['/etc/pki/puppet/private'],
  ],
}

file { '/etc/pki/puppet/public_keys':
  ensure  => link,
  target  => '/etc/pki/puppet/certs',
  force   => true,
  require => [
    File['/etc/pki/puppet'],
  ],
}

file { '/etc/pki/puppet/certs/ca.pem':
  ensure  => link,
  target  => '/etc/ipa/ca.crt',
  force   => true,
  require => [
    File['/etc/pki/puppet/certs'],
    File['/etc/ipa/ca.crt'],
  ],
}

# has machine been enrolled in IPA?

file { '/etc/ipa/ca.crt':
  ensure  => file,
}

file { 'ipa_sysrestore.state':
  name   => '/var/lib/ipa-client/sysrestore/sysrestore.state',
  ensure => file,
}

service { 'certmonger':
  ensure  => running,
  enable  => true,
}

file { '/etc/profile.d/puppet.sh':
  content => "export PATH=\${PATH}:/opt/puppetlabs/bin",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

### THIS IS A TEMPORARY SOLUTION UNTIL THE IPA CLI IS FIXED ###
# hack the ipa command to work with the proper API_VERSION

file { '/usr/bin/ipa3':
  owner => root,
  group => root,
  mode  => '0755',
  content => "#!/usr/bin/python

import ipapython.version
ipapython.version.API_VERSION=u'2.49'
import sys
from ipalib import api, cli
if __name__ == '__main__':
    cli.run(api)

",
}

# create the puppet service
#
#exec { "kinit_svcadmin":
#  command => "/usr/bin/kinit -k -t /etc/ipa/svcadmin.keytab svcadmin",
#  unless  => "/usr/bin/klist",
#}

exec { "create_puppet_${::fqdn}_service":
  command => "/usr/bin/ipa3 service-add puppet/${::fqdn}",
  unless  => "/usr/bin/ipa3 service-show puppet/${::fqdn}",
  require => [
    File['/usr/bin/ipa3'],
  ],
}

# get the certificate for a valid service

exec { "create_${::fqdn}_cert":
  command => "ipa-getcert request -K puppet/${::fqdn} -f /etc/pki/puppet/certs/${::fqdn}.pem -k /etc/pki/puppet/private/${::fqdn}.pem",
  path    => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/puppet/bin:/root/bin",
  onlyif  => "/usr/bin/klist",
  creates => [
    "/etc/pki/puppet/certs/${::fqdn}.pem",
    "/etc/pki/puppet/private/${::fqdn}.pem",
  ],
  require => [
    File['/etc/pki/puppet/certs'],
    File['/etc/pki/puppet/private'],
    File['ipa_sysrestore.state'],
    Service['certmonger'],
    Exec["create_puppet_${::fqdn}_service"],
  ],
}

# make a simple puppet.conf - one time setup

file { '/etc/puppetlabs/puppet/puppet.conf':
  owner   => root,
  group   => root,
  mode    => '0644',
  content => "[agent]
server = pdx-wl-puppet.int.codeaurora.org
ssldir = /etc/pki/puppet
cacert = /etc/ipa/ca.crt

",
}

/* vim: set ts=2 sw=2 tw=0 et :*/
