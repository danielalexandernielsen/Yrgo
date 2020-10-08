class Cell
{
	boolean isAlive = false;

	int x;
	int y;
	int cellSize;
	
	Cell(int x, int y, int cellSize)
	{
		this.x = x;
		this.y = y;
		this.cellSize = cellSize;
	}

	void draw()
	{
		push();

		if (isAlive)
		{
			fill(0);
			rect(x, y, cellSize, cellSize);
		}

		
		pop();
	}
}
