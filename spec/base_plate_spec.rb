require 'spec_helper'
require 'cloudbricks/base_plate'
require 'cloudbricks/define'

describe CloudBricks::BasePlate do
  describe '#create' do
    subject {
      module CloudBricks
        BasePlate.create {
          brick('test') {}
        }
      end
    }

    it 'should be callable' do
      expect { subject }.not_to raise_error
    end

    it 'should memorize inner Base objects' do
      expect(CloudBricks::BasePlate.objects).not_to be_empty
    end
  end
end
