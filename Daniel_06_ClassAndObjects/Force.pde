class Force
{
  float velocityLimit = 20f;
  float velocityMultiplier = 75f;
  float accelerationMultiplier = 3f;
  float gravityMultiplier = 1f;
  float dragMultiplier = 0.1f;
  float elasticityMultiplier = 0.95f;

  PVector acceleration = new PVector();
  PVector drag = new PVector();
  PVector gravity = new PVector();
  PVector velocity = new PVector();

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

  void elasticity(Shape shape)
  {
    if (gravityEnabled)
    {
      if (shape.position.y + shape.radius >= height)
      {
        velocity.y = velocity.y * -elasticityMultiplier;
      }
    }
  }

  void generate(Shape shape)
  {
    acceleration = acceleration();
    drag = drag();
    gravity = gravity();
    elasticity(shape);
  }

  void apply(Shape shape)
  { 
    velocity.add(acceleration);
    velocity.add(drag);
    velocity.add(gravity);
    shape.position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
    velocity.limit(velocityLimit);
    acceleration.set(0, 0);
  }
}
