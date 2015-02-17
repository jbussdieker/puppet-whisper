# Whisper

[![Build Status](https://travis-ci.org/jbussdieker/puppet-whisper.svg?branch=master)](https://travis-ci.org/jbussdieker/puppet-whisper)

## Usage

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

## Run All Beaker Tests

    bundle exec rake beaker_nodes | xargs -I NODE bundle exec rake beaker BEAKER_set=NODE
