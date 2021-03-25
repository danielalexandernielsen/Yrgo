using System;
using System.Collections.Generic;


[Serializable]
public class GameData
{
    public string title;
    public string playerOne;
    public string playerTwo;

	public GameData(string title, string playerOne, string playerTwo)
	{
		this.title = title;
		this.playerOne = playerOne;
		this.playerTwo = playerTwo;
	}

}


[Serializable]
public class GameDataList
{
    public List<GameData> games = new List<GameData>();
}
