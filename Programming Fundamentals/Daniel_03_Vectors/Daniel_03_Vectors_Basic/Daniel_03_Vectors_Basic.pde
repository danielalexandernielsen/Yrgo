float size, speed;
PVector position, direction, input;

void setup() 
{
  size(500, 500);
  ellipseMode(CENTER);

  position = new PVector(width/2, height/2);
  direction = new PVector();
  input = new PVector();
  speed = 0.05;

  size = 20;
}

void draw() 
{
  background(128);

  ellipse(position.x, position.y, size, size);
  position.add(direction);
  drawVector();
  bounce();
}

void mousePressed() 
{
  direction.x = 0;
  direction.y = 0;

  position.x = mouseX;
  position.y = mouseY;
}

void mouseReleased() 
{
  input.x = mouseX;
  input.y = mouseY;
  direction = input.sub(position);
  direction.mult(speed);
}

void bounce() 
{
  if (position.x <= 0 || position.x >= width)
  {
    direction.x *= -1;
  }

  if (position.y <= 0 || position.y >= height)
  {
    direction.y *= -1;
  }
}

void drawVector() 
{
  if (mousePressed)
  {
    line(position.x, position.y, mouseX, mouseY);
  }
}
