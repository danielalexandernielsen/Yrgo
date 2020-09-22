Player player;
Edge edge = new Edge();
Force force = new Force();
Force ballForce = new Force();
Factory ballFactory = new BallFactory();
ArrayList<Ball> balls = new ArrayList<Ball>();
boolean gravityEnabled;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  balls = ballFactory.create(0);
  player = new Player();
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  player.draw();
  force.generate(player);
  force.apply(player);
  edge.wrapHorisontal(player);
  edge.constrainVertical(player);


  for (Ball ball : balls) 
  {
    ball.draw();
    ballForce.generate(ball);
    ballForce.apply(ball);
    edge.bounceVertical(ball);
    edge.bounceHorisontal(ball);
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
