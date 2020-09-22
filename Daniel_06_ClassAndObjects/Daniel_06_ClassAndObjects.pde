Player player;
Edge edge = new Edge();
Factory ballFactory = new BallFactory();
ArrayList<Ball> balls = new ArrayList<Ball>();
boolean gravityEnabled;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  balls = ballFactory.create(50);
  player = new Player();
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  player.update();
  edge.wrapHorisontal(player);
  edge.wrapVertical(player);

  for (Ball ball : balls) 
  {
    ball.update();
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
