require 'spec_helper'

describe 'whisper::source' do
  context 'default params' do
    it { should have_resource_count(2) }
  end

  context 'custom params' do
    let(:path) { 'path' }
    let(:revision) { 'revision' }
    let(:source) { 'source' }
    let(:params) { { :path => path, :revision => revision, :source => source } }

    it do
      should contain_vcsrepo('whisper').with({
        'ensure'   => 'present',
        'path'     => path,
        'revision' => revision,
        'source'   => source,
        'provider' => 'git',
      })
    end

    it do
      should contain_exec('whisper_install').with({
        'cwd'         => path,
        'command'     => '/usr/bin/python setup.py install',
        'refreshonly' => true,
      })
    end
  end
end
