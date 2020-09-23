static boolean running = true;
static boolean gameOver = false;

void startGame()
{
  running = true;
  gameOver = false;
}

void pauseGame()
{
  if (!gameOver)
    running = !running;
}

void gameOver()
{
  running = false;
  gameOver = true;

  push();
  textSize(55);
  text("GAME OVER", width/2, height/2);
  textSize(20);
  text("Click space to continue.", width/2, height/2 + 43);
  textAlign(CENTER, CENTER);
  pop();
}
