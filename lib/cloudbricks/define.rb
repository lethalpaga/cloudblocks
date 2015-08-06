require 'cloudbricks/brick'

module CloudBricks
  # Defines elements in the DSL
  class Define

    # Defines a brick
    # Syntax for defining a brick is :
    #   Define.brick 'BrickName' {
    #      <call to definition functions>
    #   }
    def self.brick(name, &block)
      brick = Brick.new(name)
      brick.instance_eval(&block)
      brick
    end
  end
end
