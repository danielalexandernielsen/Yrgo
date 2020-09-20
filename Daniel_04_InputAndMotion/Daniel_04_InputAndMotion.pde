boolean[] keys = new boolean[128];

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

	acceleration = acceleration();
	drag = drag();
	applyMovement();
	wraparound();
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

PVector acceleration()
{
	acceleration.set(0, 0);

	if (keys[LEFT] || keys['a'])
		accelerationDiscard.x = -1;

	if (keys[UP] || keys['w'])
		accelerationDiscard.y = -1;

	if (keys[RIGHT] || keys['d'])
		accelerationDiscard.x = 1;

	if (keys[DOWN] || keys['s'])
		accelerationDiscard.y = 1;

	accelerationDiscard.normalize();
	accelerationDiscard.mult(accelerationMultiplier);

	return accelerationDiscard;
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

void wraparound()
{
	if (position.x - playerSize > width)
		position.x = playerSize;

	if (position.x + playerSize < 0)
		position.x = width - playerSize;

	if (position.y + playerSize/2 > height)
		position.y = height - playerSize/2;

	if (position.y - playerSize/2 < 0)
		position.y = playerSize/2;
}

void drawBall()
{
	ellipse(position.x, position.y, playerSize, playerSize);

	if (position.x + playerSize > width)
		ellipse(position.x - width, position.y, playerSize, playerSize);

	if (position.x - playerSize < 0)
		ellipse(position.x + width, position.y, playerSize, playerSize);
}