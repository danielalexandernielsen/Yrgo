ParabolicCurve pCurve;
color colorBackground, colorForeground, strokeColor;
Axis axis1, axis2;
int numberOfLines;

void setup()
{
  size(500, 500, P3D);

  colorBackground = color(45, 73, 123);
  colorForeground = color(42, 16, 49);

  axis1 = new Axis(0, 0);
  axis2 = new Axis(10, width);
  pCurve = new ParabolicCurve(axis1, axis2, 20);
}

void draw()
{
  background(10, 20, 41);
  pCurve.drawRose();
}




class ParabolicCurve
{
  int numberOfLines; 
  int frame = 0;
  Axis axis1, axis2;

  ParabolicCurve(Axis axis1, Axis axis2, int numberOfLines)
  {
    this.numberOfLines = numberOfLines;
    this.axis1 = axis1;
    this.axis2 = axis2;
  }

  void drawCurve()
  {   
    for (int x = axis2.x, y = axis1.y; y <= height; x+= width/this.numberOfLines, y+= height/this.numberOfLines)
    {
      if (x % 3 == 0)
      {
        stroke(0);
      } else
      {
        stroke(127);
      }

      line(axis1.x, (y + frame) % height, (x + frame) % width, axis2.y);
    }
    frame++;
  }

  void drawRose()
  {   
    int[] lineLength = new int[] {0, 125, 250, 350, 430, 480, 500, 480, 430, 350, 250, 125, 0};

    translate(width/2, height/2);
    scale(0.77);
    stroke(243, 206, 24);
    strokeWeight(1);
    fill(192, 120, 24, 95);
    circle(0, 0, 497);

    for (int shiftRotation = 0; shiftRotation <= 360; shiftRotation += 15)
    {
      push();
      rotate(radians(shiftRotation + 0));

      for (int degrees = 0, i = 0; degrees <= 180; degrees += 15, i++)
      {
        push();
        translate(0, -250);
        rotate(radians(degrees - 90));
        if (i % 2 == 0)
        {
          stroke(204, 145, 78, 255);
        } 
        else if (i % 3 == 0)
        {
          stroke(213, 168, 75, 242);
        } 
        else if (i % 4 == 0)
        {
          stroke(194, 162, 91, 244);
        }
        line(0, 0, frame % height, lineLength[i]);
        pop();
      }
      pop();
    }

    frame++;
  }
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
