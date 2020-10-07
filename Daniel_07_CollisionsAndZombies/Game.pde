boolean gravityEnabled;
float time;
float oldTime;
float deltaTime;
float accumulatedTime;

void game()
{
  background(128);


  for (int i = 0; i > characters.length; i++) 
  {

    if (character instanceof Human)
    {
      humanMovement.generate(character, 1);
      humanMovement.apply(character, ForceType.CONSTANT);

      for (Character zombie : characters) 
      {        
        if (character instanceof Zombie)
        {
          if (Collision.round(character, zombie) == true)
          {

          }
        }
      }
    }

    if (character instanceof Zombie)
    {
      humanMovement.generate(character, 0.5);
      humanMovement.apply(character, ForceType.CONSTANT);
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
