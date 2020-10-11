boolean gravityEnabled;
float time;
float oldTime;
float deltaTime;
float accumulatedTime;

Edge edge;
Force humanMovement;
Force zombieMovement;

void game()
{
  background(128);


  for (int i = 0; i < characters.size(); i++) 
  {

    Character character = characters.get(i);

    if (character instanceof Human)
    {
      humanMovement.generate(character, 1);
      humanMovement.apply(character, ForceType.CONSTANT);


      for (int j = 0; j < characters.size(); j++) 
      {      

        Character zombie = characters.get(j);

        if (zombie instanceof Zombie)
        {
          if (Collision.round(character, zombie) == true)
          {
            characters.set(i, new Zombie(character.position));
          }
        }
      }
    }

    if (character instanceof Zombie)
    {
      zombieMovement.generate(character, 0.5);
      zombieMovement.apply(character, ForceType.CONSTANT);
    }

    edge.wrapHorisontal(character);
    edge.wrapVertical(character);

    character.draw();
  }
}


void calculateDeltaTime(String interval)
{
  switch (interval)
  {
    case "START":
    time = millis();
    deltaTime = (time - oldTime) * 0.001;

    case "END":
    oldTime = time;
  }
}
