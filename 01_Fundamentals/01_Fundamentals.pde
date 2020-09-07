color colorBottom, colorTop, strokeColor;
int[] textBuffer, gradientBuffer;
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

  textBuffer = displayName(57, 136, 1.6, strokeColor, 3);
  gradientBuffer = displayGradient(colorTop, colorBottom);

  background(0);
}

void draw() 
{
  displayName(57, 136, 1.6, strokeColor, 3);
  color pink = color(255, 102, 204);
  loadPixels();
  for (int i = 0; i < (width*height/2)-width/2; i++) {
    pixels[i] = pink;
  }
  updatePixels();

  //drawPointcloud();
  //loadPixels();
  //pixels = textBuffer;
  //updatePixels();
}

int[] displayGradient(color colorTop, color colorBottom)
{
  background(0);
  for (int y = 0, x = 0; y <= height; y++) {
    float interval = map(y, 0, height, 0, 1);
    color gradient = lerpColor(colorBottom, colorTop, interval);
    stroke(gradient);
    line(x, y, width, y);
  }

  loadPixels();
  return pixels;
}

void drawPointcloud() 
{
  background(#f1f1f1);
  fill(0);
  noStroke();
  sphereDetail(3);
  float tiles = 100;
  float tileSize = width/tiles;
  push();
  translate(width/2, height/2);
  rotateY(radians(frameCount));

  for (int x = 0; x < tiles; x++) {
    for (int y = 0; y < tiles; y++) {
      color c = get(int(x*tileSize), int(y*tileSize));
      float b = map(brightness(c), 0, 255, 1, 0);
      float z = map(b, 0, 1, -150, 150);

      push();
      translate(x*tileSize - width/2, y*tileSize - height/2, z);
      sphere(tileSize*b*0.8);
      pop();
    }
  }
  pop();
}


int[] displayName(int positionX, int positionY, float scale, color strokeColor, int strokeWidth)
{
  background(0);

  push();
  translate(positionX, positionY);
  scale(scale);

  stroke(strokeColor);      
  strokeWeight(strokeWidth);

  D.moveLetter(13, 43);
  D.rotateLetter(247);
  D.displayLetter();

  A.moveLetter(68, 0);
  A.rotateLetter(0);
  A.displayLetter();

  N.moveLetter(153, 0);
  N.rotateLetter(0);
  N.displayLetter();

  I.moveLetter(247, 0);
  I.rotateLetter(0);
  I.displayLetter();

  E.moveLetter(280, 0);
  E.rotateLetter(0);
  E.displayLetter();

  L.moveLetter(359, 0);
  L.rotateLetter(0);
  L.displayLetter();
  pop();

  loadPixels();
  return pixels;
}


class Letter 
{  
  char character;
  boolean pushExecuted = false;
  ArrayList<Object> shapes = new ArrayList<Object>();

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
      break;

    case 'A':
      line(0, 84, 30, 0);
      line(30, 0, 60, 84);
      line(12, 53, 47, 53);
      break;

    case 'N':
      line(0, 0, 0, 84);
      line(0, 0, 60, 84);
      line(60, 0, 60, 84);
      break;

    case 'I':
      line(0, 0, 0, 84);
      break;

    case 'E':
      line(0, 0, 0, 84);
      line(0, 0, 50, 0);
      line(0, 42, 50, 42);
      line(0, 84, 50, 84);
      break;

    case 'L':
      line(0, 0, 0, 84);
      line(0, 84, 50, 84);
      break;

    default:
      print("Error: Letter not implemented.");
      break;
    }
    pop();
    pushToStack("reset");
  }

  void moveLetter(int positionX, int positionY) 
  {
    pushToStack("execute");
    translate(positionX, positionY);
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
