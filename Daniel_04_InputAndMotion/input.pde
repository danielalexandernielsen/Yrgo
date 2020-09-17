PVector input()
{
  accelerationDiscard.set(0, 0);

  if (moveLeft)
    accelerationDiscard.x -= 1;

  if (moveRight)
    accelerationDiscard.x += 1;

  if (moveUp)
    accelerationDiscard.y -= 1;

  if (moveDown)
    accelerationDiscard.y += 1;

  return accelerationDiscard.normalize();
}


void keyPressed()
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = true;

  if (keyCode == RIGHT || key == 'd')
    moveRight = true;    

  if (keyCode == DOWN || key == 's')
    moveDown = true;    

  if (keyCode == UP || key == 'w')
    moveUp = true;
}

void keyReleased()
{
  if (keyCode == LEFT || key == 'a') 
    moveLeft = false;

  if (keyCode == RIGHT || key == 'd')
    moveRight = false;

  if (keyCode == DOWN || key == 's')
    moveDown = false;

  if (keyCode == UP || key == 'w')
    moveUp = false;
}
