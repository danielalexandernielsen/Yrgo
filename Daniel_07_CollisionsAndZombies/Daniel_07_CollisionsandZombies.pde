Edge edge;
Force humanMovement;
Force zombieMovement;
Factory humanFactory;
Factory zombieFactory;
ArrayList<Character> characters;

void setup() 
{
  size(1280, 720);
  edge = new Edge();
  humanMovement = new Force();
  zombieMovement = new Force();
  humanFactory = new HumanFactory();
  zombieFactory = new ZombieFactory();
  
  characters = new ArrayList<Character>();

  characters.addAll(humanFactory.create(99));
  characters.addAll(zombieFactory.create(1));
  
}

void draw()
{
  calculateDeltaTime("START");

  if (running)
  {
    game();
  }

  calculateDeltaTime("END");
}
