class Input
{
  PVector position;
  float startVelocity = 5;
  float deceleration = 1;
  float velocityLimit = 15;
  PVector velocity = new PVector(startVelocity, startVelocity);
  PVector acceleration = new PVector(0.2, 0.2);

  Input(float x, float y)
  {
    position = new PVector(x, y);
  }


  void move()
  {       
    if (moveLeft)
      position.x -= velocity.x;

    if (moveRight)
      position.x += velocity.x;

    if (moveUp)
      position.y -= velocity.y;

    if (moveDown)
      position.y += velocity.y; 
  }

  void accelerate()
  {
    if (keyPressed)
    {
      if ((velocity.x <= velocityLimit) && (velocity.y <= velocityLimit))
      {
        velocity.add(acceleration);
      }
    }
  }


  void decelerate()
  {

    if ((velocity.x > startVelocity) && (velocity.y > startVelocity))
    {
      velocity.mult(deceleration);
      deceleration -= 0.05;
    } 

    else
    {
      deceleration = 1;
      velocity.x = startVelocity;
      velocity.y = startVelocity;

      if (decelerateLeft)
      {
        moveLeft = false;
        decelerateLeft = false;
      }

      if (decelerateRight)
      {
        moveRight = false;
        decelerateRight = false;
      }

      if (decelerateDown)
      {
        moveDown = false;
        decelerateDown = false;
      }

      if (decelerateUp)
      {
        moveUp = false;
        decelerateUp = false;
      }
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
    decelerateLeft = true;

  else if (keyCode == RIGHT || key == 'd')
    decelerateRight = true;

  else if (keyCode == DOWN || key == 's')
    decelerateDown = true;

  else if (keyCode == UP || key == 'w')
    decelerateUp = true;
}
