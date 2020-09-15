class Input
{
  PVector position;
  PVector velocity = new PVector(5, 5);
  PVector acceleration = new PVector(0.2, 0.2);
  float velocityLimit = 20;

  Input(float x, float y)
  {
    position = new PVector(x, y);
  }

  void acceleration()
  {
    if (accelerate)
    {
      if ((velocity.x <= velocityLimit) && (velocity.y <= velocityLimit))
      {
        velocity.add(acceleration);
      }
    } 
    
    else
    {
      velocity.x = 5;
      velocity.y = 5;
    }
  }


  void move()
  {       

    acceleration();

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
  {
    moveLeft = true;
  } 
  else if (keyCode == RIGHT || key == 'd')
  {
    moveRight = true;
  } 
  else if (keyCode == DOWN || key == 's')
  {
    moveDown = true;
  } 
  else if (keyCode == UP || key == 'w')
  {
    moveUp = true;
  }

  accelerate = true;
}

void keyReleased()
{
  if (keyCode == LEFT || key == 'a') 
  {
    moveLeft = false;
  } 
  
  else if (keyCode == RIGHT || key == 'd')
  {
    moveRight = false;
  } 
  else if (keyCode == DOWN || key == 's')
  {
    moveDown = false;
  } 
  else if (keyCode == UP || key == 'w')
  {
    moveUp = false;
  }

  accelerate = false;
}
