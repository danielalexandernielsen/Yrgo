interface Factory<T>
{
  ArrayList<T> create(int amount);
  void destroy(T object);
}

class BallFactory implements Factory<Ball>
{
  ArrayList<Ball> objects = new ArrayList<Ball>();

  ArrayList<Ball> create(int amount)
  {
    for (int i = 0; i < amount; i++)
    {
      objects.add(new Ball());
    }
    return objects;
  }

  void destroy(Ball object)
  {
    objects.remove(object);
  }
}
