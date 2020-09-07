ParabolicCurve pCurve;

void setup()
{
  size(500, 500);
  Axis axis1 = new Axis(0, 0);
  Axis axis2 = new Axis(10, 500);

  pCurve = new ParabolicCurve(axis1, axis2, 20);
}

void draw()
{
  background(255);

  pCurve.display();
}

class Axis
{
  int x, y;
  Axis(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}


class ParabolicCurve
{
  int numberOfLines; 
  Axis axis1, axis2;

  ParabolicCurve(Axis axis1, Axis axis2, int numberOfLines)
  {
    this.numberOfLines = numberOfLines;
    this.axis1 = axis1;
    this.axis2 = axis2;
  }

  void display()
  {
    for (int x = axis2.x, y = axis1.y; y <= height; x+= width/numberOfLines, y+= height/numberOfLines)
    {
      if (x % 3 == 0)
      {
        stroke(0);
      } else
      {
        stroke(127);
      }

      line(axis1.x, y, x, axis2.y);
    }
  }
}
