require 'cloudbricks/base_object'

module CloudBricks
  # A stud is an output for a {Brick} object.
  # They are used to provide parameters to {Tube}s in other {Brick}s
  class Stud < BaseObject
    def initialize(name)
      super(name)
    end
  end
end
