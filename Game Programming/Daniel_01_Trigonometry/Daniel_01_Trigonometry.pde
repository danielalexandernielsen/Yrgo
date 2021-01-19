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

  //drawSun();
  drawDance();
  //filter(ERODE);
  //filter(BLUR, 1);
  //filter(DILATE);

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

  float speed1 = 10;
  float speed2 = 10;
  float speed3 = 100;
  float speed4 = 100;
  float rayLength1 = 186;
  float rayLength2 = 187;
  float rayLength3 = 25;
  float rayLength4 = 25;

  color backgroundColor = color(25, 20, 41);
  color mainColor = color(154, 206, 76);
  color secondaryColor1 = color(153, 145, 96, 255);
  color secondaryColor2 = color(136, 168, 162, 242);
  color secondaryColor3 = color(192, 162, 146, 244);

  background(backgroundColor);
  translate(width/2, height/2);
  stroke(mainColor);
  strokeWeight(1);

  for (int degrees = 0; degrees <= 360; degrees += 10)
  {
    push();
    rotate(radians(degrees));
    for (int angle = 0, i = 0; angle <= 360; angle += 8, i++)
    {
      push();
      translate(cos(frame / speed3) * rayLength3, sin(frame / speed4) * rayLength4);
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
      line(cos(frame / speed3) * rayLength3, sin(frame / speed4) * rayLength4, sin(frame / speed1) * rayLength1, cos(frame / speed2) * rayLength2);
      pop();
    }
    pop();
  }

  frame++;
}

void drawDance()
{   

  float speed1 = 150;
  float speed2 = 151;
  float speed3 = 31;
  float speed4 = 37;
  float rayLength1 = 1602;
  float rayLength2 = 1553;
  float rayLength3 = 65;
  float rayLength4 = 113;

  color backgroundColor = color(25, 20, 41);
  color mainColor = color(240, 206, 76);
  color secondaryColor1 = color(153, 145, 96, 343);
  color secondaryColor2 = color(136, 168, 162, 143);
  color secondaryColor3 = color(192, 162, 146, 86);

  background(backgroundColor);
  translate(width/2, height/2);
  stroke(mainColor);
  strokeWeight(1);

  for (int degrees = 0; degrees <= 360; degrees += 18)
  {
    push();
    rotate(radians(degrees));
    for (int angle = 0, i = 0; angle <= 360; angle += 3, i++)
    {
      push();
      translate(cos(frame / speed3) * rayLength3, sin(frame / speed4) * rayLength4);
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
      line(cos(frame / speed3) * rayLength3, sin(frame / speed4) * rayLength4, sin(frame / speed1) * rayLength1 / angle, cos(frame / speed2) * rayLength2  / angle);
      pop();
    }
    pop();
  }

  frame++;
}
