class MyScene < SKScene

  ANIMAL_NODE_NAME = 'movable'.freeze

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
    touches.each do |touch|
      location = touch.locationInNode(self)
      sprite = SKSpriteNode.spriteNodeWithImageNamed("Spaceship")
      sprite.position = location
      action = SKAction.rotateByAngle(Math::PI, duration: 1)
      sprite.runAction(SKAction.repeatActionForever(action))
      self.addChild(sprite)
    end
  end

  def update(current_time)
    # Called before each frame is rendered
  end
end
