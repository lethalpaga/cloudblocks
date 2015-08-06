require 'cloudbricks/define'
require 'rspec/its'

describe CloudBricks::Define do
  describe '#brick' do
    subject { CloudBricks::Define.brick("Test") {} }

    it { is_expected.to be_a CloudBricks::Brick }

    it 'should be able to define a Brick' do
      expect { subject }.not_to raise_error
    end

    context 'when given a definition with a Tag' do
      subject (:brick) {
        CloudBricks::Define.brick("Test") {
          tag "TestTag"
        }
      }

      its(:tags) { is_expected.not_to be_empty }
    end
  end
end
