class Zombie extends Character
{

  Zombie()
  {
    color skinColor = color(147, 192, 108);
    this.colour = color(skinColor);
    this.position = new PVector(random(0, width), random (0, height ));
  }
}