# install and configure fpm for the building of RPMS
class packagebuild {

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

  $build_utils = [ 'gcc', 'gcc-c++', 'autoconf', 'automake', 'libtool', 'cppunit-devel', 'cppunit', 'libicu', 'libicu-devel', 'python-setuptools', 'libxslt-devel', 'pcre-devel', 'openssl-devel', 'gd-devel', 'GeoIP-devel' ]

  package { $build_utils:
    ensure => latest,
  }

}
