boolean moveLeft, moveRight, moveUp, moveDown;
boolean accelerate, decelerate;
float size;
Input input;

void setup() 
{
  size(640, 480);
  input = new Input(width/2, height/2);
  size = 20;
}

void draw()
{
  background(128);

  input.move();
  input.acceleration();
  
  circle(input.position.x, input.position.y, size);
}
