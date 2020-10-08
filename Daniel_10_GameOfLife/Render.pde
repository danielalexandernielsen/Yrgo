float zoomFactor = 10;
float zoomSpeed = 0.1;
float rotateFactor = 1;
float rotateSpeed = 0.01;

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
