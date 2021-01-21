import java.util.Map;

class DanNie implements WalkerInterface 
{
  int myPositionX;
  int myPositionY;
  int playAreaWidth;
  int playAreaHeight;
  int backgroundColorCode;
  int[] playArea;
  Map<Integer, Integer> allColorsAtStart = new HashMap<Integer, Integer>();

  int myColor;
  boolean hasMyColorBeenPickedUp = false;
  boolean isStartPositionEmpty = false;

  String getName()
  {
    return "DanNie";
  }

  PVector getStartPosition(int playAreaWidth, int playAreaHeight)
  {
    this.playAreaWidth = playAreaWidth;
    this.playAreaHeight = playAreaHeight;
    this.playArea = new int[playAreaWidth];
    int x = 0;
    int y = 0;


    // Determine background color
    for (int i = 0; i < playAreaWidth; ++i) 
    {
      playArea[i] = get(i, 1);
    } 
    
    for (Integer pixel : playArea) 
    {
      Integer quantity = allColorsAtStart.get(pixel);
      allColorsAtStart.put(pixel, quantity == null? 1 : quantity + 1);
    }

    backgroundColorCode = (int)allColorsAtStart.keySet().toArray()[allColorsAtStart.size()-1];

    // Check for an empty start position, return position when an empty one is found.
    while (!isStartPositionEmpty)
    {
      x = (int) random(0, playAreaWidth);
      y = (int) random(0, playAreaHeight);

      if (get((int)x, (int)y) == backgroundColorCode)
      {
        myPositionX = x;
        myPositionY = y;
        isStartPositionEmpty = true;
      }
    }

    return new PVector(x, y);
  }

  PVector update()
  {

    // Check what my color is

    if (!hasMyColorBeenPickedUp)
    {
      myColor = get(myPositionX, myPositionY);
      hasMyColorBeenPickedUp = true;
    }

    // Check if any adjacent cell is empty.

    if (get(myPositionX - 1, myPositionY) == backgroundColorCode && myPositionX - 1 > 0)
    {
      myPositionX -= 1;
      return new PVector(-1, 0);
    } 

    else if (get(myPositionX + 1, myPositionY) == backgroundColorCode && myPositionX + 1 < playAreaWidth - 1)
    {
      myPositionX += 1;
      return new PVector(1, 0);
    } 

    else if (get(myPositionX, myPositionY + 1) == -335544 && myPositionY + 1 < playAreaHeight - 1)
    {
      myPositionY += 1;
      return new PVector(0, 1);
    } 

    else if (get(myPositionX, myPositionY - 1) == backgroundColorCode && myPositionY - 1 > 0)
    {
      myPositionY -= 1;
      return new PVector(0, -1);
    }

    // If no adjacent cell is empty, than move on my own cells to avoid collision.

    else if (get(myPositionX - 1, myPositionY) == myColor && myPositionX - 1 > 0)
    {
      myPositionX -= 1;
      return new PVector(-1, 0);
    }

    else if (get(myPositionX + 1, myPositionY) == myColor && myPositionX + 1 < playAreaWidth - 1)
    {
      myPositionX += 1;
      return new PVector(1, 0);
    } 

    else if (get(myPositionX, myPositionY + 1) == myColor && myPositionY + 1 < playAreaHeight  - 1)
    {
      myPositionY += 1;
      return new PVector(0, 1);
    } 

    else if (get(myPositionX, myPositionY - 1) == myColor && myPositionY - 1 > 0)
    {
      myPositionY -= 1;
      return new PVector(0, -1);
    }

    // If no adjacent cell is empty, and none of my own cells are available. Walk randomly, but avoid the edges.

    else
    {

      while (true)
      {    
        int randomDirection = (int)random(0, 4);

        if (randomDirection == 0 && myPositionX - 1 > 0)
        {
          myPositionX -= 1;
          return new PVector(-1, 0);
        } 

        else if (randomDirection == 1 && myPositionX + 1 < playAreaWidth - 1)
        {
          myPositionX += 1;
          return new PVector(1, 0);
        }

        else if (randomDirection == 2 && myPositionY + 1 < playAreaHeight - 1)
        {
          myPositionY += 1;
          return new PVector(0, 1);
        }

        else if (randomDirection == 3 && myPositionY - 1 > 0)
        {
          myPositionY -= 1;
          return new PVector(0, -1);
        }
      }

    }
  }
}
