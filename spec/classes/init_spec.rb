require 'spec_helper'

describe 'whisper' do
  context 'default params' do
    it { should have_resource_count(1) }

    it 'should install from package' do
      should contain_class('whisper::package')
    end
  end

  context 'custom params' do
    let(:ensure_value) { '0.0.1' }
    let(:params) { { :ensure => ensure_value } }

    it { should have_resource_count(2) }

    it 'should install from source' do
      should contain_class('whisper::source').with({
        'revision' => ensure_value,
      })
    end
  end
end
