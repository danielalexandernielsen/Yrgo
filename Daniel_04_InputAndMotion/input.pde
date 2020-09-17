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