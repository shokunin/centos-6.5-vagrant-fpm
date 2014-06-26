# install and configure fpm for the building of RPMS
class packagebuild {

  file { '/etc/pki/rpm-gpg/RPM-GPG-KEY-remi':
    ensure => present,
    owner  => root,
    group  => root,
    mode   => '0644',
    source => 'puppet:///modules/packagebuild/remi.repo'
  }

  yumrepo { 'remi':
    descr      => 'remi for php - Les RPM de remi pour Enterprise Linux 6',
    enabled    => 1,
    mirrorlist => 'http://rpms.famillecollet.com/enterprise/6/remi/mirror',
    gpgcheck   => 1,
    gpgkey     => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi',
    require    => File['/etc/pki/rpm-gpg/RPM-GPG-KEY-remi'],
  }

  package { 'ruby-devel':
    ensure => latest,
  }

  package { 'rpm-build':
    ensure => latest,
  }

  package { 'fpm':
    ensure   => latest,
    provider => gem,
    require  => Package['ruby-devel', 'rpm-build'],
  }

  $build_utils = [ 'gcc', 'gcc-c++', 'autoconf', 'automake', 'libtool', 'cppunit-devel', 'cppunit', 'libicu', 'libicu-devel', 'python-setuptools', 'libxslt-devel', 'pcre-devel', 'openssl-devel', 'gd-devel', 'GeoIP-devel', 'php-devel', 'erlang', 're2c', 'lua-devel', 'lua-static' ]

  package { $build_utils:
    ensure  => latest,
    require => Yumrepo['remi'],
  }

}
