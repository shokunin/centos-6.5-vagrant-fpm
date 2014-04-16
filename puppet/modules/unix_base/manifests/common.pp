class unix_base::common inherits unix_base {

#################################################
# Set any packages by OS
  if $::operatingsystem == "CentOS" {
    $vim_pkg = 'vim-enhanced'
    $git_pkg = 'git'
  }

  if $::operatingsystem == "Ubuntu" {
    $vim_pkg = 'vim'
    $git_pkg = 'git-core'
  }
#################################################

  # diagnostic packages

  package { 'lsof' :
    ensure => installed
  }

  package { 'sysstat' :
    ensure => installed
  }

  package { 'iotop' :
    ensure => installed
  }

  package { 'tree' :
    ensure => installed
  }

# Nice to haves

  package { $vim_pkg :
    ensure => installed
  }

  package { $git_pkg :
    ensure => installed
  }

}
