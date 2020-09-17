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
