boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

float size;
float velocityLimit;
float drag;
float speed;

float time;
float oldTime;
float deltaTime;

PVector acceleration;
PVector velocity;
PVector position;


void setup() 
{
  size(1280, 720);
  position = new PVector(width/2, height/2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);

  velocityLimit = 20f;
  speed = 1f;
  drag = 0.9f;
  size = 50;
  time = 0;
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  calculateHorisontalMovement();
  calculateVerticalMovement();
  executeMovement();
  drawBall();
  diagnostics();

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

void calculateHorisontalMovement()
{
  if (moveLeft)
  {
    if (acceleration.x > 0)
    {
      acceleration.x = 0f;
    }
    acceleration.x -= speed;
  }

  if (moveRight)
  {
    if (acceleration.x < 0)
    {
      acceleration.x = 0f;
    }
    acceleration.x += speed;
  }

  if (!moveLeft && !moveRight)
  {
    acceleration.x = 0f;
    velocity.x *= drag;
  }
}

void calculateVerticalMovement()
{
  if (moveUp)
  {
    if (acceleration.y > 0)
    {
      acceleration.y = 0f;
    }
    acceleration.y -= speed;
  } 

  if (moveDown)
  {
    if (acceleration.y < 0)
    {
      acceleration.y = 0f;
    }
    acceleration.y += speed;
  }

  if (!moveUp && !moveDown)
  {
    acceleration.y = 0f;
    velocity.y *= drag;
  }
}

void executeMovement()
{ 
  //velocity.add(acceleration);
  //position.add(velocity);
  position.add(PVector.mult(velocity, deltaTime*75));
  velocity.add(PVector.mult(acceleration, deltaTime*75));
  velocity.limit(velocityLimit);
  //acceleration.limit(velocityLimit);
}

void drawBall()
{
  ellipse(position.x, position.y, size, size);
}

void diagnostics()
{
  textSize(25);
  text(
    "Acceleration X: " + acceleration.x + "\n" +
    "Acceleration Y: " + acceleration.y + "\n" +
    "Velocity X: " + velocity.x + "\n" +
    "Velocity Y: " + velocity.y + "\n" +
    "Position X: " + position.x + "\n" +
    "Position Y: " + position.y + "\n"
    , 50, 50);
}
