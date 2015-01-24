# == Class: whisper::package
#
# Simple class to install the whisper package
#
# === Examples
#
# Install default operating system Whisper.
#
#  include whisper
#
# === Authors
#
# Joshua B. Bussdieker <jbussdieker@gmail.com>
#
# === Copyright
#
# Copyright 2015 Joshua B. Bussdieker, unless otherwise noted.
#
class whisper::package {

  package { 'python-whisper':
    ensure => present,
  }

}
