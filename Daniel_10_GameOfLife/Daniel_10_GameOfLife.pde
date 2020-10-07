GameObjectController gameObjectController;
int cellSize = 10;
int cellSaturation = 20;

void setup()
{
	size(1280, 720);

	gameObjectController = new GameObjectController(cellSaturation, cellSize);
}

void draw()
{
	background(0);
	fill(255);

	gameObjectController.update();
	gameObjectController.draw();

}
