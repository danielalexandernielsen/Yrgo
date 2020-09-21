boolean moveLeft, moveRight, moveUp, moveDown;

void keyPressed()
{
  keyToggle(true);
}

void keyReleased()
{
  keyToggle(false);
}

void keyToggle(boolean pushedDown)
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = pushedDown;

  if (keyCode == RIGHT || key == 'd')
    moveRight = pushedDown;    

  if (keyCode == DOWN || key == 's')
    moveDown = pushedDown;    

  if (keyCode == UP || key == 'w')
    moveUp = pushedDown;

  if (key == 'g' && pushedDown == true)
    gravityEnabled = !gravityEnabled;
}