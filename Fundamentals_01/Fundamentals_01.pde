color gradientColorBottom, gradientColorTop;
color strokeColor;

void setup() {
	size(768, 432);

	gradientColorTop = color(45, 73, 123);
	gradientColorBottom = color(42, 16, 49);
}

void draw() {
	setGradient(0, 0, width, height, gradientColorBottom, gradientColorTop);


}

void setGradient(int x, int y, float gradientWidth, float gradientHeight, color gradientColorBottom, color gradientColorTop ) 
{
	noFill();

	for (int i = y; i <= y + gradientHeight; i++) {
		float inter = map(i, y, y + gradientHeight, 0, 1);
		color c = lerpColor(gradientColorBottom, gradientColorTop, inter);
		stroke(c);
		line(x, i, x+gradientWidth, i);
	}
}

void drawTextDaniel(int positionX, int positionY, float depth, float size)
{
  stroke(105, 160, 238);
  strokeWeight(2.5);
  line(40, 60, 0, 40);
}

void nameLetterD(int positionX, int positionY, float depth, float size)
{
  
}

void nameLetterA(int positionX, int positionY, float depth, float size)
{
  
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
