using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class PlayerData
{
	public static List<PlayerData> registeredPlayers;
	public PlayerMove move;
	public string name;

	public PlayerData(string name)
    {
		this.name = name;
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