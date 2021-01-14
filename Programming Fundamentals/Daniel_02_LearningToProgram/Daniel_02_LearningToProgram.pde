ParabolicCurve pCurve;
Axis axis1, axis2;
float zoom = 0.62;

void setup()
{
  size(500, 500, P3D);
  smooth(8);

  axis1 = new Axis(0, 0);
  axis2 = new Axis(10, width);
  pCurve = new ParabolicCurve(axis1, axis2, 20);
}

void draw()
{

  //pCurve.drawCurve();
  pCurve.drawSun();
  //saveFrame("nielsen_daniel_02LearningToProgram_-######.png");
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
    background(255);
    
    for (int x = axis2.x, y = axis1.y; y <= height; x+= width/numberOfLines, y+= height/numberOfLines)
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


  void drawSun()
  {   
    int[] rays = new int[] {0, 125, 250, 350, 430, 480, 500, 480, 430, 350, 250, 125, 0};
    color backgroundColor = color(10, 20, 41);
    color mainColor = color(243, 206, 24);
    color secondaryColor1 = color(204, 145, 78, 255);
    color secondaryColor2 = color(213, 168, 75, 242);
    color secondaryColor3 = color(194, 162, 91, 244);

    background(backgroundColor);
    translate(width/2, height/2);
    scale(zoom);
    stroke(mainColor);
    strokeWeight(1);

    for (int degrees = 0; degrees <= 360; degrees += 15)
    {
      push();
      rotate(radians(degrees));

      for (int angle = 0, i = 0; angle <= 180; angle += 15, i++)
      {
        push();
        translate(0, -14);
        rotate(radians(angle - 126));
        if (i % 2 == 0)
        {
          stroke(secondaryColor1);
        } 
        else if (i % 3 == 0)
        {
          stroke(secondaryColor2);
        } 
        else if (i % 4 == 0)
        {
          stroke(secondaryColor3);
        }
        line(0, 0, frame % height, rays[i]);
        pop();
      }
      pop();
    }

    frame++;
    zoom += 0.0025;
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
