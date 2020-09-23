class Diagnostics
{
  void diagnostics(GameObject object, Force force)
  {
    textSize(25);
    text(
      "Acceleration X: " + round(force.acceleration.x) + "\n" +
      "Acceleration Y: " + round(force.acceleration.y) + "\n" +
      "Velocity X: " + round(force.velocity.x) + "\n" +
      "Velocity Y: " + round(force.velocity.y) + "\n" +
      "Position X: " + round(object.position.x) + "\n" +
      "Position Y: " + round(object.position.y) + "\n"
      , 50, 50);
  }
}
