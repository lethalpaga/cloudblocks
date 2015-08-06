require 'cloudbricks/define'
require 'rspec/its'

describe CloudBricks::Define do
  describe '#brick' do
    context 'when given an empty definition' do
      subject { CloudBricks::Define.brick("Test") {} }

      it { is_expected.to be_a CloudBricks::Brick }

      it 'should be able to define a Brick' do
        expect { subject }.not_to raise_error
      end
    end

    context 'when given a complete definition' do
      subject (:brick) {
        CloudBricks::Define.brick("Test") {
          tag 'TestTag'
          stud 'stud'
        }
      }

      its(:tags) { is_expected.not_to be_empty }
      its(:studs) { is_expected.not_to be_empty }
    end
  end
end
