boolean moveLeft, moveRight, moveUp, moveDown;

float playerSize = 50;
float velocityLimit = 20f;
float velocityMultiplier = 75f;
float accelerationMultiplier = 1f;
float decelerationMultiplier = 0.05f;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

PVector acceleration = new PVector(0, 0);
PVector decelerationDiscard = new PVector();
PVector deceleration = new PVector(0, 0);
PVector velocity = new PVector(0, 0);
PVector position;


void setup() 
{
  size(1280, 720);
  position = new PVector(width/2, height/2);
}

void draw()
{
  background(128);

  calculateDeltaTime("START");

  acceleration = input();
  deceleration = decelerate();

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

PVector decelerate()
{
  if (acceleration.mag() == 0)
  {		
    deceleration.set(0, 0);

    decelerationDiscard.x = acceleration.x - (velocity.x * decelerationMultiplier);
    decelerationDiscard.y = acceleration.y - (velocity.y * decelerationMultiplier);
  }

  return decelerationDiscard;
}

void executeMovement()
{ 
  acceleration.add(PVector.mult(deceleration, deltaTime * velocityMultiplier));
  velocity.add(PVector.mult(acceleration, deltaTime * velocityMultiplier));
  position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
  velocity.limit(velocityLimit);
}

void drawBall()
{
  ellipse(position.x, position.y, playerSize, playerSize);
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
