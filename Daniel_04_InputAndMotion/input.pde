class Input
{
  PVector position;
  PVector velocity;
  PVector acceleration;  
  float velocityLimit;

  Input(float x, float y)
  {
    position = new PVector(x, y);
    velocity = new PVector(5, 5);
    acceleration = new PVector(1, 1);
  }

  void move()
  {
    if (moveLeft)
    {
      position.x -= velocity.x;
    }

    if (moveRight)
    {
      position.x += velocity.x;
    }

    if (moveUp)
    {
      position.y -= velocity.y;
    }

    if (moveDown)
    {
      position.y += velocity.y;
    }
  }
}

void keyPressed()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = true;

  else if (keyCode == RIGHT || key == 'd')
    moveRight = true;

  else if (keyCode == DOWN || key == 's')
    moveDown = true;

  else if (keyCode == UP || key == 'w')
    moveUp = true;
}


void keyReleased()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = false;

  else if (keyCode == RIGHT || key == 'd')
    moveRight = false;

  else if (keyCode == DOWN || key == 's')
    moveDown = false;

  else if (keyCode == UP || key == 'w')
    moveUp = false;
}
