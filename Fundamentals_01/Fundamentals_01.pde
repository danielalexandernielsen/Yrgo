color colorBottom, colorTop, strokeColor;
int[] snapshot;
Letter D, A, N, I, E, L;

void setup() {
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
}

void draw() {

  rotateX(map(mouseY, 0, height, -PI, PI));

  displayName(57, 136, 1.6, strokeColor, 3);
  background(0); 
  loadPixels();
  generateZDepthMap(pixels);

  drawGradient(colorTop, colorBottom);

  // zDisplacement(pixels, snapshot);
}


void drawGradient(color colorTop, color colorBottom) {
  for (int y = 0, x = 0; y <= height; y++) {
    float interval = map(y, 0, height, 0, 1);
    color gradient = lerpColor(colorBottom, colorTop, interval);
    stroke(gradient);
    line(x, y, width, y);
  }
}

float[] generateZDepthMap(int[] snapshot)
{
  float[] zDepthMap = new float[snapshot.length];
  float z, luminance;
  int maxHeight = 60;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      luminance = brightness(snapshot[x + (y * width)]);
      z = map(luminance, 0, 200, 0, maxHeight);
      print(z);
      zDepthMap[x + (y * width)] = z;      
    }
  }
  return zDepthMap;
}

void zDisplacement(int[] pixel, int[] snapshot)
{
  float z, luminance;
  int max_height = 60;

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      luminance = brightness(snapshot[x + (y * width)]);
      z = map(luminance, 0, 200, 0, max_height);

      line(0, y, 0, x, y, z);
    }
  }
}

void displayName(int positionX, int positionY, float scale, color strokeColor, int strokeWidth)
{
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
}


class Letter {  
  char character;
  boolean pushExecuted = false;
  ArrayList<Object> shapes = new ArrayList<Object>();

  Letter(char character) {
    this.character = character;
  }

  void displayLetter() {
    switch(character) {
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

  void moveLetter(int positionX, int positionY) {
    pushToStack("execute");
    translate(positionX, positionY);
  }

  void rotateLetter(int degrees) {
    pushToStack("execute");
    rotate(radians(degrees));
  }

  void pushToStack(String command) {
    if (!pushExecuted) {     
      push();
      pushExecuted = true;
    } else if (command == "reset") {
      pushExecuted = false;
    }
  }
}
