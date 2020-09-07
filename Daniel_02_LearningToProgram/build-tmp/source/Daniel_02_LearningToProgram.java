import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Daniel_02_LearningToProgram extends PApplet {

ParabolicCurve pCurve;
Axis axis1, axis2;

public void setup()
{
  
  axis1 = new Axis(0, 0);
  axis2 = new Axis(10, 500);
  pCurve = new ParabolicCurve(axis1, axis2, 20);
}

public void draw()
{
  background(255);

  pCurve.drawCircle();
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

  public void drawGraph()
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

      line(axis1.x, y, x, axis2.y);
    }
  }

  public void drawCircle()
  {   
    
    circle(width/2, height/2, 450);
    
    for (int x = axis2.x, y = axis1.y; y <= height; x+= width/this.numberOfLines, y+= height/this.numberOfLines)
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

class Axis
{
  int x, y;
  Axis(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
}
  public void settings() {  size(500, 500, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Daniel_02_LearningToProgram" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
