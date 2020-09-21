class PlayerController
{
	Player player;

	PlayerController(Player player)
	{
		this.player = player;
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
    player.diagnostics();
	}
}
