abstract class Character
{
	PVector velocity = new PVector();
	PVector position;
	PVector acceleration;
	PVector drag;
	PVector gravity;

	boolean inMotion = false;

	color colour;
	float size = 20;
	float radius = size / 2;

	void draw()
	{
		push();
		fill(colour);
		noStroke();

		ellipse(position.x, position.y, size, size);

		if (position.x + size > width)
			ellipse(position.x - width, position.y, size, size);

		if (position.x - size < 0)
			ellipse(position.x + width, position.y, size, size);

		if (position.y + size > height)
			ellipse(position.x, position.y - height, size, size);

		if (position.y - size < 0)
			ellipse(position.x, position.y + height, size, size);

		pop();
	}
}
