class BallManager
{
  Ball[] balls;

  BallManager(int numberOfBalls)
  {
    balls = new Ball[numberOfBalls];

    for (int i = 0; i < balls.length; i++)
    {
      float size = random(10, 100);
      float radius = size/2;
      float x = random(radius, width - radius);
      float y = random (radius, height - radius);
      color colour = color(random(0, 255), random(0, 255), random(0, 255));
      float xSpeed = random(-7, 7);
      float ySpeed = random(-7, 7);
      balls[i] = new Ball(x, y, size, xSpeed, ySpeed, colour);
    }
  }

  void display()
  {
    for (int i = 0; i < balls.length; i++)
    {
      balls[i].update();
      balls[i].bounce();
      balls[i].display();
    }
  }
}
