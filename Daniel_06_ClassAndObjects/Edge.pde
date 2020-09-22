class Edge
{
  void bounceVertical(Shape shape)
  {
    if (shape.position.y + shape.radius >= height)
    {
      shape.position.y = height - shape.radius;
      shape.velocity.y *= -1;
    }

    if (shape.position.y - shape.radius <= 0)
    {
      shape.position.y = shape.radius;
      shape.velocity.y *= -1;
    }
  }

  void bounceHorisontal(Shape shape)
  {
    if (shape.position.x + shape.radius >= width)
    {
      shape.position.x = width - shape.radius;
      shape.velocity.x *= -1;
    }

    if (shape.position.x - shape.radius <= 0)
    {
      shape.position.x = shape.radius;
      shape.velocity.x *= -1;
    }
  }

  void wrapHorisontal(Shape shape)
  {
    if (shape.position.x - shape.size > width)
    {
      shape.position.x = shape.size;
    }

    if (shape.position.x + shape.size < 0)
    {
      shape.position.x = width - shape.size;
    }
  }

  void wrapVertical(Shape shape)
  {
    if (shape.position.y - shape.radius > height)
    {
      shape.position.y = shape.radius;
    }

    if (shape.position.y + shape.radius < 0)
    {
      shape.position.y = height - shape.radius;
    }
  }

  void constrainVertical(Shape shape)
  {
    if (shape.position.y - shape.radius <= 0)
    {
      shape.position.y = shape.radius;
      shape.velocity.y = 0;
    }

    if (shape.position.y + shape.radius > height)
    {
      shape.position.y = height - shape.radius;
      shape.velocity.y = 0;
    }
  }

  void constrainHorisontal(Shape shape)
  {
    if (shape.position.x + shape.radius >= width)
    {
      shape.position.x = width - shape.radius;
      shape.velocity.x = 0;
    }

    if (shape.position.x - shape.radius <= 0)
    {
      shape.position.x = shape.radius;
      shape.velocity.x = 0;
    }
  }
}
