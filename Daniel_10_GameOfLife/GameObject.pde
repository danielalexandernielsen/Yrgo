class GameObject
{
	boolean isAlive;

	int x;
	int y;

	GameObject(int x, int y, boolean isAlive)
	{
		this.x = x;
		this.y = y;
		this.isAlive = isAlive;
	}


	void alive(boolean isAlive)
	{
		this.isAlive = isAlive;
	}

	void draw()
	{
		push();
		if (isAlive)
			fill(0);
		else
			fill(255);

		rect(x, y, cellSize, cellSize);
		pop();
	}
}
