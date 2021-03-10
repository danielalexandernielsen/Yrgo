using System;


[Serializable]
public class PlayerData
{
    public PlayerMove Move { get; set; }
    public string Name { get; set; }

	public PlayerData(string name)
    {
		Move = PlayerMove.Empty;
		Name = name;
	}
	
}

public enum PlayerMove
{
	Empty,
	Foot,
	Cockroach,
	Nuke
}