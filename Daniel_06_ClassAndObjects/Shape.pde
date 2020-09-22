abstract class Shape
{
  color colour;
  float size = 50;
  float radius;
  float velocityLimit = 20f;
  float velocityMultiplier = 75f;
  float accelerationMultiplier = 3f;
  float gravityMultiplier = 1f;
  float bounceMultiplier = 0.95f;
  float dragMultiplier = 0.1f;

  PVector acceleration = new PVector();
  PVector drag = new PVector();
  PVector gravity = new PVector();
  PVector velocity = new PVector();
  PVector position;


  
 
}
