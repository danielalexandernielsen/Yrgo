class Ball
{
	PVector position;
	PVector velocity;
	float size;
	color colour;

	Ball(float x, float y, float size, color colour)
	{
		position = new PVector(x, y);
		velocity = new PVector();
		velocity.x = random(11) - 5;
		velocity.y = random(11) - 5;

		this.size = size;
		this.colour = colour;
	}

	void update()
	{
		position.x += velocity.x;
		position.y += velocity.y;
	}

	void bounce()
	{
		if (position.x + size > width)
			position.x *= -1;

		if (position.x - size < 0)
			position.x *= -1;

		if (position.y + size > height)
			position.y *= -1;

		if (position.y - size < 0)
			position.y *= -1;
	}

	void display()
	{
		ellipse(position.x, position.y, size, size);
	}
}
