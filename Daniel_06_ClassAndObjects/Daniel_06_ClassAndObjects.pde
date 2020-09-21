BallManager enemies;
Player player;
boolean gravityEnabled;
int numberOfBalls = 10;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  player = new Player();
  enemies = new BallManager(numberOfBalls);
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  player.update();
  enemies.display();

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
