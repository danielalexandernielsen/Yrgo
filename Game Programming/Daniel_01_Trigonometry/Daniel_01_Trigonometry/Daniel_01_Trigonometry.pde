int frame;
float speed;
float waveHeight;
float positionY;
float distanceBetweenPoints;
int numberOfPoints;

void setup()
{
  size(640, 480);
  strokeWeight(5);
}

void draw()
{
  background(255);
  speed = 0.1;
  positionY = 223;
  waveHeight = 56;
  numberOfPoints = 100;
  distanceBetweenPoints = 6.3;
  

  for (int x = 0; x < numberOfPoints; x++)
  {
    point((frame + (x * distanceBetweenPoints)) % width, positionY + sin((frame + (x * distanceBetweenPoints)) * speed) * waveHeight);
  }

  frame++;
}
