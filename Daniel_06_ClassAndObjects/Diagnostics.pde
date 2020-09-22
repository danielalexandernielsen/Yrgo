class Diagnostics
{
  void diagnostics(Shape shape, Force force)
  {
    textSize(25);
    text(
      "Acceleration X: " + round(force.acceleration.x) + "\n" +
      "Acceleration Y: " + round(force.acceleration.y) + "\n" +
      "Velocity X: " + round(force.velocity.x) + "\n" +
      "Velocity Y: " + round(force.velocity.y) + "\n" +
      "Position X: " + round(shape.position.x) + "\n" +
      "Position Y: " + round(shape.position.y) + "\n"
      , 50, 50);
  }
}
