class Ball extends GameObject
{

  Ball()
  {
    boolean spawnLocationUnavailable = true;
    while(spawnLocationUnavailable)
    {
      this.size = random(5, 100);
      this.radius = size/2;
      this.colour = color(random(0, 256), random(0, 256), random(0, 256));
      this.position = new PVector(random(0, width), random (0, height ));

      spawnLocationUnavailable = Collision.round(player, this.position.x, this.position.y, this.radius);
    }
    
  }

  Ball(float x, float y, float size, float xSpeed, float ySpeed, color colour)
  {
    boolean spawnLocationUnavailable = true;
    while(spawnLocationUnavailable)
    {
      this.size = size;
      this.radius = size/2;
      this.colour = colour;
      this.position = new PVector(x, y);
      this.velocity = new PVector(xSpeed, ySpeed);
      
      spawnLocationUnavailable = Collision.round(player, this.position.x, this.position.y, this.radius);
    }
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
