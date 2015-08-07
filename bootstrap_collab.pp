#####
# puppet bootstrap on collaborative projects systems
# the machine must already be a registered host with an IPA server.
# currently supports oVirt and GCE type systems
##

file { '/etc/pki/puppet':
  ensure  => directory,
  owner   => 'root',
  group   => 'root',
  mode    => '0771',
}

file { '/etc/pki/puppet/certs':
  ensure  => directory,
  owner   => 'root',
  group   => 'root',
  mode    => '0755',
  require => [
    File['/etc/pki/puppet'],
  ],
}

file { '/etc/pki/puppet/private':
  ensure  => directory,
  owner   => 'root',
  group   => 'root',
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
  ensure => file,
  owner  => 'root',
  group  => 'root',
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
  content => "export PATH=\${PATH}:/opt/puppetlabs/bin:/usr/local/bin",
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
path = /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/opt/puppetlabs/bin:/opt/puppetlabs/puppet/bin

",
}

# for gce systems, we want to fixup the hostname stuff

if $::hostname =~ /^gce.\*/ {

  package { 'dnsmasq':
    ensure => present,
  }

  file { '/etc/dnsmasq.conf':
    ensure   => present,
    owner    => 'root',
    group    => 'root',
    mode     => '0644',
    content  => '# managed by puppet - DO NOT EDIT
no-resolv
server=/codeaurora.org/172.30.0.254
server=/30.172.in-addr.arpa/172.30.0.254
server=/30.10.in-addr.arpa/172.30.0.254
server=169.254.169.254
listen-address=127.0.0.1
',
    require  => Package['dnsmasq'],
    notify   => Service['dnsmasq'],
  }

  service { 'dnsmasq':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    hasstatus  => true,
    require    => [
      File['/etc/dnsmasq.conf'],
    ],
  }

 # Make sure PEERDNS=no is in ifcfg-eth0
  augeas { 'eth0-nopeerdns':
    context => '/files/etc/sysconfig/network-scripts/ifcfg-eth0',
    changes => 'set PEERDNS no',
  }

  # unbreak GCE's idiotic forcing of hostname
  file { '/usr/local/bin/gce-fix-hostname.sh':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content  => '# managed by puppet - DO NOT EDIT

declare -r MDS=http://metadata/0.1/meta-data
declare -r MDS_TRIES=${MDS_TRIES:-100}

function get_metadata_value() {
  local readonly varname=$1
  local readonly tmpfile=$(mktemp)
  curl -f ${MDS}/${varname} > ${tmpfile} 2>/dev/null
  local return_code=$?
  if [[ ${return_code} == 0 ]]; then
    cat ${tmpfile}
  else
    echo "curl for ${varname} returned ${return_code}" > /dev/console
  fi
  rm -f ${tmpfile}
  return ${return_code}
}

function get_metadata_value_with_retries() {
  local readonly varname=$1
  local return_code=1  # General error code.
  for ((count=0; count <= ${MDS_TRIES}; count++)); do
   get_metadata_value $varname
    return_code=$?
    case $return_code in
      # No error.  We are done.
      0) exit ${return_code};;
      # Failed to connect to host.  Retry.
      7) sleep 0.1; continue;;
      # A genuine error.  Exit.
      *) exit ${return_code};
    esac
  done
  # Exit with the last return code we got.
  exit ${return_code}
}

# Grab our metadata override
fqdn="$(get_metadata_value_with_retries attributes/x-cpit-fqdn)"

if [ -z "$fqdn" ]; then
  # Use the hostname and ci.codeaurora.org to put it together
  hostname="$(get_metadata_value_with_retries hostname)"

  # if that fails, fall back to our current hostname
  if [ -z "$hostname" ]; then
    hostname="$(hostname)"
  fi

  fqdn="${hostname%%.*}.ci.codeaurora.org"
fi

# if it already matches our hostname, then exit
if [ "$fqdn" == "$(hostname)" ]; then
  exit 0
fi

if [ -n "$fqdn" ]; then
  sed -i "/Added by Google/d" /etc/hosts
  # Add an entry for our ip address in /etc/hosts.
  echo "$(hostname -i) ${fqdn} ${fqdn%%.*}  # Added by Google" >> /etc/hosts
  hostname "$fqdn"
  # Let syslogd and sssd know we have changed the hostname.
  pkill -HUP syslogd
  pkill -HUP sssd
fi
',
  }

  file { '/etc/cron.d/gce-fix-hostname':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => '# managed by puppet - DO NOT EDIT
MAILTO=root

@reboot   root /usr/local/bin/gce-fix-hostname.sh
0 * * * * root /usr/local/bin/gce-fix-hostname.sh
',
    require  => File['/usr/local/bin/gce-fix-hostname.sh'],
    checksum => 'md5',
  }

}
# end GCE systems


/* vim: set ts=2 sw=2 tw=0 et :*/
