PlayerManager player;
BallManager enemies;
boolean gravityOn;
int numberOfBalls = 100;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  player = new PlayerManager();
  enemies = new BallManager(numberOfBalls);
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  player.display();
  player.diagnostics();
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