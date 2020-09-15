void keyPressed()
{
  switch (keyCode)
  {
  case LEFT:
  case 'a':
    moveLeft = true;
    break;

  case RIGHT:
  case 'd':
    moveRight = true;
    break;

  case UP:
  case 'w':
    moveUp = true;
    break;

  case DOWN:
  case 's':
    moveDown = true;
    break;
  }
}

void keyReleased()
{
  switch (keyCode)
  {
  case LEFT:
  case 'a':
    moveLeft = false;
    break;

  case RIGHT:
  case 'd':
    moveRight = false;
    break;

  case UP:
  case 'w':
    moveUp = false;
    break;

  case DOWN:
  case 's':
    moveDown = false;
    break;
  }
}
