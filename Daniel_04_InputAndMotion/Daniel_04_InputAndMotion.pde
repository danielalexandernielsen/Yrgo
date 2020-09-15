PVector playerPosition;
float playerSize;
float velocity;
float step;
boolean moveLeft, moveRight, moveUp, moveDown;

void setup() 
{
  size(640, 480);
  playerPosition = new PVector(0, 0);
  playerSize = 20;

  velocity = 1;
  step = 5;
}

void draw()
{
  background(128);
  translate(width/2, height/2);

  playerMovement();
  circle(playerPosition.x, playerPosition.y, playerSize);
}

void playerMovement()
{
  if (moveLeft)
  {
    playerPosition.x -= step;
  }

  if (moveRight)
  {
    playerPosition.x += step;
  }

  if (moveUp)
  {
    playerPosition.y -= step;
  }

  if (moveDown)
  {
    playerPosition.y += step;
  }
}
