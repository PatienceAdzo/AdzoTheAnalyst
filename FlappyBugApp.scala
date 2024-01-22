package o1.flappy

import o1.*

// This class is introduced in Chapter 2.7.

val sky        = rectangle(ViewWidth, ViewHeight,  LightBlue)
val ground     = rectangle(ViewWidth, GroundDepth, SandyBrown)
val trunk      = rectangle(30, 250, SaddleBrown)
val foliage    = circle(200, ForestGreen)
val tree       = trunk.onto(foliage, TopCenter, Center)
val rootedTree = tree.onto(ground, BottomCenter, Pos(ViewWidth / 2, 30))
val scenery    = sky.place(rootedTree, BottomLeft, BottomLeft)

val bugPic = Pic("ladybug.png")
val enemyPic = Pic("obstacle.png")
//def rockPic(obstacle: Obstacle) = circle(obstacle.radius * 2, Black)


val myGameObject = Game()

object flappyView extends View(myGameObject, "FlappyBug"):

  var background = scenery

  def makePic =
    var compositePic = this.background
    compositePic = myGameObject.obstacles.foldLeft(compositePic)( (result, n) => result.place(enemyPic.scaleTo(n.radius*2) , n.pos))
    compositePic.place(bugPic, myGameObject.bug.pos)

  override def onKeyDown(pressedKey: Key) =
    if pressedKey == Key.Space then
       myGameObject.activateBug()

  override def onTick() =
     myGameObject.timePasses()
     this.background = this.background.shiftLeft(BugSpeed)

  override def isDone = myGameObject.isLost

end flappyView

@main def launchFlappy() =
  flappyView.start()




