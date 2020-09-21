class Factory
{
  ArrayList<Ball> balls = new ArrayList<Ball>();

  Factory(int amount)
  {
    create(amount);
  }

  void create(int amount)
  {
    for (int i = 0; i < amount; i++)
    {
      balls.add(new Ball());
    }
  }

  void destroy(Ball ball)
  {
    balls.remove(ball);
  }

  void updateAll()
  {
    for (Ball ball : balls) 
    {
      ball.update();
    }
  }
}
