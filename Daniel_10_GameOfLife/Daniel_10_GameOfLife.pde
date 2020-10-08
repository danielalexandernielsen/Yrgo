int cellSize = 5;
int columns;
int rows;
int birthProbability = 20;

color alive = color(0, 200, 0);
color dead = color(0);

boolean[] cells;
boolean[] cellsBuffer; 

void setup() 
{
  size (1280, 720);
  noSmooth();
  stroke(48);

  columns = width / cellSize;
  rows = height / cellSize;

  cells = new boolean[columns * rows];
  cellsBuffer = new boolean[columns * rows];

  for (int i = 0; i < cells.length; ++i) 
  {
    if (birthProbability > random(100)) 
      cells[i] = true;
  }
}


void draw() 
{
  iteration();
  display();
}


void display()
{
  background(0);

  for (int x = 0; x < columns; x++) 
  {
    for (int y = 0; y < rows; y++) 
    {
      if (cells[x + (y * columns)] == true) 
      {
        fill(alive);
        rect (x * cellSize, y * cellSize, cellSize, cellSize);
      }

      cellsBuffer[x + (y * columns)] = cells[x + (y * columns)];
    }
  }
}

void iteration() 
{

  for (int x = 0; x < columns; x++) 
  {
    for (int y = 0; y < rows; y++) 
    {
      int adjacentCells = countAdjacentCells(x, y);

      if (cellsBuffer[x + (y * columns)] == true) 
      {
        if (adjacentCells < 2 || adjacentCells > 3) 
          cells[x + (y * columns)] = false;
      } 

      else 
      {     
        if (adjacentCells == 3 )
          cells[x + (y * columns)] = true;
      }
    }
  }
}

int countAdjacentCells(int x, int y)
{
  int adjacentCells = 0;

  for (int xx = x - 1; xx <= x + 1; xx++) 
  {
    for (int yy = y - 1; yy <= y + 1; yy++) 
    {  
      if (((xx >= 0) && (xx < columns)) && ((yy >= 0) && (yy < rows))) 
      {
        if (!((xx == x) && ( yy == y))) 
        {
          if (cellsBuffer[xx + (yy * columns)] == true) 
            adjacentCells ++;
        }
      }
    }
  } 

  return adjacentCells;
}
