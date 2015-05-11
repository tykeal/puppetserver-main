#####
# basic configuration bootstrap for R10k
##

class { 'r10k':
  version     => present,
  sources     => {
    'puppet'    => {
      'remote'  => 'git-lf-infra@git.linuxfoundation.org:resources/new-puppet/master.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    },
    'hiera'     => {
      'remote'  => 'git-lf-infra@git.linuxfoundation.org:resources/new-puppet/hiera.git',
      'basedir' => "${::settings::confdir}/hiera",
      'prefix'  => false,
    }
  },
  manage_modulepath => false,
}

# removed purgedirs per puppetlabs ticket #RK-57
