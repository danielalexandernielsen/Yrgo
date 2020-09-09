ParabolicCurve pCurve;
color colorBottom, colorTop, strokeColor;
Axis axis1, axis2;
int numberOfLines;

void setup()
{
  size(500, 500, P3D);

  colorTop = color(45, 73, 123);
  colorBottom = color(42, 16, 49);

  axis1 = new Axis(0, 0);
  axis2 = new Axis(10, width);
  pCurve = new ParabolicCurve(axis1, axis2, 20);
}

void draw()
{
  displayGradient(colorTop, colorBottom);
  pCurve.displayRose();
}

void displayGradient(color colorTop, color colorBottom)
{
  for (int y = 0, x = 0; y <= height; y++) {
    float interval = map(y, 0, height, 0, 1);
    color gradient = lerpColor(colorBottom, colorTop, interval);
    stroke(gradient);
    line(x, y, width, y);
  }
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

  void displayCurve()
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

  void displayRose()
  {   
    int[] lineLength = new int[] {0, 125, 250, 350, 430, 480, 500, 480, 430, 350, 250, 125, 0};
    
    translate(width/2, height/2);
    scale(1.16);
    circle(width, height, 499);

    for (int shiftRotation = 0; shiftRotation <= 360; shiftRotation += 15)
    {
      push();
      rotate(radians(shiftRotation + 0));

      for (int degrees = 0, i = 0; degrees <= 180; degrees += 15, i++)
      {
        push();
        translate(0, -250);
        rotate(radians(degrees - 90));
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
