Player player;
Edge edge;
Force force;
Factory ballFactory;
ArrayList<Ball> balls;
boolean gravityEnabled;

float time;
float oldTime;
float deltaTime;
float accumulatedTime;

void setup() 
{
  size(1280, 720);
  player = new Player();
  edge = new Edge();
  force = new Force();
  ballFactory = new BallFactory();
  balls = new ArrayList<Ball>();
  balls = ballFactory.create(10);
}

void draw()
{

  calculateDeltaTime("START");

  if (running)
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
  calculateDeltaTime("END");
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
