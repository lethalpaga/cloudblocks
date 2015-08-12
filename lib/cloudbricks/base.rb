module CloudBricks
  # This is the Base element of all objects in CloudBricks
  # It provides a way to tag, retrieve and filter other Base objects
  # It also implements all the basic handling for the DSL
  class Base
    attr_accessor :name

    @@current_base_plate = nil

    def initialize(name)
      @name = name

    end

    def base_plate
      @@current_base_plate.freeze
    end

    def define_attribute(klass, *args, &block)
      attribute = klass.new(*args)
      attribute.instance_eval(&block) if block_given?

      CloudBricks::BasePlate.add_object(attribute)

      attribute
    end

    def self._set_current_base_plate(base_plate)
      @@current_base_plate = base_plate
    end
  end
end
