PVector inputDiscard = new PVector();

PVector input()
{
  inputDiscard.set(0, 0);

  if (moveLeft)
    inputDiscard.x -= 1;

  if (moveRight)
    inputDiscard.x += 1;

  if (moveUp)
    inputDiscard.y -= 1;

  if (moveDown)
    inputDiscard.y += 1;

  return inputDiscard.normalize();
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
