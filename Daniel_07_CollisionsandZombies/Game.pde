boolean gravityEnabled;
float time;
float oldTime;
float deltaTime;
float accumulatedTime;

void game()
{
  background(128);

  force.generate(player);
  force.apply(player, ForceType.INPUT);
  edge.wrapHorisontal(player);
  edge.constrainVertical(player);
  player.draw();

  for (Ball ball : balls) 
  {
    force.generate(ball, 7);
    force.apply(ball, ForceType.CONSTANT);
    edge.bounceVertical(ball);
    edge.bounceHorisontal(ball);
    ball.draw();

    if (Collision.round(player, ball) == true)
    {
      gameOver();
    }
  }

  addObjectEveryNSecond("Ball", 3);
}


void calculateDeltaTime(String interval)
{
  switch (interval)
  {
    case "START":
    time = millis();
    deltaTime = (time - oldTime) * 0.001;

    case "END":
    oldTime = time;
  }
}


void addObjectEveryNSecond(String object, float nSecond)
{
  accumulatedTime += deltaTime;

  if (accumulatedTime > nSecond && balls.size() <= 100)
  {
    switch (object) 
    {
      case "Ball":
      balls.add(new Ball());
      break;
    }
    accumulatedTime = 0;
  }
}
