class Ball
{
	PVector position;
	PVector velocity;
	float size;
	color colour;

	Ball(float x, float y, float size, float xSpeed, float ySpeed, color colour)
	{
		position = new PVector(x, y);
		velocity = new PVector(xSpeed, ySpeed);
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
		if (position.x + size/2 > width)
			velocity.x *= -1;

		if (position.x - size/2 < 0)
			velocity.x *= -1;

		if (position.y + size/2 > height)
			velocity.y *= -1;

		if (position.y - size/2 < 0)
			velocity.y *= -1;
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