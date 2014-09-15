class whisper(
  $install_method = 'package',
  $path = '/usr/local/src/whisper',
  $source = 'https://github.com/graphite-project/whisper.git',
  $revision = 'master'
) {

  case $install_method {
    'source': {
      class { 'whisper::source':
        path     => $path,
        source   => $source,
        revision => $revision,
      }
    }
    'package': {
      class { 'whisper::package':
      }
    }
    default: {
      fail("Unsupported install type ${install_method}")
    }
  }

}
