boolean moveLeft, moveRight, moveUp, moveDown;

void keyPressed()
{
  keyToggle(true);
}

void keyReleased()
{
  keyToggle(false);
}

void keyToggle(boolean isPressed)
{
  if (keyCode == LEFT || key == 'a')
    moveLeft = isPressed;

  if (keyCode == RIGHT || key == 'd')
    moveRight = isPressed;    

  if (keyCode == DOWN || key == 's')
    moveDown = isPressed;    

  if (keyCode == UP || key == 'w')
    moveUp = isPressed;

  if ((key == 'g' || key == 'G') && isPressed == true)
    gravityEnabled = !gravityEnabled;

  if ((key == 'p' || key == 'P') && isPressed == true)
    pauseGame();
}
