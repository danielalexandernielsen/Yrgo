class Player extends Shape
{

  Player()
  {
    position = new PVector(width/2, height/2);
    radius = size/2;
  }
  
  void draw()
  {
    ellipse(position.x, position.y, size, size);

    if (position.x + size > width)
      ellipse(position.x - width, position.y, size, size);

    if (position.x - size < 0)
      ellipse(position.x + width, position.y, size, size);

    if (position.y + size > height)
      ellipse(position.x, position.y - height, size, size);

    if (position.y - size < 0)
      ellipse(position.x, position.y + height, size, size);
  }

  /*
  void diagnostics()
   {
   textSize(25);
   text(
   "Acceleration X: " + round(acceleration.x) + "\n" +
   "Acceleration Y: " + round(acceleration.y) + "\n" +
   "Velocity X: " + round(velocity.x) + "\n" +
   "Velocity Y: " + round(velocity.y) + "\n" +
   "Position X: " + round(position.x) + "\n" +
   "Position Y: " + round(position.y) + "\n"
   , 50, 50);
   }
   */
}
