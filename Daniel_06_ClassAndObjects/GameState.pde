static class GameState
{
	static boolean running = true;
	static boolean gameOver = false;

	static void startGame()
	{
		running = true;
		gameOver = false;
	}

	static void pauseGame()
	{
		if (!gameOver)
			running = !running;
	}

	static void gameOver()
	{
		running = false;
		gameOver = true;

    /*
		push();
		textSize(55);
		text("GAME OVER", width/2, height/2);
		textSize(20);
		text("Click space to continue.", width/2, height/2 + 43);
		textAlign(CENTER, CENTER);
		pop();
    */
	}
}
