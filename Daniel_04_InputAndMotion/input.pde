void keyPressed()
{
  if (key == CODED)
    keys[keyCode] = true;
  else
    keys[key] = true;
}

void keyReleased()
{
  if (key == CODED)
    keys[keyCode] = false;
  else
    keys[key] = false;
}