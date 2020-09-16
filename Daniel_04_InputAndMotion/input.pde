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
