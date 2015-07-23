#####
# basic configuration bootstrap for R10k
##

# Expect that /root/.ssh/config will have been setup to handle the User
# properly for gerrit checkouts

class { 'r10k':
  version     => present,
  sources     => {
    'puppet'    => {
      'remote'  => 'ssh://gerrit.linuxfoundation.org:29418/puppet/master.git',
      'basedir' => "${::settings::codedir}/environments",
      'prefix'  => false,
    },
    'hiera'     => {
      'remote'  => 'ssh://gerrit.linuxfoundation.org:29418/puppet/hiera.git',
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
