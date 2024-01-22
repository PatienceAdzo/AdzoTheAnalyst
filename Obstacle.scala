package o1.flappy

import o1.*
import o1.world.Pos
import scala.util.Random
// This class is introduced in Chapter 2.6.

class Obstacle(val radius: Int):

  private var currentPos = this.randomLaunchPosition()

  def pos = this.currentPos

  private def randomLaunchPosition() =
    val launchX = ViewWidth + this.radius + Random.nextInt(500)
    val launchY = Random.nextInt(ViewHeight)
    Pos(launchX, launchY)

  def approach() =
    this.currentPos =
      if this.isActive then
        this.currentPos.addX(-ObstacleSpeed)
      else
        this.randomLaunchPosition()

  def touches(bug: Bug) = bug.pos.distance(this.pos) < bug.radius + this.radius

  //def touches(collide: Bug) =
    //val distance = collide.pos.distance(this.pos)
    //val sumofRadii = this.radius + collide.radius
    //distance < sumofRadii
    //var distance = this.currentPos - collide.pos

  def isActive = this.pos.x >= -this.radius


  override def toString = "center at " + this.pos + ", radius " + this.radius

end Obstacle
