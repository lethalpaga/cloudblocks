require 'cloudbricks/base'
require 'cloudbricks/tag'

module CloudBricks
  # Same as {Base}, but with tags
  class BaseObject < Base
    attr_accessor :tags

    def initialize(name)
      super(name)

      @tags = []
    end

    def tag(tag, &block)
      @tags << define_attribute(Tag, tag, &block)
    end
  end
end
