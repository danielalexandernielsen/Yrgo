class Player
{
	float size = 50;
	float velocityLimit = 20f;
	float velocityMultiplier = 75f;
	float accelerationMultiplier = 3f;
	float gravityMultiplier = 1f;
	float bounceMultiplier = 0.95f;
	float dragMultiplier = 0.1f;

	PVector acceleration = new PVector();
	PVector drag = new PVector();
	PVector gravity = new PVector();
	PVector velocity = new PVector();
	PVector position;

	Player()
	{
		position = new PVector(width/2, height/2);
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
			if (position.y + size/2 >= height)
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
		if (position.x - size > width)
			position.x = size;

		if (position.x + size < 0)
			position.x = width - size;
	}

	void constrainVertical()
	{
		if (position.y + size/2 > height)
		{
			position.y = height - size/2;
		}

		if (position.y - size/2 < 0)
		{
			position.y = size/2;
			velocity.y = 0;
		}
	}

/*
	boolean collision(Ball player, Ball enemy)
	{
		float maxDistance = player.size + player.size;

		if(abs(player.x - enemy.x) > maxDistance || abs(player.y - enemy.y) > maxDistance)
		{
			return false;
		}

		else if(dist(player.x, player.y, enemy.x, enemy.y) > maxDistance)
		{
			return false;
		}

		else
		{
			return true;
		}
	}
*/

	void display()
	{
		ellipse(position.x, position.y, size, size);

		if (position.x + size > width)
			ellipse(position.x - width, position.y, size, size);

		if (position.x - size < 0)
			ellipse(position.x + width, position.y, size, size);
	}
}