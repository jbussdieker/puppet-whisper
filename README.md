# Whisper

[![Build Status](https://travis-ci.org/jbussdieker/puppet-whisper.svg?branch=master)](https://travis-ci.org/jbussdieker/puppet-whisper)

### Beginning with Whisper

To install Whisper with the default parameters

```puppet
    class { 'whisper': }
```

Installing from source

```puppet
    class { 'whisper':
      install_method => source,
    }
```
