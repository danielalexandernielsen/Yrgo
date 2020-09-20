boolean moveLeft, moveRight, moveUp, moveDown;
boolean gravityOn;

float playerSize = 50;
float velocityLimit = 20f;
float velocityMultiplier = 75f;
float accelerationMultiplier = 3f;
float gravityMultiplier = 1f;
float bounceMultiplier = 0.95f;
float dragMultiplier = 0.1f;

float time = 0f;
float oldTime = 0f;
float deltaTime = 0f;

PVector acceleration = new PVector();
PVector drag = new PVector();
PVector gravity = new PVector();
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
	gravity = gravity();
	applyForces();

	bounciness();

	wrapHorisontal();
	constrainVertical();	
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
	PVector acceleration = new PVector();

	if (moveLeft)
		acceleration.x -= 1;

	if (moveRight)
		acceleration.x += 1;

	if (moveUp)
		acceleration.y -= 1;

	if (moveDown)
		acceleration.y += 1;

	acceleration.normalize();
	acceleration.mult(accelerationMultiplier);

	return acceleration;
}

PVector drag()
{
	PVector drag = new PVector();

	drag.x = (velocity.x + acceleration.x) * -dragMultiplier;
	drag.y = (velocity.y + acceleration.y) * -dragMultiplier;

	return drag;
}

PVector gravity()
{
	PVector gravity = new PVector();

	if (gravityOn)
		gravity.set(0, gravityMultiplier);

	return gravity;
}

void bounciness()
{
	if (gravityOn)
	{
		if (position.y + playerSize/2 >= height)
		{
			velocity.y = velocity.y * -bounceMultiplier;
		}
	}
}

void applyForces()
{ 
	velocity.add(acceleration);
	velocity.add(drag);
	velocity.add(gravity);
	position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
	velocity.limit(velocityLimit);
	acceleration.set(0, 0);
}

void wrapHorisontal()
{
	if (position.x - playerSize > width)
		position.x = playerSize;

	if (position.x + playerSize < 0)
		position.x = width - playerSize;
}

void constrainVertical()
{
	if (position.y + playerSize/2 > height)
	{
		position.y = height - playerSize/2;
	}

	if (position.y - playerSize/2 < 0)
	{
		position.y = playerSize/2;
		velocity.y = 0;
	}
}

void drawBall()
{
	ellipse(position.x, position.y, playerSize, playerSize);

	if (position.x + playerSize > width)
		ellipse(position.x - width, position.y, playerSize, playerSize);

	if (position.x - playerSize < 0)
		ellipse(position.x + width, position.y, playerSize, playerSize);
}
