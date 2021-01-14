class Human extends Character
{

  Human()
  {
    color skinColor = color(222, 189, 180);
    this.colour = color(skinColor);
    this.position = new PVector(random(0, width), random (0, height ));
  }
}