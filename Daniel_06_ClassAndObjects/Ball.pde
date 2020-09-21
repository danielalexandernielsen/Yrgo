class Ball
{
	PVector position;
	PVector velocity;
	float velocityMultiplier = 75f;
	float size;
	float radius;
	color colour;

	Ball()
	{
		this.size = random(1, 100);
		this.radius = size/2;
		this.colour = color(random(0, 255), random(0, 255), random(0, 255));
		position = new PVector(random(0, width), random (0, height ));
		velocity = new PVector(random(-7, 7), random(-7, 7));
	}

	Ball(float x, float y, float size, float xSpeed, float ySpeed, color colour)
	{
		this.size = size;
		this.radius = size/2;
		this.colour = colour;
		position = new PVector(x, y);
		velocity = new PVector(xSpeed, ySpeed);
	}


	void update()
	{
		applyForces();
		edgeBounce();
		display();
	}

	void applyForces()
	{
		position.add(PVector.mult(velocity, deltaTime * velocityMultiplier));
	}

	void edgeBounce()
	{
		if (position.x + radius >= width)
		{
			position.x = width - radius;
			velocity.x *= -1;
		}

		if (position.x - radius <= 0)
		{
			position.x = radius;
			velocity.x *= -1;
		}

		if (position.y + radius >= height)
		{
			position.y = height - radius;
			velocity.y *= -1;
		}

		if (position.y - radius <= 0)
		{
			position.y = 0 + radius;
			velocity.y *= -1;
		}
	}

	void display()
	{
		push();
		fill(colour);
		noStroke();
		ellipse(position.x, position.y, size, size);
		pop();
	}
}
