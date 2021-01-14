int frame;

void setup()
{
  size(640, 480);
  strokeWeight(5);
}

void draw()
{
  background(255);

  /*
   stroke(255, 0, 0);
   sineCurve();
   
   stroke(0, 0, 255);
   cosCurve();
   
   drawCircle();
  */
  
  drawSpiral();


  frame++;
}

void sineCurve()
{
  float speed = 0.1;
  float offsetY = 223;
  float waveHeight = 56;
  int numberOfPoints = 100;
  float distanceBetweenPoints = 6.3;

  for (int x = 0; x < numberOfPoints; x++)
  {
    point((frame + (x * distanceBetweenPoints)) % width, offsetY + sin((frame + (x * distanceBetweenPoints)) * speed) * waveHeight);
  }
}


void cosCurve()
{
  float speed = 0.1;
  float offsetY = 223;
  float waveHeight = 56;
  int numberOfPoints = 100;
  float distanceBetweenPoints = 6.3;

  for (int x = 0; x < numberOfPoints; x++)
  {
    point((frame + (x * distanceBetweenPoints)) % width, offsetY + cos((frame + (x * distanceBetweenPoints)) * speed) * waveHeight);
  }
}


void drawCircle()
{
  float x, y;
  float size = 150;
  float angle = 0;
  float distanceBetweenPoints = 0.1;

  while (angle < 2 * PI)
  {
    x = size * cos (angle);
    y = size * sin (angle);

    point (x + width / 2, y + height / 2);
    angle += distanceBetweenPoints;
  }
}

void drawSpiral()
{
  float x, y;
  float size = 72;
  float twist = 1;
  float twist_step = 0.01;
  float twist_multiplier = 3.44;
  float angle = 0;
  float distanceBetweenPoints = 0.1;

  while (angle < 2 * PI)
  { 
    x = size * twist * cos (angle);
    y = size * twist * sin (angle);

    point (x + width / 2, y + height / 2);
    angle += distanceBetweenPoints;

    twist_multiplier += twist_step;
    twist += (twist_step * twist_multiplier);
  }
}
