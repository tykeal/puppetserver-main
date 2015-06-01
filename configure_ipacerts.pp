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
  require => [
  force   => true,
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
  content => "export PATH=\$\{PATH}:/opt/puppetlabs/bin",
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
}

# get the certificate for a valid service

exec { "create_${::fqdn}_cert":
  command => "ipa-getcert request -K puppet/${::fqdn} -f /etc/pki/puppet/certs/${::fqdn}.pem -k /etc/pki/puppet/private/${::fqdn}.pem",
  path    => "/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/puppetlabs/puppet/bin:/root/bin",
  creates => [
    "/etc/pki/puppet/certs/${::fqdn}.pem",
    "/etc/pki/puppet/private/${::fqdn}.pem",
  ],
  require => [
    File['/etc/pki/puppet/certs'],
    File['/etc/pki/puppet/private'],
    File['ipa_sysrestore.state'],
    Service['certmonger'],
  ],
}

# vim: sw=2 sts=2 ts=2 et :
