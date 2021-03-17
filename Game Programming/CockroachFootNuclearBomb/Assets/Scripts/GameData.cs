using System;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

[Serializable]
public class GameData
{
    public string title;
    public string playerOne;
    public string playerTwo;
    public static List<GameData> games;

	public GameData(string title)
	{
		this.title = title;
	}

}