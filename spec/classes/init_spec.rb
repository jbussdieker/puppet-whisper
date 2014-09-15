require 'spec_helper'

describe 'whisper' do
  context 'default params' do
    it { should have_resource_count(1) }

    it 'should install from package' do
      should contain_class('whisper::package')
    end
  end

  context 'custom params' do
    let(:install_method) { 'source' }
    let(:path) { '/path/to' }
    let(:revision) { '0.0.1' }
    let(:source) { 'https://github.com/foo/bar.git' }
    let(:params) { { :install_method => install_method, :path => path, :revision => revision, :source => source } }

    context 'from package' do
      let(:install_method) { 'package' }
      
      it { should have_resource_count(1) }

      it 'should install from package' do
        should contain_class('whisper::package')
      end
    end

    context 'from source' do
      let(:install_method) { 'source' }

      it { should have_resource_count(2) }

      it 'should install from source' do
        should contain_class('whisper::source').with({
          'path'     => path,
          'revision' => revision,
          'source'   => source,
        })
      end
    end
  end
end
