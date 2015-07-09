require 'spec_helper_acceptance'

describe 'whisper' do
  let(:manifest) {
    <<-EOS
      class { 'whisper': }
    EOS
  }

  describe 'running puppet code' do
    it 'should work with no errors' do
      apply_manifest(manifest, :catch_failures => true)
    end

    it 'should run again with no changes' do
      apply_manifest(manifest, :catch_changes => true)
    end
  end

  describe 'command line tools' do
    it 'whisper-create.py should work' do
      shell("whisper-create.py --overwrite /tmp/testmetric.wsp 60:1440", :acceptable_exit_codes => 0)
    end

    it 'whisper-info.py should work' do
      shell("whisper-info.py /tmp/testmetric.wsp", :acceptable_exit_codes => 0)
    end
  end
end
