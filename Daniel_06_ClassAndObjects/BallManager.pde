class BallManager
{
	Ball[] balls;

	BallManager(int numberOfBalls)
	{
		balls = new Ball[numberOfBalls];
		
		for(int i = 0; i < balls.length; i++)
		{
			balls[i] = new Ball(100, 100, 25, color(125, 25, 190));
		}
	}

	void display()
	{
		for(int i = 0; i < balls.length; i++)
		{
			balls[i].update();
			balls[i].bounce();
			balls[i].display();
		}
	}
}