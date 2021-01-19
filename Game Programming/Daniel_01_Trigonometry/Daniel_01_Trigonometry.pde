int frame = 0;

void setup()
{
  size(640, 480);
  strokeWeight(5);
}

void draw()
{
  background(255);


  //stroke(255, 0, 0);
  //sineCurve();

  drawSun();

  //stroke(0, 0, 255);
  //cosCurve();

  //drawCircle();

  //drawSpiral();


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



void drawSun()
{   

  float speed1 = 40;
  float speed2 = 34;
  float rayLength1 = 97;
  float rayLength2 = 225;

  color backgroundColor = color(25, 20, 41);
  color mainColor = color(86, 206, 76);
  color secondaryColor1 = color(153, 145, 96, 255);
  color secondaryColor2 = color(136, 168, 162, 242);
  color secondaryColor3 = color(192, 162, 146, 244);

  background(backgroundColor);
  translate(width/2, height/2);
  stroke(mainColor);
  strokeWeight(1);

  for (int degrees = 0; degrees <= 360; degrees += 15)
  {
    push();
    rotate(radians(degrees));
    for (int angle = 0, i = 0; angle <= 283; angle += 15, i++)
    {
      push();
      rotate(radians(245));
      if (i % 2 == 0)
      {
        stroke(secondaryColor1);
      } else if (i % 3 == 0)
      {
        stroke(secondaryColor2);
      } else if (i % 4 == 0)
      {
        stroke(secondaryColor3);
      }
      line(0, 0, sin(frame / speed1) * rayLength1, cos(frame / speed2) * rayLength2);
      pop();
    }
    pop();
  }

  frame++;
}
