boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;

float size;
float velocityLimit;
float drag;
float speed;

PVector acceleration;
PVector velocity;
PVector position;


void setup() 
{
	size(640, 600);
	position = new PVector(width/2, height/2);
	velocity = new PVector(0, 0);
	acceleration = new PVector(0, 0);

	velocityLimit = 20f;
	speed = 1f;
	drag = 0.9f;
	size = 50;
}

void draw()
{
	background(128);

	calculateHorisontalMovement();
	calculateVerticalMovement();
	executeMovement();
	ellipse(position.x, position.y, size, size);
}

void calculateHorisontalMovement()
{
	if (moveLeft)
	{
		acceleration.x -= speed;
	}
	if (moveRight)
	{
		acceleration.x += speed;
	}
	if (!moveLeft && !moveRight)
	{
		acceleration.x = 0f;
		velocity.x *= drag;
	}
}

void calculateVerticalMovement()
{
	if (moveUp)
	{
		acceleration.y -= speed;
	}
	if (moveDown)
	{
		acceleration.y += speed;
	}
	if (!moveUp && !moveDown)
	{
		acceleration.y = 0f;
		velocity.y *= drag;
	}
}

void executeMovement()
{
	velocity.add(acceleration);
	position.add(velocity);
	velocity.limit(velocityLimit);
}