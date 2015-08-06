require 'cloudbricks/base'

module CloudBricks
  # The BasePlate is the top-level object that holds
  # the references to all {Base} objects
  module BasePlate
    def initialize(name = nil, &block)
      super(name)

      @objects = {}

      instance_eval(&block)
    end

    def add_object(obj)
      @objects[obj.class] ||= []
      @objects[obj.class] << obj
    end

    def self.create(name = nil, &block)
      BasePlate.new(name, &block)
    end
  end

end
