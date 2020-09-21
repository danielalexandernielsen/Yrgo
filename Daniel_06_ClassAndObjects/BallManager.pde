class BallManager
{
	Ball[] balls;

	BallManager(int numberOfBalls)
	{
		balls = new Ball[numberOfBalls];

		for(int i = 0; i < balls.length; i++)
		{
			float x = random(0, width);
			float y = random (0, height);
			float size = random(10, 100);
			color colour = color(random(0, 255), random(0, 255), random(0, 255));
			balls[i] = new Ball(x, y, size, colour);
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