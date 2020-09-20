PlayerManager player;
boolean moveLeft, moveRight, moveUp, moveDown;
boolean gravityOn;
int numberOfBalls = 10;
Ball[] balls = new Ball[numberOfBalls];

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  player = new PlayerManager();

  for(int i = 0; i < balls.length; i++)
  {
      balls[i] = new Ball(100, 100, 25, color(125, 25, 190));
  }
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  for(int i = 0; i < balls.length; i++)
  {
      balls[i].update();
      balls[i].bounce();
      balls[i].display();
  }

  player.display();
  player.diagnostics();

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
