module CloudBricks
  # This is the Base element of all objects in CloudBricks
  # It provides a way to tag, retrieve and filter other Base objects
  # It also implements all the basic handling for the DSL
  class Base
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def define_attribute(klass, *args, &block)
      attribute = klass.new(*args)
      attribute.instance_eval(&block) if block_given?

      CloudBricks::BasePlate.add_object(attribute)

      attribute
    end
  end
end
