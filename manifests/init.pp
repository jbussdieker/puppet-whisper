# == Class: whisper
#
# Main class to install whisper from package (default with fallback to source)
# or from source.
#
# === Parameters
#
# [*ensure*]
#   Defaults to present which will use `whisper::package` to install the 
# default operating system version any other value will be treated as a version
# string. Operating systems that do not have whisper package will fallback to
# using source.
#
# === Examples
#
# Install Whisper without regard for version.
#
#  class { 'whisper': }
#
# Install specific version of Whisper
#
#  class { 'whisper': }
#    ensure => '0.9.11',
#  }
#
# === Authors
#
# Joshua B. Bussdieker <jbussdieker@gmail.com>
#
# === Copyright
#
# Copyright 2015 Joshua B. Bussdieker, unless otherwise noted.
#
class whisper(
  $ensure = 'master',
) {

  anchor { 'whisper::begin': }

  if $::operatingsystem == 'Ubuntu' {
    if $::operatingsystemmajrelease == '14.04' or $::operatingsystemmajrelease == '13.10' or $::operatingsystemmajrelease == '12.04' {
      $has_package = true
    } else {
      $has_package = false
    }
  } elsif $::operatingsystem == 'Debian' {
    if $::operatingsystemmajrelease == '6' or $::operatingsystemmajrelease == '7' {
      $has_package = true
    } else {
      $has_package = false
    }
  } else {
    $has_package = false
  }

  if $ensure == present {

    if $has_package == true {
      class { 'whisper::package':
        before  => Anchor['whisper::end'],
        require => Anchor['whisper::begin'],
      }

    } else {
      class { 'whisper::source':
        revision => 'master',
        before   => Anchor['whisper::end'],
        require  => Anchor['whisper::begin'],
      }
    }

  } elsif $ensure == absent {

    fail('ensure absent not supported')

  } else {

    class { 'whisper::source':
      revision => $ensure,
      before   => Anchor['whisper::end'],
      require  => Anchor['whisper::begin'],
    }

  }

  anchor { 'whisper::end': }

}
