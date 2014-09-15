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
      revision       => '0.9.11',
    }
```

Installing and configuring using Hiera

````YAML
    classes:
     - whisper
    whisper::install_method: source
    whisper::revision: 0.9.11
````
