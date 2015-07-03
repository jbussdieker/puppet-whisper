require 'spec_helper_acceptance'

describe 'whisper class' do
  let(:manifest) {
    <<-EOS
      class { 'whisper': }
    EOS
  }

  describe 'running puppet code' do
    it 'should work with no errors' do
      # Run it twice and test for idempotency
      apply_manifest(manifest, :catch_failures => true)
      expect(apply_manifest(manifest, :catch_changes => true).exit_code).to be_zero
    end

  end

  describe 'command line tools' do
    it 'should report a version' do
      shell("PYTHONPATH=$PYTHONPATH:/opt/graphite/lib python -c \"import pkg_resources; print pkg_resources.get_distribution('whisper').version\"", :acceptable_exit_codes => 0)
    end

    it 'whisper-create.py should work' do
      shell("whisper-create.py --overwrite /tmp/testmetric.wsp 60:1440", :acceptable_exit_codes => 0)
    end
  end
end
