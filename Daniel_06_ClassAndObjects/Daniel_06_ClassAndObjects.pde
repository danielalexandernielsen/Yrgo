Player player;
ArrayList<Ball> enemies = new ArrayList<Ball>();
boolean gravityEnabled;
int amount = 100;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  player = new Player();
  enemies = Factory.create("Ball", amount);
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  player.update();
  for (Ball ball : balls) 
  {
    ball.update();
    ball.applyForces();
    ball.edgeBounce();
    ball.display();
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
