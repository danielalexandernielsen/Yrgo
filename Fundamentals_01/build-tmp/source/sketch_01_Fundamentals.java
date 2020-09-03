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

public class sketch_01_Fundamentals extends PApplet {

int gradientColorBottom, gradientColorTop;

public void setup() {
	

	gradientColorTop = color(45, 73, 123);
	gradientColorBottom = color(42, 16, 49);

	noLoop();
}

public void draw() {
	setGradient(0, 0, width, height, gradientColorBottom, gradientColorTop);

	stroke(255, 255, 255);
	strokeWeight(2.5f);
	line(199, 166, 388, 295, 50, 50);
}

public void setGradient(int x, int y, float gradientWidth, float gradientHeight, int gradientColorBottom, int gradientColorTop ) {

	noFill();

	for (int i = y; i <= y + gradientHeight; i++) {
		float inter = map(i, y, y + gradientHeight, 0, 1);
		int c = lerpColor(gradientColorBottom, gradientColorTop, inter);
		stroke(c);
		line(x, i, x+gradientWidth, i);
	}
}
  public void settings() { 	size(768, 432); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_01_Fundamentals" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
