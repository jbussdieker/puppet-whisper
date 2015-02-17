# Whisper

[![Puppet Forge](http://img.shields.io/puppetforge/v/jbussdieker/whisper.svg)](https://forge.puppetlabs.com/jbussdieker/whisper)
[![Build Status](https://travis-ci.org/jbussdieker/puppet-whisper.svg?branch=master)](https://travis-ci.org/jbussdieker/puppet-whisper)

## Usage

To install Whisper with the default parameters

```puppet
class { 'whisper': }
```

Installing a specific version

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
