class Ball extends Shape
{

  Ball()
  {
    this.size = random(1, 100);
    this.radius = size/2;
    this.colour = color(random(0, 256), random(0, 256), random(0, 256));
    position = new PVector(random(0, width), random (0, height ));
    velocity = new PVector(random(-7, 7), random(-7, 7));
  }

  Ball(float x, float y, float size, float xSpeed, float ySpeed, color colour)
  {
    this.size = size;
    this.radius = size/2;
    this.colour = colour;
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
  }

  void update()
  {
    applyForces();
    display();
  }

  void applyForces()
  {
    position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
  }

  void display()
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
