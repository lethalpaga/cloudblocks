require 'cloudbricks/base_object'
require 'cloudbricks/stud'

module CloudBricks
  # A Brick is the main element of CloudBricks (duh...)
  # It provides a way to create resources in a cloud provider account
  # in a reproducible way. It also manage some kind of dependency between
  # Different bricks
  class Brick < BaseObject
    attr_accessor :studs
    attr_accessor :tubes

    def initialize(name)
      super(name)

      @studs = {}
      @tubes = {}
    end

    def stud(name, &block)
      @studs[name] = define_attribute(Stud, name, &block)
    end

    private


  end
end
