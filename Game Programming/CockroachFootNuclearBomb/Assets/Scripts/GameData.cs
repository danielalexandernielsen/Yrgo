using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

[Serializable]
public class GameData
{
    public static List<GameData> games = new List<GameData>();
    public string title;
    public string playerOne;
    public string playerTwo;

	public GameData(string title)
	{
		this.title = title;
	}

}