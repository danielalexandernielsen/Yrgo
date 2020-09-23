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
  if (running)
  {

    background(128);

    calculateDeltaTime("START");

    force.generate(player);
    force.apply(player, ForceType.INPUT);
    edge.wrapHorisontal(player);
    edge.constrainVertical(player);
    player.draw();

    for (Ball ball : balls) 
    {
      if (Collision.round(player, ball) == true)
      {
        gameOver();
      }
      force.generate(ball, 7);
      force.apply(ball, ForceType.CONSTANT);
      edge.bounceVertical(ball);
      edge.bounceHorisontal(ball);
      ball.draw();
    }    

    calculateDeltaTime("END");
    
  }  
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
