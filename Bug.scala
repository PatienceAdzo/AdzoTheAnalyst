package o1.flappy

import o1.*

// Define class Bug here.

class Bug(initialPos: Pos):

  val radius = BugRadius
  private var yVelocity = 0.0
  private var currentPos = initialPos

  def flap(FlyingSpeed : Double) =
    this.yVelocity = -FlyingSpeed
    //this.move(-FlyingSpeed)

  def fall() =
    if this.pos.y < (GroundY) then
      this.yVelocity = this.yVelocity + 2
    this.move(this.yVelocity)
    //this.move(FallingSpeed)

  def pos = this.currentPos

  def move(addtoY: Double) =
    // Calculate the new Y-coordinate after adding addtoY
    val newY = this.currentPos.addY(addtoY)
   // Clamp the newY value to the allowed bounds
    this.currentPos = newY.clampY(0, GroundY)

  def isInBounds = this.pos.y < GroundY && this.pos.y > 0

  override def toString = "center at " + this.pos + ", radius " + this.radius

end Bug