using UnityEngine;
using System.Linq;
using UnityEngine.UI;

public class PerformMove : MonoBehaviour
{

    public void Cockroach()
    {
        GetPlayer().move = PlayerMove.Cockroach;
        HighlightButton("Button Cockroach");
        FirebaseCommands.instance.SavePlayerMove(GetPlayerIndex().ToString(), ((int)GetPlayer().move).ToString());
    }

    public void Foot()
    {
        GetPlayer().move = PlayerMove.Foot;
        HighlightButton("Button Foot");
        FirebaseCommands.instance.SavePlayerMove(GetPlayerIndex().ToString(), ((int)GetPlayer().move).ToString());
    }

    public void Nuke()
    {
        GetPlayer().move = PlayerMove.Nuke;
        HighlightButton("Button Nuke");
        FirebaseCommands.instance.SavePlayerMove(GetPlayerIndex().ToString(), ((int)GetPlayer().move).ToString());
    }

    private PlayerData GetPlayer()
    {
        return DataSingleton.Instance.data.playerDataList.players.
            Where(player => player.email == DataSingleton.Instance.loggedInUser).
            FirstOrDefault();
    }

    private int GetPlayerIndex()
    {
        return DataSingleton.Instance.data.playerDataList.players.
            FindIndex(player => player == GetPlayer());
    }

    private void HighlightButton(string button)
    {
        GameObject.Find("Button Cockroach").GetComponent<Image>().color = Color.white;
        GameObject.Find("Button Foot").GetComponent<Image>().color = Color.white;
        GameObject.Find("Button Nuke").GetComponent<Image>().color = Color.white;

        GameObject.Find(button).GetComponent<Image>().color = Color.green;
    }

}
