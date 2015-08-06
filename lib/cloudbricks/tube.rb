require 'cloudbricks/base_object'

module CloudBricks
  # A tube is an input for a {Brick} object.
  # They are used to provide parameters to {Stud} in other {Brick}s
  class Tube < BaseObject
    def initialize(name)
      super(name)
    end
  end
end
