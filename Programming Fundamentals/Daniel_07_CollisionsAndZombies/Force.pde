class Force
{
	float velocityLimit = 20f;
	float velocityMultiplier = 75f;
	float accelerationMultiplier = 3f;
	float gravityMultiplier = 1f;
	float dragMultiplier = 0.1f;
	float elasticityMultiplier = 0.95f;

	PVector acceleration = new PVector();
	PVector drag = new PVector();
	PVector gravity = new PVector();
	PVector velocity = new PVector();


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

		if (gravityEnabled)
			gravity.set(0, gravityMultiplier);

		return gravity;
	}

	void elasticity(Character object)
	{
		if (gravityEnabled)
		{
			if (object.position.y + object.radius >= height)
			{
				velocity.y = velocity.y * -elasticityMultiplier;
			}
		}
	}

	void generate(Character object)
	{
		acceleration = acceleration();
		drag = drag();
		gravity = gravity();
		elasticity(object);
	}

	void generate(Character object, float speed)
	{
		if (object.inMotion == false)
		{
			object.velocity.set(random(-speed, speed), random(-speed, speed));
		}
	}


	void apply(Character object, ForceType forceType)
	{   
		switch(forceType)
		{
			case CONSTANT:
			object.position.add(PVector.mult(object.velocity, deltaTime * velocityMultiplier));
			break;
		}
		object.inMotion = true;
	}
}

enum ForceType
{
	CONSTANT;
}
