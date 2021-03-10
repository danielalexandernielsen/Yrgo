using System;
using System.Collections.Generic;

[Serializable]
public class GameData
{
    public string Title { get; set; }
    public List<PlayerData> Players { get; set; }
}