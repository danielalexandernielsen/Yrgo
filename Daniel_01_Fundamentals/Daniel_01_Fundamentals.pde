color colorBottom, colorTop, strokeColor;
Letter D, A, N, I, E, L;

void setup() 
{
  size(768, 432, P3D);

  colorTop = color(45, 73, 123);
  colorBottom = color(42, 16, 49);
  strokeColor = color(105, 160, 238);

  D = new Letter('D');
  A = new Letter('A');
  N = new Letter('N');
  I = new Letter('I');
  E = new Letter('E');
  L = new Letter('L');

  background(0);
}

void draw() 
{
  displayGradient(colorTop, colorBottom);
  displayName(strokeColor, 4);
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


void displayName(color strokeColor, int strokeWidth)
{
  push();

  stroke(strokeColor);      
  strokeWeight(strokeWidth);

  D.animateLetter(13, 43, 5);
  D.rotateLetter(247);
  D.displayLetter();

  A.animateLetter(68, 0, 6);
  A.rotateLetter(0);
  A.displayLetter();

  N.animateLetter(153, 0, 4);
  N.rotateLetter(0);
  N.displayLetter();

  I.animateLetter(247, 0, 7);
  I.rotateLetter(0);
  I.displayLetter();

  E.animateLetter(280, 0, 3);
  E.rotateLetter(0);
  E.displayLetter();

  L.animateLetter(359, 0, 5);
  L.rotateLetter(0);
  L.displayLetter();

  pop();
}


class Letter 
{  
  char character;
  int characterWidth, characterHeight, characterAdjustTop, characterAdjustLeft;
  boolean pushExecuted = false;
  boolean startConditionsSet = false;
  int positionX, positionY, ySpeed, xSpeed;

  Letter(char character) 
  {
    this.character = character;
  }

  void displayLetter() 
  {
    switch(character) 
    {
    case 'D':
      noFill();
      arc(0, 0, 81, 81, 0, PI+QUARTER_PI, CHORD);
      characterAdjustTop = -40;
      characterAdjustLeft = -20;
      characterWidth = 45;
      characterHeight = 43;
      break;

    case 'A':
      line(0, 84, 30, 0);
      line(30, 0, 60, 84);
      line(12, 53, 47, 53);
      characterWidth = 60;
      characterHeight = 85;
      break;

    case 'N':
      line(0, 0, 0, 84);
      line(0, 0, 60, 84);
      line(60, 0, 60, 84);
      characterWidth = 60;
      characterHeight = 85;
      break;

    case 'I':
      line(0, 0, 0, 84);
      characterWidth = 2;
      characterHeight = 85;
      break;

    case 'E':
      line(0, 0, 0, 84);
      line(0, 0, 50, 0);
      line(0, 42, 50, 42);
      line(0, 84, 50, 84);
      characterWidth = 50;
      characterHeight = 84;
      break;

    case 'L':
      line(0, 0, 0, 84);
      line(0, 84, 50, 84);
      characterWidth = 50;
      characterHeight = 85;
      break;

    default:
      print("Error: Letter not implemented.");
      break;
    }
    pop();
    pushToStack("reset");
  }

  void animateLetter(int positionX, int positionY, int speed) 
  {
    pushToStack("execute");

    if (!startConditionsSet)
    {
      this.positionX = positionX;
      this.positionY = positionY;
      this.xSpeed = speed;
      this.ySpeed = speed;
      startConditionsSet = true;
    }

    this.positionX += this.xSpeed;
    this.positionY += this.ySpeed;

    if (this.positionX > width - characterWidth || this.positionX + characterAdjustLeft < 0)
    {
      this.xSpeed *= -1;
    }

    if (this.positionY > height - characterHeight || this.positionY + characterAdjustTop < 0)
    {
      this.ySpeed *= -1;
    }

    translate(this.positionX, this.positionY);
  }

  void rotateLetter(int degrees) 
  {
    pushToStack("execute");
    rotate(radians(degrees));
  }

  void pushToStack(String command) 
  {
    if (!pushExecuted) {     
      push();
      pushExecuted = true;
    } else if (command == "reset") {
      pushExecuted = false;
    }
  }
}
