#####
# basic configuration bootstrap for R10k
##

# Expect that /root/.ssh/config will have been setup to handle the User
# properly for gerrit checkouts

file { '/etc/puppetlabs/r10k':
  ensure => directory,
  before => Class['r10k'],
}

class { 'r10k':
  version       => present,
  sources       => {
    'puppet'    => {
      'remote'  => 'https://github.com/tykeal/puppetserver-main.git',
      'basedir' => "${::settings::codedir}/environments",
      'prefix'  => false,
    },
    'hiera'     => {
      'remote'  => 'https://github.com/tykeal/puppetserver-hiera.git',
      'basedir' => "${::settings::codedir}/hieradata",
      'prefix'  => false,
    }
  },
  manage_modulepath => false,

# These stanzas broke this manifest for me, but you might still want the content
#  file { '/etc/profile.d/r10k.sh':
#    content => "export PATH=\${PATH}:/usr/local/bin",
#    owner   => 'root',
#    group   => 'root',
#    mode    => '0644',
#  }

#  exec { 'source_r10k_path':
#    command     => "source /etc/profile.d/r10k.sh",
#    refreshonly => true,
#    require     => [
#      File['/etc/profile/r10k.sh'],
#    ],
#  }
}

/* vim: set ts=2 sw=2 tw=0 et :*/
