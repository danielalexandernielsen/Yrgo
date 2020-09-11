PVector guess, random, results;
boolean getNewVector = true;

void setup() {
  size(500, 500);
  ellipseMode(CENTER);

  guess = new PVector();
  random = new PVector();
  results = new PVector();
}

void draw() {
  background(128);  
  ellipse(width/2, height/2, 5, 5);
  textSize(20);

  generateNewRandomVector();
  displayRandomVectorValues();

  drawGuessedVector();
}

void mousePressed() 
{
  guess.x = mouseX;
  guess.y = mouseY;
}

void mouseReleased() 
{
  calculateResults();
  displayResults();
}

void displayRandomVectorValues()
{
  text(random.x + " , " + random.y, 30, 30);
}

void drawGuessedVector() 
{
  if (mousePressed)
  {
    line(width/2, height/2, mouseX, mouseY);
  }
}

void generateNewRandomVector()
{
  if (getNewVector)
  {
    random = new PVector(round(random(width)), round(random(height)));
    getNewVector = false;
  }
}

void calculateResults()
{
  results = guess.sub(random);
}

void displayResults()
{
  text(guess.x + " , " + guess.y, width - 100, 30);
}
