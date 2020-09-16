boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

float size;
float velocityLimit;
float drag;
float speed;

float time;
float currentTime;
float deltaTime;

PVector acceleration;
PVector velocity;
PVector position;


void setup() 
{
  size(600, 600);
  frameRate(200);
  position = new PVector(width/2, height/2);
  velocity = new PVector(0, 0);
  acceleration = new PVector(0, 0);

  velocityLimit = 20f;
  speed = 1000f;
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

  calculateDeltaTime("END");
}

void calculateDeltaTime(String interval)
{
  switch (interval)
  {
  case "START":
    currentTime = millis();
    deltaTime = (currentTime - time) * 0.001f;

  case "END":
    time = currentTime;
  }
}

void calculateHorisontalMovement()
{
  if (moveLeft)
  {
    acceleration.x -= speed;
  }
  if (moveRight)
  {
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
    acceleration.y -= speed;
  }
  if (moveDown)
  {
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
  velocity.add(PVector.mult(acceleration, deltaTime));
  position.add(PVector.mult(velocity, deltaTime));
  velocity.limit(velocityLimit);
}

void drawBall()
{
  ellipse(position.x, position.y, size, size);
}
