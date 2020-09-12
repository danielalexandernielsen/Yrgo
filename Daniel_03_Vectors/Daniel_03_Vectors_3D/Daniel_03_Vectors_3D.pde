float arenaSize, ballSize, ballSpeed;
PVector ballPosition;
PVector ballDirection = new PVector();
PVector playerInput = new PVector();
int paddleSize;
int score = 0;
boolean gameOver = false;

void setup() 
{
  size(500, 500, P3D);
  smooth(8);
  lights();

  ballPosition = new PVector(width/2, height/2);
  ballSpeed = 0.05;
  arenaSize = 317;
  ballSize = 30;
  paddleSize = 100;
}

void draw() 
{
  background(0);

  ballPosition.add(ballDirection);
  drawArena();
  colorBall();
  drawBall();
  drawVector();
  drawPadle();

  if (!gameOver)
  {
    bounce();
    score();
  }

  if (ballPosition.z > ballSize/2)
  {
    gameOver();
  }

  //saveFrame("nielsen_daniel_03Vectors_-######.png");
}

void mousePressed() 
{
  if (gameOver)
  {
    score = 0;
    gameOver = false;
  }

  ballDirection.x = 0;
  ballDirection.y = 0;
  ballDirection.z = 0;

  ballPosition.x = mouseX;
  ballPosition.y = mouseY;
  ballPosition.z = 0;
}

void mouseReleased() 
{
  playerInput.x = mouseX;
  playerInput.y = mouseY;
  playerInput.z = -50;
  ballDirection = playerInput.sub(ballPosition);
  ballDirection.mult(ballSpeed);
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
  float interval = map(ballPosition.z, -500, 0, 0, 1);
  color gradient = lerpColor(color(255/3, 125/3, 0), color(255, 125, 0), interval);
  stroke(gradient);
}

void drawBall()
{
  push();
  translate(ballPosition.x, ballPosition.y, ballPosition.z);
  sphere(ballSize);
  pop();
}

void drawVector() 
{
  if (mousePressed)
  {
    stroke(255);
    line(ballPosition.x, ballPosition.y, mouseX, mouseY);
  }
}

void bounce() 
{
  if (ballPosition.x <= 0 || ballPosition.x >= width)
  {
    ballDirection.x *= -1;
  }

  if (ballPosition.y <= 0 || ballPosition.y >= height)
  {
    ballDirection.y *= -1;
  }

  if (ballPosition.z <= -500) 
  {
    ballDirection.z *= -1;
  }

  if (ballPosition.z > 0)
  {
    if (ballPosition.x >= mouseX - paddleSize/2 && ballPosition.x <= mouseX + paddleSize/2 )
    {
      if (ballPosition.y >= mouseY - paddleSize/2 && ballPosition.y <= mouseY + paddleSize/2 )
      {
        ballDirection.z *= -1;
        score++;
      }
    }
  }
}

void score()
{
  textSize(20);
  text("Score: " + score, 52, 18);
  textAlign(CENTER, CENTER);
}

void gameOver()
{
  gameOver = true;

  textSize(55);
  text("GAME OVER", width/2, height/2);
  textSize(20);
  text("Click to restart", width/2, height/2 - -43);
  textAlign(CENTER, CENTER);
}
