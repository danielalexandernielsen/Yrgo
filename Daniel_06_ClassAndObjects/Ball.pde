class Ball extends GameObject
{

  Ball()
  {
    this.size = random(1, 100);
    this.radius = size/2;
    this.colour = color(random(0, 256), random(0, 256), random(0, 256));
    position = new PVector(random(0, width), random (0, height ));
  }

  Ball(float x, float y, float size, float xSpeed, float ySpeed, color colour)
  {
    this.size = size;
    this.radius = size/2;
    this.colour = colour;
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
  }

  void draw()
  {
    push();
    fill(colour);
    noStroke();

    ellipse(position.x, position.y, size, size);

    if (position.x + size > width)
      ellipse(position.x - width, position.y, size, size);

    if (position.x - size < 0)
      ellipse(position.x + width, position.y, size, size);

    if (position.y + size > height)
      ellipse(position.x, position.y - height, size, size);

    if (position.y - size < 0)
      ellipse(position.x, position.y + height, size, size);

    pop();
  }
}
