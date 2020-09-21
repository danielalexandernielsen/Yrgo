static class Factory<T>
{
  ArrayList<T> create(String object, int amount)
  {
    ArrayList<T> objects = new ArrayList<T>();
    
    for (int i = 0; i < amount; i++)
    {
      Class classType = Class.forName("object");
      object.getClass().newInstance();
    }
    return objects;
  }
}
