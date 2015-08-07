require 'cloudbricks/brick'

module CloudBricks
  # The BasePlate is the top-level object that holds
  # the references to all {Base} objects
  module BasePlate

    class NestedError < StandardError; end

    module_function

    def base_plate
      @@current_base_plate
    end

    def _set_current_base_plate(plate)
      @@current_base_plate = plate
    end

    def objects
      @objects
    end

    def create(name = nil, &block)
      @objects = {}

      BasePlateImpl.new(name, &block)

      instance_eval(&block)
    end

    class BasePlateImpl < Base
      def initialize(name, &block)
        @backtrace = backtrace

        fail NestedError.new("BasePlate already defined at #{base_plate.show_backtrace}") unless base_plate.nil?
        _set_current_base_plate(self)

        super(name, &block)
      end

      def backtrace
        caller
      end
    end

    # Defines a brick
    # Syntax for defining a brick is :
    #   Define.brick 'BrickName' {
    #      <call to definition functions>
    #   }
    def brick(name, &block)
      brick = Brick.new(name)
      brick.instance_eval(&block)
      add_object(brick)
      brick
    end

    def add_object(obj)
      @objects[obj.class] ||= []
      @objects[obj.class] << obj
    end
  end
end
