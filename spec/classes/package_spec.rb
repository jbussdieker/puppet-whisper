require 'spec_helper'

describe 'whisper::package' do
  it { should have_resource_count(1) }

  it do
    should contain_package('python-whisper').with({
      'ensure' => 'present',
    })
  end
end
