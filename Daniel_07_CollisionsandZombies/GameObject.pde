abstract class GameObject
{
	PVector velocity = new PVector();
	PVector position;
	PVector acceleration;
	PVector drag;
	PVector gravity;

	boolean inMotion = false;

	color colour;
	float size = 50;
	float radius;
}