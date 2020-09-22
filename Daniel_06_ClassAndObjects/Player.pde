class Player extends Shape
{

  Player()
  {
    position = new PVector(width/2, height/2);
    radius = size/2;
  }

  void update()
  {
    acceleration = player.acceleration();
    drag = player.drag();
    gravity = player.gravity();
    applyForces();
    bounciness();
    display();
    diagnostics();
  }

  PVector acceleration()
  {
    PVector acceleration = new PVector();

    if (moveLeft)
      acceleration.x -= 1;

    if (moveRight)
      acceleration.x += 1;

    if (moveUp)
      acceleration.y -= 1;

    if (moveDown)
      acceleration.y += 1;

    acceleration.normalize();
    acceleration.mult(accelerationMultiplier);

    return acceleration;
  }

  PVector drag()
  {
    PVector drag = new PVector();

    drag.x = (velocity.x + acceleration.x) * -dragMultiplier;
    drag.y = (velocity.y + acceleration.y) * -dragMultiplier;

    return drag;
  }

  PVector gravity()
  {
    PVector gravity = new PVector();

    if (gravityEnabled)
      gravity.set(0, gravityMultiplier);

    return gravity;
  }

  void bounciness()
  {
    if (gravityEnabled)
    {
      if (position.y + radius >= height)
      {
        velocity.y = velocity.y * -bounceMultiplier;
      }
    }
  }

  void applyForces()
  { 
    velocity.add(acceleration);
    velocity.add(drag);
    velocity.add(gravity);
    position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
    velocity.limit(velocityLimit);
    acceleration.set(0, 0);
  }


  void display()
  {
    ellipse(position.x, position.y, size, size);

    if (position.x + size > width)
      ellipse(position.x - width, position.y, size, size);

    if (position.x - size < 0)
      ellipse(position.x + width, position.y, size, size);

    if (position.y + size > height)
      ellipse(position.x, position.y - height, size, size);

    if (position.y - size < 0)
      ellipse(position.x, position.y + height, size, size);
  }

  void diagnostics()
  {
    textSize(25);
    text(
      "Acceleration X: " + round(acceleration.x) + "\n" +
      "Acceleration Y: " + round(acceleration.y) + "\n" +
      "Velocity X: " + round(velocity.x) + "\n" +
      "Velocity Y: " + round(velocity.y) + "\n" +
      "Position X: " + round(position.x) + "\n" +
      "Position Y: " + round(position.y) + "\n"
      , 50, 50);
  }
}
