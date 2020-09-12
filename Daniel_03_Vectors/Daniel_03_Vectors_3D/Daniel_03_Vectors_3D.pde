float arenaSize, ballSize, size, speed;
PVector position;
PVector direction = new PVector();
PVector input = new PVector();
int paddleSize;
int score = 0;
boolean bounceOn = true;

void setup() 
{
  size(500, 500, P3D);
  smooth(8);
  lights();

  position = new PVector(width/2, height/2);
  speed = 0.05;
  arenaSize = 317;
  ballSize = 30;
  paddleSize = 100;
}

void draw() 
{
  background(0);

  position.add(direction);
  drawArena();
  colorBall();
  drawBall();
  drawVector();
  drawPadle();
  bounce();
  score();

  if (position.z > ballSize/2)
  {
    displayGameOver();
  }

  //saveFrame("nielsen_daniel_03Vectors_-######.png");
}

void mousePressed() 
{
  bounceOn = true;

  direction.x = 0;
  direction.y = 0;
  direction.z = 0;

  position.x = mouseX;
  position.y = mouseY;
  position.z = 0;
}

void mouseReleased() 
{
  input.x = mouseX;
  input.y = mouseY;
  input.z = -50;
  direction = input.sub(position);
  direction.mult(speed);
}


void drawPadle()
{
  push();
  fill(40, 100);

  translate(mouseX - paddleSize/2, mouseY - paddleSize/2);
  rect(0, 0, paddleSize, paddleSize);
  pop();
}

void drawArena()
{
  push();
  translate(width/2, height/2, -5);
  stroke(255);
  noFill();
  box(arenaSize);

  fill(20);
  translate(-(width/2), -(height/2), -height);
  rect(0, 0, width, height);

  pop();
}

void colorBall()
{
  float interval = map(position.z, -500, 0, 0, 1);
  color gradient = lerpColor(color(255/3, 125/3, 0), color(255, 125, 0), interval);
  stroke(gradient);
}

void drawBall()
{
  push();
  translate(position.x, position.y, position.z);
  sphere(ballSize);
  pop();
}

void drawVector() 
{
  if (mousePressed)
  {
    stroke(255);
    line(position.x, position.y, mouseX, mouseY);
  }
}

void bounce() 
{
  if (position.x <= 0 || position.x >= width)
  {
    direction.x *= -1;
  }

  if (position.y <= 0 || position.y >= height)
  {
    direction.y *= -1;
  }

  if (position.z <= -500) 
  {
    direction.z *= -1;
  }

  if (position.z > 0)
  {
    if (position.x >= mouseX - paddleSize/2 && position.x <= mouseX + paddleSize/2 )
    {
      if (position.y >= mouseY - paddleSize/2 && position.y <= mouseY + paddleSize/2 )
      {
        direction.z *= -1;
        score++;
      }
    }
  }
}

void score()
{
  bounceOn = false;

  textSize(20);
  text("Score: " + score, 52, 18);
  textAlign(CENTER, CENTER);
}

void displayGameOver()
{
  bounceOn = false;

  textSize(55);
  text("GAME OVER", width/2, height/2);
  textSize(20);
  text("Click to restart", width/2, height/2 - -43);
  textAlign(CENTER, CENTER);
}
