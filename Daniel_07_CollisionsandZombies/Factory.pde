interface Factory<T>
{
  ArrayList<T> create(int amount);
}

class HumanFactory implements Factory<Human>
{

  ArrayList<Human> objects = new ArrayList<Human>();

  ArrayList<Human> create(int amount)
  {
    for (int i = 0; i < amount; i++)
    {
      objects.add(new Human());
    }
    return objects;
  }
}

class ZombieFactory implements Factory<Zombie>
{

  ArrayList<Zombie> objects = new ArrayList<Zombie>();

  ArrayList<Zombie> create(int amount)
  {
    for (int i = 0; i < amount; i++)
    {
      objects.add(new Zombie());
    }
    return objects;
  }
}
