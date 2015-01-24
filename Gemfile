source 'https://rubygems.org'

gem 'rspec', '2.14.1'
gem 'puppetlabs_spec_helper'

group :system_tests do
  gem 'beaker-rspec', :require => false
  gem 'serverspec', :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion, :require => false
else
  gem 'facter', :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
