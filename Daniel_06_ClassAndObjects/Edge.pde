class Edge
{
  void bounceVertical(GameObject object)
  {
    if (object.position.y + object.radius >= height)
    {
      object.position.y = height - object.radius;
      object.velocity.y *= -1;
    }

    if (object.position.y - object.radius <= 0)
    {
      object.position.y = object.radius;
      object.velocity.y *= -1;
    }
  }

  void bounceHorisontal(GameObject object)
  {
    if (object.position.x + object.radius >= width)
    {
      object.position.x = width - object.radius;
      object.velocity.x *= -1;
    }

    if (object.position.x - object.radius <= 0)
    {
      object.position.x = object.radius;
      object.velocity.x *= -1;
    }
  }

  void wrapHorisontal(GameObject object)
  {
    if (object.position.x - object.size > width)
    {
      object.position.x = object.size;
    }

    if (object.position.x + object.size < 0)
    {
      object.position.x = width - object.size;
    }
  }

  void wrapVertical(GameObject object)
  {
    if (object.position.y - object.radius > height)
    {
      object.position.y = object.radius;
    }

    if (object.position.y + object.radius < 0)
    {
      object.position.y = height - object.radius;
    }
  }

  void constrainVertical(GameObject object)
  {
    if (object.position.y - object.radius <= 0)
    {
      object.position.y = object.radius;
      object.velocity.y = 0;
    }

    if (object.position.y + object.radius > height)
    {
      object.position.y = height - object.radius;
      object.velocity.y = 0;
    }
  }

  void constrainHorisontal(GameObject object)
  {
    if (object.position.x + object.radius >= width)
    {
      object.position.x = width - object.radius;
      object.velocity.x = 0;
    }

    if (object.position.x - object.radius <= 0)
    {
      object.position.x = object.radius;
      object.velocity.x = 0;
    }
  }
}
