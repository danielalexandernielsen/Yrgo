color gradientColorBottom, gradientColorTop; //<>//
color strokeColor;

void setup() {
  size(768, 432);

  gradientColorTop = color(45, 73, 123);
  gradientColorBottom = color(42, 16, 49);
}

void draw() {
  setGradient(0, 0, width, height, gradientColorBottom, gradientColorTop);
  drawTextDaniel(33, 89, 1.6);
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

void drawTextDaniel(int positionX, int positionY, float size)
{
  scale(size);
  translate(positionX, positionY);
  
  stroke(105, 160, 238);      
  strokeWeight(3);
  nameLetterD(13, 43, 0);    
  nameLetterA(68, 0, 0); 
  nameLetterN(153, 0, 0); 
  nameLetterI(247, 0, 0); 
  nameLetterE(280, 0, 0); 
  nameLetterL(359, 0, 0);
}

void nameLetterD(int positionX, int positionY, float size)
{
  push();
  noFill();
  translate(positionX, positionY);
  rotate(radians(247));
  arc(0, 0, 81, 81, 0, PI+QUARTER_PI, CHORD);
  pop();
}

void nameLetterA(int positionX, int positionY, float size)
{
  push();
  translate(positionX, positionY);
  line(30, 0, 0, 85);
  line(30, 0, 60, 84);
  line(12, 53, 47, 53);
  pop();
}

void nameLetterN(int positionX, int positionY, float size)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  line(0, 0, 60, 84);
  line(60, 0, 60, 84);
  pop();
}

void nameLetterI(int positionX, int positionY, float size)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  pop();
}

void nameLetterE(int positionX, int positionY, float size)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  line(0, 0, 50, 0);
  line(0, 42, 50, 42);
  line(0, 84, 50, 84);
  pop();
}

void nameLetterL(int positionX, int positionY, float size)
{
  push();
  translate(positionX, positionY);
  line(0, 0, 0, 84);
  line(0, 84, 50, 84);
  pop();
}
