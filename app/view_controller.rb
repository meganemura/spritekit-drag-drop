class ViewController < UIViewController

  def loadView
    bounds = UIScreen.mainScreen.bounds
    self.view = SKView.alloc.initWithFrame(bounds)
  end

  def viewWillLayoutSubviews
    super

    # Configure the view.
    sk_view = self.view
    unless sk_view.scene
      sk_view.showsFPS = true
      sk_view.showsNodeCount = true

      # Create and configure the scene.
      scene = MyScene.sceneWithSize(sk_view.bounds.size)
      scene.scaleMode = SKSceneScaleModeAspectFill

      # Present the scene.
      sk_view.presentScene(scene)
    end
  end

  def shouldAutorotate
    true
  end

  def supportedInterfaceOrientations
    if UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone
      UIInterfaceOrientationMaskAllButUpsideDown
    else
      UIInterfaceOrientationMaskAll
    end
  end

  def didReceiveMemoryWarning
    super
    # Release any cached data, images, etc that aren't in use.
  end
end
