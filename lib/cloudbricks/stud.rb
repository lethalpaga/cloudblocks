require 'cloudbricks/base_object'

module CloudBricks
  # A stud is an output for a Brick object.
  # They are used to provide parameters to Tubes in other Bricks
  class Stud < BaseObject
    def initialize(name)
      super(name)
    end
  end
end
