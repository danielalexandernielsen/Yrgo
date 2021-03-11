using System;
using System.Collections.Generic;
using UnityEngine;

[Serializable]
public class GameData
{
    public string title;
    public string playerOne;
    public string playerTwo;
    public static List<GameData> games;

	public GameData(string title, string hostingPlayer)
	{
		this.title = title;
		this.playerOne = hostingPlayer;

		if (games.Contains(this) is false)
		{
			games.Add(this);
		}
		else
		{
			Debug.Log("Game already exists.");
		}

	}

}