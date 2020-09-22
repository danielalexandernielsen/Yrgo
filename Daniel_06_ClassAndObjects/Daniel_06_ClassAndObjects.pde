Player player;

Factory ballFactory = new BallFactory();
ArrayList<Ball> enemies = new ArrayList<Ball>();
int amountOfBalls = 100;

boolean gravityEnabled;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

void setup() 
{
  size(1280, 720);
  player = new Player();
  enemies = ballFactory.create(10);
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  player.update();
  
  for (Ball enemy : enemies) 
  {
    enemy.update();
  }
  
  //balls.updateAll();

  /*
  for (int i = 0; balls.balls.size() > i; i++) 
  {
    println(i);
    if (Collision.detection(player, balls.balls.get(i)) == true)
    {
      println("test");
      balls.destroy(balls.balls.get(i));
    }
  }*/

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
