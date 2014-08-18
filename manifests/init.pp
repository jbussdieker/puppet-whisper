class whisper(
  $path = '/usr/local/src/whisper',
  $source = 'https://github.com/graphite-project/whisper.git',
  $revision = 'master'
) {

  vcsrepo { $path:
    ensure   => present,
    revision => $revision,
    source   => $source,
    provider => git,
  }

  exec { 'install_whisper':
    cwd     => $path,
    command => "/usr/bin/python setup.py install",
    creates => '/usr/local/lib/python2.7/dist-packages/whisper.py',
    require => Vcsrepo[$path],
  }

}
