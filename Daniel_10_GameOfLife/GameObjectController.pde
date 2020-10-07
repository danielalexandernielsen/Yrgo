class GameObjectController
{	
	int cellSaturation;
	int cellSize;
	int columns;
	int rows;
	GameObject[][] grid;

	GameObjectController(int cellSaturation, int cellSize)
	{
		this.cellSaturation = cellSaturation;
		this.cellSize = cellSize;
		columns = width / cellSize;
		rows = height / cellSize;

		spawnCells();
	}

	void update()
	{
		int adjacentCells = 0;

		for (int x = 0; x < columns - 1; x++) 
		{
			for (int y = 0; y < rows - 1; y++) 
			{
				adjacentCells = countAdjacentCells(x, y);
				
				if (adjacentCells < 2)								          	// dies of underpopulation
					grid[x][y].isAlive = false;
				if (adjacentCells == 2 || adjacentCells == 3)			// lives on to the next generation
					grid[x][y].isAlive = true;
				if (adjacentCells > 3)									          // dies of overpopulation
					grid[x][y].isAlive = false;
				if (adjacentCells == 3)									          // lives through reproduction
					grid[x][y].isAlive = true;
			}
		}
	}


	void draw()
	{
		for (int x = 0; x < columns; x++) 
		{
			for (int y = 0; y < rows; y++) 
			{
				grid[x][y].draw();
			}
		}
	}


	int countAdjacentCells(int x, int y)
	{
		int adjacentCells = 0;

		for (int xAdjacent = -1; xAdjacent <= 1; xAdjacent++) 
		{
			if (x == 0 || x == columns)
				continue;

			for (int yAdjacent = -1; yAdjacent <= 1; yAdjacent++) 
			{
				if (y == 0 || y == rows)
					continue;

				if (grid[x - xAdjacent][y - yAdjacent].isAlive == true && (xAdjacent != 0 && yAdjacent != 0))
					adjacentCells++;
			}
		}

		return adjacentCells;
	}



	void spawnCells()
	{
		grid = new GameObject[columns][rows];

		for (int col = 0; col < columns; col++) 
		{
			for (int row = 0; row < rows; row++) 
			{
				int x = col * cellSize;
				int y = row * cellSize;

				if (random(100) <= cellSaturation)
					grid[col][row] = new GameObject(x, y, true);
				else
					grid[col][row] = new GameObject(x, y, false);
			}
		}
	}

}


/*
Calculate the next board state, checking each spot on the grid.
 Do all calculation in memory before updating the grid!
 Make sure you can handle all edge cases. Trying to check a spot outside the grid will make the program crash.*/
