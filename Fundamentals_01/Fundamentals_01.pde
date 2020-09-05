color colorBottom, colorTop;
color strokeColor;
PImage renderedName;
PShape name;
Letter D, A, N, I, E, L;

void setup() {
  size(768, 432, P3D);

  name = createShape(GROUP);

  colorTop = color(45, 73, 123);
  colorBottom = color(42, 16, 49);

  D = new Letter('D');
  A = new Letter('A');
  N = new Letter('N');
  I = new Letter('I');
  E = new Letter('E');
  L = new Letter('L');

  // renderedName = get();
}

void draw() {

  setGradient(0, 0, width, height, colorBottom, colorTop);

  translate(57, 136);
  scale(1.6);

  stroke(105, 160, 238);      
  strokeWeight(3);

  // D.rotateLetter(247);
  D.moveLetter(13, 43);
  D.printLetter();

  A.moveLetter(68, 0);
  A.printLetter();

  N.moveLetter(153, 0);
  N.printLetter();

  I.moveLetter(247, 0);
  I.printLetter();

  E.moveLetter(280, 0);
  E.printLetter();

  L.moveLetter(359, 0);
  L.printLetter();
}


void setGradient(int x, int y, float wide, float tall, color colorBottom, color colorTop) {
  for (int i = y; i <= y + tall; i++) {
    float inter = map(i, y, y + tall, 0, 1);
    color gradient = lerpColor(colorBottom, colorTop, inter);
    stroke(gradient);
    line(x, i, x+wide, i);
  }
}



class Letter {  
  char character;
  boolean pushExecuted = false;

  Letter(char character) {
    this.character = character;
  }

  void printLetter() {
    switch(character) {
      case 'D':
      noFill();
      arc(0, 0, 81, 81, 0, PI+QUARTER_PI, CHORD);
      break;

      case 'A':
      line(30, 0, 0, 85);
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
    pushToStack(reset);
  }

  void moveLetter(int positionX, int positionY) {
    pushToStack(execute);
    translate(positionX, positionY);
  }

  void rotateLetter(int degrees) {
    pushToStack(execute);
    rotate(radians(degrees));
  }

  void pushToStack(String command) {
    if (!pushExecuted) {     
      push();
      pushExecuted = true;
    }
    else if (reset) {
      pushExecuted = false;
    }

  }
}