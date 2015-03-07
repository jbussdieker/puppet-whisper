require 'spec_helper_acceptance'

describe 'whisper::package class' do
  let(:manifest) {
    <<-EOS
      class { 'whisper::package':

      }
    EOS
  }

  describe 'running puppet code' do
    it 'should work with no errors' do
      apply_manifest(manifest, :catch_failures => true)
      expect(apply_manifest(manifest, :catch_changes => true).exit_code).to be_zero
    end
  end

  describe 'command line tools' do
    it 'whisper-create.py should work' do
      if shell("which whisper-create").exit_code == 0
        shell("whisper-create --overwrite /tmp/testmetric.wsp 60:1440", :acceptable_exit_codes => 0)
      else
        shell("whisper-create.py --overwrite /tmp/testmetric.wsp 60:1440", :acceptable_exit_codes => 0)
      end
    end

    it 'whisper-info.py should work' do
      if shell("which whisper-info").exit_code == 0
        shell("whisper-info /tmp/testmetric.wsp", :acceptable_exit_codes => 0)
      else
        shell("whisper-info.py /tmp/testmetric.wsp", :acceptable_exit_codes => 0)
      end
    end
  end
end
