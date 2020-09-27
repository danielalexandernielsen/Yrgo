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
  balls = ballFactory.create(5);
}

void draw()
{
  calculateDeltaTime("START");

  if (running)
  {
    game();
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
