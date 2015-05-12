#####
# basic configuration bootstrap for R10k
##

class { 'r10k':
  version     => present,
  sources     => {
    'puppet'    => {
      'remote'  => 'ssh://pdx-wl-puppet_rsa@gerrit.linuxfoundation.org:29418/puppet/master.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
    'hiera'     => {
      'remote'  => 'ssh://pdx-wl-puppet_rsa@gerrit.linuxfoundation.org:29418/puppet/hiera.git',
      'basedir' => "${::settings::confdir}/hiera",
      'prefix'  => false,
    }
  },
  manage_modulepath => false,
}

# removed purgedirs per puppetlabs ticket #RK-57
