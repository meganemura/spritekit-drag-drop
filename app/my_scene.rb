class MyScene < SKScene

  ANIMAL_NODE_NAME = 'movable'.freeze

  attr_accessor :selected_node

  def initWithSize(size)
    super

    @background = SKSpriteNode.spriteNodeWithImageNamed("blue-shooting-stars")
    @background.setName("background")
    @background.setAnchorPoint(CGPointZero)
    self.addChild(@background)

    image_names = %w(bird cat dog turtle)
    image_names.each_with_index do |name, i|
      sprite = SKSpriteNode.spriteNodeWithImageNamed(name)
      sprite.setName(ANIMAL_NODE_NAME)

      offset_fraction = (i + 1).to_f / (image_names.size + 1)
      sprite.setPosition(CGPointMake(size.width * offset_fraction, size.height / 2))
      @background.addChild(sprite)
    end

    self
  end

  def touchesBegan(touches, withEvent: event)
    touch = touches.anyObject
    position_in_scene = touch.locationInNode(self)
    self.select_node_for_touch(position_in_scene)
  end

  def update(current_time)
    # Called before each frame is rendered
  end

  def select_node_for_touch(touch_location)
    touched_node = self.nodeAtPoint(touch_location)
    unless @selected_node == touched_node
      if @selected_node
        @selected_node.removeAllActions
        @selected_node.runAction(SKAction.rotateToAngle(0.0, duration: 0.1))
      end

      @selected_node = touched_node

      if touched_node.name == ANIMAL_NODE_NAME
        sequence = SKAction.sequence([
          SKAction.rotateByAngle(degrees_to_radians(-4.0), duration: 0.1),
          SKAction.rotateByAngle(0.0, duration: 0.1),
          SKAction.rotateByAngle(degrees_to_radians(4.0), duration: 0.1),
        ])
        @selected_node.runAction(SKAction.repeatActionForever(sequence))
      end
    end
  end

  def degrees_to_radians(degrees)
    radians = degrees * Math::PI / 180
  end
end
