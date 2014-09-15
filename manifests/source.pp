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
