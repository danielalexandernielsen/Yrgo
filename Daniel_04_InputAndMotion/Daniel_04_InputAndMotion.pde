boolean moveLeft, moveRight, moveUp, moveDown;

float playerSize = 50;
float velocityLimit = 20f;
float velocityMultiplier = 75f;
float accelerationMultiplier = 2f;
float decelerationMultiplier = 0.05f;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

PVector decelerationDiscard = new PVector();
PVector accelerationDiscard = new PVector();
PVector velocityDiscard = new PVector();
PVector acceleration = new PVector();
PVector deceleration = new PVector();
PVector velocity = new PVector();
PVector position;


void setup() 
{
	size(1920, 1080);
	frameRate(60);
	position = new PVector(width/2, height/2);
}

void draw()
{
	background(128);

	calculateDeltaTime("START");

	acceleration.set(0, 0);
	acceleration = input();
	deceleration = decelerate(acceleration, velocity);

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

PVector input()
{
	accelerationDiscard.set(0, 0);

	if (moveLeft)
		accelerationDiscard.x -= 1;

	if (moveRight)
		accelerationDiscard.x += 1;

	if (moveUp)
		accelerationDiscard.y -= 1;

	if (moveDown)
		accelerationDiscard.y += 1;

	accelerationDiscard.normalize();
	accelerationDiscard.mult(accelerationMultiplier);

	return accelerationDiscard;
}

PVector decelerate(PVector accelerationDiscard, PVector velocityDiscard)
{
	if (accelerationDiscard.mag() == 0)
	{		
		decelerationDiscard.set(0, 0);

		decelerationDiscard.x = accelerationDiscard.x - (velocityDiscard.x * decelerationMultiplier);
		decelerationDiscard.y = accelerationDiscard.y - (velocityDiscard.y * decelerationMultiplier);
	}

	return decelerationDiscard;
}

void applyMovement()
{ 
	//acceleration.add(PVector.mult(deceleration, deltaTime * velocityMultiplier));
	velocity.add(PVector.mult(acceleration, deltaTime * velocityMultiplier));
	position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
	velocity.limit(velocityLimit);
}

void drawBall()
{
	ellipse(position.x, position.y, playerSize, playerSize);
}
