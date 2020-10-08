class CellController
{	
	int spawnProbability;
	int cellSize;
	int columns;
	int rows;
	Cell[][] cells;
	Cell[][] bufferCells;

	CellController(int spawnProbability, int cellSize)
	{
		this.spawnProbability = spawnProbability;
		this.cellSize = cellSize;
		columns = (int)Math.floor(width / cellSize);
		rows = (int)Math.floor(height / cellSize);

		cells = new Cell[columns][rows];
		bufferCells = new Cell[columns][rows];

		spawnCells();
	}

	void spawnCells()
	{
		for (int x = 0; x < columns; x++) 
		{
			for (int y = 0; y < rows; y++) 
			{
				cells[x][y] = new Cell(x * cellSize, y * cellSize, cellSize);
				bufferCells[x][y] = new Cell(x * cellSize, y * cellSize, cellSize);

				if (random(100) <= spawnProbability)
					cells[x][y].isAlive = true;
			}
		}
	}


	void draw()
	{
		for (int x = 0; x < columns; x++) 
		{
			for (int y = 0; y < rows; y++) 
			{
				copyBufferToCells();
				cells[x][y].draw();
			}
		}
	}

	void copyBufferToCells()
	{
		for (int x = 0; x < columns; x++) 
		{
			for (int y = 0; y < rows; y++) 
			{
				cells[x][y] = bufferCells[x][y];
			}
		}
	}



	void update()
	{
		int adjacentCells = 0;

		for (int x = 0; x < columns; x++) 
		{
			for (int y = 0; y < rows; y++) 
			{
				adjacentCells = countAdjacentCells(x, y);

				if (cells[x][y].isAlive)
				{
					if (adjacentCells < 2)		
						bufferCells[x][y].isAlive = false;
					if (adjacentCells == 2 || adjacentCells == 3)
						bufferCells[x][y].isAlive = true;
					if (adjacentCells > 3)			
						bufferCells[x][y].isAlive = false;	
				}			

				if (!cells[x][y].isAlive)
				{
					if (adjacentCells == 3 && cells[x][y].isAlive == false)
						bufferCells[x][y].isAlive = true;
				}
			}
		}
	}


	int countAdjacentCells(int x, int y)
	{
		int adjacentCells = 0;

		for (int xAdjacent = -1; xAdjacent <= 1; xAdjacent++) 
		{
			for (int yAdjacent = -1; yAdjacent <= 1; yAdjacent++) 
			{
				if (xAdjacent != 0 && yAdjacent != 0)
				{

					int adjacentCellX = x + xAdjacent;
					int adjacentCellY = y + yAdjacent;


					if (adjacentCellX < 0)
						adjacentCellX = columns;

					if (adjacentCellX > columns - 1)
						adjacentCellX = 0;

					if (adjacentCellY < 0)
						adjacentCellY = rows;

					if (adjacentCellY > rows - 1)
						adjacentCellY = 0;


					if (cells[adjacentCellX][adjacentCellY].isAlive == true)
						adjacentCells++;
				}
			}
		}
		return adjacentCells;
	}
}
