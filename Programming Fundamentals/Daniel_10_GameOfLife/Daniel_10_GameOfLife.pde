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
