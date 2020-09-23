Player player;
Edge edge = new Edge();
Force force = new Force();
Factory ballFactory = new BallFactory();
ArrayList<Ball> balls = new ArrayList<Ball>();
boolean gravityEnabled;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  balls = ballFactory.create(10);
  player = new Player();
}

void draw()
{
  background(128);

  calculateDeltaTime("START");
  
  force.generate(player);
  force.apply(player, ForceType.INPUT);
  edge.bounceHorisontal(player);
  edge.bounceVertical(player);
  player.draw();

  for (Ball ball : balls) 
  {
    force.generate(ball, 7);
    force.apply(ball, ForceType.CONSTANT);
    edge.wrapVertical(ball);
    edge.wrapHorisontal(ball);
    ball.draw();
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
