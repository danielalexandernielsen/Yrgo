int frame;
float speed;
float waveHeight;
float offsetY;
float offsetX;
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
  offsetY = 223;
  waveHeight = 56;
  numberOfPoints = 100;
  distanceBetweenPoints = 6.3;
  
  stroke(255, 0, 0);
  sineCurve();
  
  stroke(0, 0, 255);
  cosCurve();
  

  frame++;
}

void sineCurve()
{
  for (int x = 0; x < numberOfPoints; x++)
  {
    point((frame + (x * distanceBetweenPoints)) % width, offsetY + sin((frame + (x * distanceBetweenPoints)) * speed) * waveHeight);
  }
}

void cosCurve()
{
  for (int x = 0; x < numberOfPoints; x++)
  {
    point((frame + (x * distanceBetweenPoints)) % width, offsetY + cos((frame + (x * distanceBetweenPoints)) * speed) * waveHeight);
  }
}
