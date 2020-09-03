color gradientColorBottom, gradientColorTop;
color strokeColor;

void setup() {
  size(768, 432);

  gradientColorTop = color(45, 73, 123);
  gradientColorBottom = color(42, 16, 49);
}

void draw() {
  setGradient(0, 0, width, height, gradientColorBottom, gradientColorTop);    

  drawTextDaniel(0, 0, 0, 1);
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

void drawTextDaniel(int positionX, int positionY, float depth, float size)
{
  stroke(105, 160, 238);      
  strokeWeight(4);

  nameLetterD(0, 0, 0, 0);    
  nameLetterA(0, 0, 0, 0); 
  nameLetterN(0, 0, 0, 0); 
  nameLetterI(0, 0, 0, 0); 
  nameLetterE(0, 0, 0, 0); 
  nameLetterL(0, 0, 0, 0);
}

void nameLetterD(int positionX, int positionY, float depth, float size)
{
  // line(199, 166, 388, 295);
}

void nameLetterA(int positionX, int positionY, float depth, float size)
{
  line(256, 161, 220, 245);
  line(256, 161, 291, 245);
  line(278, 214, 233, 214);
}

void nameLetterN(int positionX, int positionY, float depth, float size)
{
}

void nameLetterI(int positionX, int positionY, float depth, float size)
{
}

void nameLetterE(int positionX, int positionY, float depth, float size)
{
}

void nameLetterL(int positionX, int positionY, float depth, float size)
{
}
