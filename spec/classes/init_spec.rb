require 'spec_helper'

describe 'whisper' do
  let(:facts) do
    {
      :operatingsystem => operatingsystem,
      :operatingsystemmajrelease => operatingsystemmajrelease
    }
  end
  let(:params) { { :ensure => ensure_value } }

  let(:operatingsystem) { 'Ubuntu' }
  let(:operatingsystemmajrelease) { '12.04' }

  let(:ensure_value) { 'present' }

  context 'CentOS' do
    let(:operatingsystem) { 'CentOS' }

    context '7' do
      let(:operatingsystemmajrelease) { '7' }
      it { should contain_class('whisper::source').with(:revision => 'master') }
    end

    context '6' do
      let(:operatingsystemmajrelease) { '6' }
      it { should contain_class('whisper::source').with(:revision => 'master') }
    end

    context '5' do
      let(:operatingsystemmajrelease) { '5' }
      it { should contain_class('whisper::source').with(:revision => 'master') }
    end
  end

  context 'Debian' do
    let(:operatingsystem) { 'Debian' }

    context '7' do
      let(:operatingsystemmajrelease) { '7' }
      it { should contain_class('whisper::package') }
    end

    context '6' do
      let(:operatingsystemmajrelease) { '6' }
      it { should contain_class('whisper::package') }
    end
  end

  context 'Ubuntu' do
    let(:operatingsystem) { 'Ubuntu' }

    context '14.04' do
      let(:operatingsystemmajrelease) { '14.04' }
      it { should contain_class('whisper::package') }
    end

    context '13.10' do
      let(:operatingsystemmajrelease) { '13.10' }
      it { should contain_class('whisper::package') }
    end

    context '12.04' do
      let(:operatingsystemmajrelease) { '12.04' }
      it { should contain_class('whisper::package') }
    end

    context '10.04' do
      let(:operatingsystemmajrelease) { '10.04' }
      it { should contain_class('whisper::source').with(:revision => 'master') }
    end
  end

  context 'default params' do
    it { should have_resource_count(1) }

    it 'should install from package' do
      should contain_class('whisper::package')
    end
  end

  context 'custom params' do
    let(:ensure_value) { '0.0.1' }

    it { should have_resource_count(2) }

    it 'should install from source' do
      should contain_class('whisper::source').with({
        'revision' => ensure_value,
      })
    end
  end

  it { should contain_class('whisper') }
end
