color gradientColorBottom, gradientColorTop; //<>//
color strokeColor;
PImage renderedName;

void setup() {
  size(768, 432, P3D);

  gradientColorTop = color(45, 73, 123);
  gradientColorBottom = color(42, 16, 49);
  setGradient(0, 0, width, height, gradientColorBottom, gradientColorTop);

  drawTextDaniel(39, 89, 1.6);
  filter(BLUR, 4);
  renderedName = get();
}

void draw() {
  
  // displaceText();
}


void drawTextDaniel(int positionX, int positionY, float size)
{
  scale(size);
  translate(positionX, positionY);

  stroke(105, 160, 238);      
  strokeWeight(3);
  nameLetterD(13, 43);    
  nameLetterA(68, 0); 
  nameLetterN(153, 0); 
  nameLetterI(247, 0); 
  nameLetterE(280, 0); 
  nameLetterL(359, 0);
}

void nameLetterD(int positionX, int positionY)
{
  push();
  noFill();
  translate(positionX, positionY);
  rotate(radians(247));
  arc(0, 0, 81, 81, 0, PI+QUARTER_PI, CHORD);
  pop();
}

void nameLetterA(int positionX, int positionY)
{
  push();
  translate(positionX, positionY);
  line(30, 0, 0, 85);
  line(30, 0, 60, 84);
  line(12, 53, 47, 53);
  pop();
}

void nameLetterN(int positionX, int positionY)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  line(0, 0, 60, 84);
  line(60, 0, 60, 84);
  pop();
}

void nameLetterI(int positionX, int positionY)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  pop();
}

void nameLetterE(int positionX, int positionY)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  line(0, 0, 50, 0);
  line(0, 42, 50, 42);
  line(0, 84, 50, 84);
  pop();
}

void nameLetterL(int positionX, int positionY)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  line(0, 84, 50, 84);
  pop();
}

void setGradient(int x, int y, float gradientWidth, float gradientHeight, color gradientColorBottom, color gradientColorTop ) 
{
  for (int i = y; i <= y + gradientHeight; i++) 
  {
    float inter = map(i, y, y + gradientHeight, 0, 1);
    color gradient = lerpColor(gradientColorBottom, gradientColorTop, inter);
    stroke(gradient);
    line(x, i, x+gradientWidth, i);
  }
}

void displaceText()
{
  renderedName.loadPixels();
  
  for (int y = 0; y < height; y++)
  {
    for (int x = 0; x < width; x++)
    {
      
    }
  }
  
  renderedName.updatePixels();
  image(renderedName,0,0);
}
