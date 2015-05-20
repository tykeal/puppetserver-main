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
}
