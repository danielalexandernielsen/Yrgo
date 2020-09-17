boolean moveLeft, moveRight, moveUp, moveDown;

float playerSize = 50;
float velocityLimit = 20f;
float velocityMultiplier = 75f;
float accelerationMultiplier = 3f;
float dragMultiplier = 0.1f;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

PVector dragDiscard = new PVector();
PVector accelerationDiscard = new PVector();
PVector acceleration = new PVector();
PVector drag = new PVector();
PVector velocity = new PVector();
PVector position;


void setup() 
{
	size(1280, 720);
	position = new PVector(width/2, height/2);
}

void draw()
{
	background(128);

	calculateDeltaTime("START");

	acceleration = input();
	drag = drag();
	applyMovement();
	drawBall();
	diagnostics();

	calculateDeltaTime("END");
}

void calculateDeltaTime(String interval)
{
	switch (interval)
	{
		case "START":
		time = millis();
		deltaTime = (time - oldTime) * 0.001;

		case "END":
		oldTime = time;
	}
}


PVector drag()
{
	dragDiscard.x = (velocity.x + acceleration.x) * -dragMultiplier;
	dragDiscard.y = (velocity.y + acceleration.y) * -dragMultiplier;

	return dragDiscard;
}

void applyMovement()
{ 
	velocity.add(PVector.mult(acceleration, deltaTime * velocityMultiplier));
	velocity.add(PVector.mult(drag, deltaTime * velocityMultiplier));
	position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
	velocity.limit(velocityLimit);
}

void drawBall()
{
	ellipse(position.x, position.y, playerSize, playerSize);
}
