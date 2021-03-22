using System;
using System.Collections.Generic;


[Serializable]
public class PlayerData
{
	public static List<PlayerData> registeredPlayers = new List<PlayerData>();
	public PlayerMove move;
	public string email;

	public PlayerData(string email)
    {
		this.email = email;
		move = PlayerMove.Empty;
	}
	
}


public enum PlayerMove
{
	Empty,
	Foot,
	Cockroach,
	Nuke
}