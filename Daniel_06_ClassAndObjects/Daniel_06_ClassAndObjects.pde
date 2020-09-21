Player player;
Factory balls;
boolean gravityEnabled;
int amountOfBalls = 100;
float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  player = new Player();
  balls = new Factory(amountOfBalls);
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  player.update();
  balls.updateAll();

  for (int i = 0; balls.balls.size() > i; i++) 
  {
    println(i);
    if (Collision.detection(player, balls.balls.get(i)) == true)
    {
      println("test");
      balls.destroy(balls.balls.get(i));
    }
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
