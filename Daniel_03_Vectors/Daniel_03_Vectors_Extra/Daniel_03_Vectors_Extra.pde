PVector guess, random, origo, results, temp;
boolean getNewVector = true;

void setup() {
  size(500, 500);

  guess = new PVector();
  random = new PVector();
  results = new PVector();
  temp = new PVector();
}

void draw() {
  background(128);  
  textSize(18);

  generateRandomVector();
  displayRandomVectorValues();

  drawGuessedVector();  
  displayGuess();
  displayScore();
}


void mouseReleased() 
{
  guess.x = mouseX;
  guess.y = mouseY;
}

void keyPressed()
{
  if (key == ENTER)
  {
    getNewVector = true;
  }
}

void generateRandomVector()
{
  if (getNewVector)
  {
    random = new PVector(round(random(width/2)), round(random(height/2)));
    getNewVector = false;
  }
}

void displayRandomVectorValues()
{
  text("Randomized vector: " + random.x + " , " + random.y, 30, 30);
}

void drawGuessedVector() 
{
  if (mousePressed)
  {
    line(0, 0, mouseX, mouseY);
  }
}


void displayGuess()
{
  text("Your guess: " + guess.x + " , " + guess.y, width/2, height - 20);
}


void displayScore()
{
  if (guess.x >= (random.x - 20) && guess.x <= (random.x + 20))
  {
    if (guess.y >= (random.y - 20) && guess.y <= (random.y + 20))
    {
      temp.x = random.x;
      temp.y = random.y;
      results = temp.sub(guess);
      text("Your score (units away): " + results.x + " , " + results.y
          + "\n Press ENTER for a new random vector.", width/2 - 167, height/2);
    }
  }
}
