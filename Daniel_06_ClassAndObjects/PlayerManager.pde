class PlayerManager
{
	Player player;

	PlayerManager()
	{
		player = new Player();
	}

	void display()
	{
		player.acceleration = player.acceleration();
		player.drag = player.drag();
		player.gravity = player.gravity();
		player.applyForces();

		player.bounciness();

		player.wrapHorisontal();
		player.constrainVertical();  
		player.display();
	}

	void diagnostics()
	{
		textSize(25);
		text(
			"Acceleration X: " + round(player.acceleration.x) + "\n" +
			"Acceleration Y: " + round(player.acceleration.y) + "\n" +
			"Velocity X: " + round(player.velocity.x) + "\n" +
			"Velocity Y: " + round(player.velocity.y) + "\n" +
			"Position X: " + round(player.position.x) + "\n" +
			"Position Y: " + round(player.position.y) + "\n"
			, 50, 50);
	}

}