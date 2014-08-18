class whisper($ensure = present) {

  package { 'python-whisper':
    ensure => $ensure,
  }

}
