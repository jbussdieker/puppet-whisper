# == Class: whisper
#
# Main class to install whisper from package (default) or from source.
#
# === Parameters
#
# [*ensure*]
#   Defaults to present which will using `whisper::package` to install the default operating system version any other value will be treated as a version string.
#
# === Examples
#
# Install default operating system Whisper.
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
  $ensure = present,
) {

  if $ensure == present {

    include whisper::package

  } elsif $ensure == absent {

    notify { "hmmm": }

  } else {

    class { 'whisper::source':
      revision => $ensure,
    }

  }

}
