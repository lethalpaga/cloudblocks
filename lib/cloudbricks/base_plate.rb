require 'cloudbricks/brick'

module CloudBricks
  # The BasePlate is the top-level object that holds
  # the references to all {Base} objects
  module BasePlate

    module_function

    def objects
      @objects
    end

    def create(name = nil, &block)
      @objects = {}

      instance_eval(&block)
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
