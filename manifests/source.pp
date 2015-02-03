# == Class: whisper::source
#
# Install Whisper from source.
#
# === Parameters
#
# [*path*]
#   Location to place source that will be used to run `setup.py install`
# [*source*]
#   Git source repository. Defaults to mainline.
# [*revision*]
#   Any valid git branch, tag or hash. This will be checked out before running
# `setup.py install`
#
# === Examples
#
# Install Whisper from the latest source code.
#
#  class { 'whisper::source': }
#
# Install a specific version of Whisper.
#
#  class { 'whisper::source': }
#    revision => '0.9.11',
#  }
#
# Install Whisper from a forked source using the feature1 branch.
#
#  class { 'whisper': }
#    revision => 'feature1',
#    source   => 'https://github.com/jbussdieker/whisper.git',
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
class whisper::source(
  $path = '/usr/local/src/whisper',
  $source = 'https://github.com/graphite-project/whisper.git',
  $revision = 'master'
) {

  vcsrepo { 'whisper_source':
    ensure   => present,
    path     => $path,
    revision => $revision,
    source   => $source,
    provider => git,
  }

  exec { 'whisper_source_install':
    cwd     => $path,
    command => '/usr/bin/python setup.py install',
    creates => '/usr/local/lib/python2.7/dist-packages/whisper.py',
    require => Vcsrepo[$path],
  }

}
