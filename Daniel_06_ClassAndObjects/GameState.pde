static boolean running = true;
static boolean gameOver = false;

void startGame()
{
	if (gameOver)
	{
		running = true;
		gameOver = false;
	}
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
	textAlign(CENTER, CENTER);
	textSize(height/10);
	text("GAME OVER", width/2, height/2);
	textSize(height/30);
	text("Click space to continue.", width/2, height/2 + height/15);
	pop();
}
