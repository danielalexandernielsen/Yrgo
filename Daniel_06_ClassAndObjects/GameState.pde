static boolean running = true;
static boolean gameOver = false;

void startGame()
{
	if (gameOver)
	{
		running = true;
		gameOver = false;
		setup();
	}
}

void pauseGame()
{
	if (!gameOver)		
		running = !running;

	if (!running)
	{
		push();
		textAlign(CENTER, CENTER);
		textSize(height/10);
		text("GAME IS PAUSED", width/2, height/2);
		textSize(height/30);
		text("Click 'P' to continue.", width/2, height/2 + height/13);
		pop();
	}
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
	text("Click space to continue.", width/2, height/2 + height/13);
	pop();
}
