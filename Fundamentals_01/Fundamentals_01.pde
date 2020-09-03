color gradientColorBottom, gradientColorTop;
color strokeColor;

void setup() {
  size(768, 432);

  gradientColorTop = color(45, 73, 123);
  gradientColorBottom = color(42, 16, 49);
}

void draw() {
  setGradient(0, 0, width, height, gradientColorBottom, gradientColorTop); //<>// //<>// //<>// //<>// //<>//
  drawTextDaniel(0, 0, 0);
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
  stroke(105, 160, 238);      
  strokeWeight(3);

  nameLetterD(0, 0, 0);    
  nameLetterA(0, 0, 0); 
  nameLetterN(0, 0, 0); 
  nameLetterI(0, 0, 0); 
  nameLetterE(0, 0, 0); 
  nameLetterL(0, 0, 0);
}

void nameLetterD(int positionX, int positionY, float size)
{
  noFill();
  push();
  translate(65, 201);
  rotate(radians(247));
  arc(0, 0, 81, 81, 0, PI+QUARTER_PI, CHORD);
  pop();
}

void nameLetterA(int positionX, int positionY, float size)
{
  push();
  translate(112, 0);
  line(30, 161, 0, 245);
  line(30, 161, 60, 245);
  line(12, 214, 47, 214);
  pop();
}

void nameLetterN(int positionX, int positionY, float size)
{
  push();
  translate(189, 0);
  line(0, 161, 0, 245);
  line(0, 161, 60, 245);
  line(60, 161, 60, 245);
  pop();
}

void nameLetterI(int positionX, int positionY, float size)
{
  push();
  translate(279, 0);
  line(0, 161, 0, 245);
  pop();
}

void nameLetterE(int positionX, int positionY, float size)
{
  push();
  translate(310, 0);
  line(0, 161, 0, 245);
  line(0, 161, 50, 161);
  line(0, 203, 50, 203);
  line(0, 245, 50, 245);
  pop();
}

void nameLetterL(int positionX, int positionY, float size)
{
  push();
  translate(402, 0);
  line(0, 161, 0, 245);
  line(0, 245, 50, 245);
  pop();
}
