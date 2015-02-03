# Whisper

[![Build Status](https://travis-ci.org/jbussdieker/puppet-whisper.svg?branch=master)](https://travis-ci.org/jbussdieker/puppet-whisper)

### Beginning with Whisper

To install Whisper from the operating system package

```puppet
    class { 'whisper': }
```

Installing from source

```puppet
    class { 'whisper':
      ensure => '0.9.11',
    }
```

Installing and configuring using Hiera

```yaml
    classes:
     - whisper
    whisper::ensure: 0.9.11
```
