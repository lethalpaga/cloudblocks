require 'cloudbricks/base'

module CloudBricks
  # A tag is a value or a name-value pair
  # It's used to filter Base objects
  class Tag < Base
    def initialize(name = nil)
      super(name)
    end
  end
end
