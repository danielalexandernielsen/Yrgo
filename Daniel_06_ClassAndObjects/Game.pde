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
    edge.wrapVertical(ball);
    edge.wrapHorisontal(ball);
    ball.draw();

    if (Collision.round(player, ball) == true)
    {
      gameOver();
    }
  }

  addObjectEveryNSecond("Ball", 3);
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
