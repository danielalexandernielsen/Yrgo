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
