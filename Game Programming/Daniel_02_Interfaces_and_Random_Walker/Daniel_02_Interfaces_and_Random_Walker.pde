//This file is only for testing your movement/behavior.
//The Walkers will compete in a different program!

WalkerInterface walker;
PVector walkerPos;

void setup() {
  size(640, 480);
  frameRate(100000);
  //Create a walker from the class Example it has the type of WalkerInterface
  walker = new DanNie();

  walkerPos = walker.getStartPosition(width, height);
}

void draw() {
  point(walkerPos.x, walkerPos.y);
  walkerPos.add(walker.update());
}
