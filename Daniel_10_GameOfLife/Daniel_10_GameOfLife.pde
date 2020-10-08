float zoomFactor = 10;
float zoomSpeed = 0.1;
float rotateFactor = 1;
float rotateSpeed = 0.01;
int cellSize = 2;
int columns;
int rows;
int birthProbability = 30;

boolean[] cells;
boolean[] cellsBuffer; 

void setup() 
{
  size(1280, 720);
  fill(255);
  stroke(15, 50, 100);
  strokeWeight(1.25);

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
  background(0);
  translate(width/2, height/2);

  zoom();
  rotation();
  iteration();
  display();
}


void zoom()
{
  scale(zoomFactor);
  zoomSpeed *= 0.989;
  zoomFactor -= zoomSpeed;
}

void rotation()
{
  rotate(rotateFactor);
  rotateSpeed *= 0.99;
  rotateFactor -= rotateSpeed;
}

void display()
{
  for (int x = 0; x < columns; x++) 
  {
    for (int y = 0; y < rows; y++) 
    {
      if (cells[x + (y * columns)] == true) 
        rect ((x * cellSize) - width/2, (y * cellSize) - height/2, cellSize, cellSize);

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
      } else 
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
