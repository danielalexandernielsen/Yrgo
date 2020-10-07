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

		for (int x = 0; x < columns; x++) 
		{
			for (int y = 0; y < rows; y++) 
			{

				adjacentCells = findAdjacentCells(x, y);



        // (-1, -1)	(0, -1) (1, -1)
        // (-1, 0 )	(0 , 0) (1, 0 )
        // (-1, 1 ) (0 , 1) (1, 1 )
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

int findAdjacentCells(int x, int y)
{
	int adjacentCells = 0;

	for (int xAdjacent = -1; xAdjacent <= 1; xAdjacent++) 
	{
		if (x + xAdjacent < 0)
			continue;
		else if (x + xAdjacent > width)
			continue;

		for (int yAdjacent = -1; yAdjacent <= 1; yAdjacent++) 
		{
			println("X before: " + x);
			println("Y before: " + y);

			if (y + yAdjacent < 0)
				continue;
			else if (y + yAdjacent > height)
				continue;

        //println("X: " + x);
        //println("Y: " + y);
        //println("xAdjacent: " + xAdjacent);
        //println("yAdjacent: " + yAdjacent);
        //delay(1000);

        if (grid[x - xAdjacent][y - yAdjacent].isAlive == true || (xAdjacent != 0 && yAdjacent != 0))
        	adjacentCells ++;
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
Rules of the game:
 
 Any live cell with fewer than two live neighbors dies,
 Any live cell with two or three live neighbors lives
 Any live cell with more than three live neighbors dies
 Any dead cell with exactly three live neighbors becomes a live cell
 */




/*
Calculate the next board state, checking each spot on the grid.
 Do all calculation in memory before updating the grid!
 Make sure you can handle all edge cases. Trying to check a spot outside the grid will make the program crash.*/
