using System;
using System.Collections.Generic;


[Serializable]
public class PlayerData
{
	public PlayerMove move;
	public string email;

	public PlayerData(string email, PlayerMove move)
    {
		this.email = email;
		this.move = move;
	}	
}


[Serializable]
public class PlayerDataList
{
	public List<PlayerData> players = new List<PlayerData>();
}


public enum PlayerMove
{
	Empty,
	Foot,
	Cockroach,
	Nuke
}