CellController cellController;

void setup()
{
	size(600, 600);
	frameRate(1);

	int cellSize = 10;
	int cellSaturation = 20;

	cellController = new CellController(cellSaturation, cellSize);
}

void draw()
{
	background(255);

	cellController.update();
	cellController.draw();
}
