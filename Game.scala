package o1.flappy

import o1.*

class Game:

      val bug = Bug(Pos(ViewWidth/10, ViewHeight/10))
      //val obstacle = Obstacle(70)

      val obstacles: Vector[Obstacle] = Vector(Obstacle(70), Obstacle(30), Obstacle(20))

      def activateBug() =
          this.bug.flap(FlapStrength)

      def timePasses() =
        this.obstacles.foreach(_.approach())
        //for obstacle <- this.obstacles do
          //obstacle.approach()
        this.bug.fall()

      def isLost =
         //var isDeadAlready = !this.bug.isInBounds
         this.obstacles.exists(_.touches(bug)) || !this.bug.isInBounds
         //for obstacle <- this.obstacles do
            //if obstacle.touches(bug) then
              //isDeadAlready = true
         //isDeadAlready

        //var touch = true
        //for obstacle <- this.obstacles do
           //touch = obstacle.touches(this.bug)
        //touch || !this.bug.isInBounds


      //this.obstacle.touches(this.bug) || !this.bug.isInBounds

end Game
