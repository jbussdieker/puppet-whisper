class whisper::package {

  package { 'python-whisper':
    ensure => present,
  }

}
