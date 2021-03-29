using UnityEngine;
using System.Linq;
using UnityEngine.UI;

public class PerformMove : MonoBehaviour
{

    public void Cockroach()
    {
        Player().move = PlayerMove.Cockroach;
        HighlightButton("Button Cockroach");
        FirebaseCommands.instance.SaveData();
    }

    public void Foot()
    {
        Player().move = PlayerMove.Foot;
        HighlightButton("Button Foot");
        FirebaseCommands.instance.SaveData();
    }

    public void Nuke()
    {
        Player().move = PlayerMove.Nuke;
        HighlightButton("Button Nuke");
        FirebaseCommands.instance.SaveData();
    }

    private PlayerData Player()
    {
        return DataSingleton.Instance.data.playerDataList.players.
            Where(player => player.email == DataSingleton.Instance.loggedInUser).
            FirstOrDefault();
    }

    private void HighlightButton(string button)
    {
        GameObject.Find("Button Cockroach").GetComponent<Image>().color = Color.white;
        GameObject.Find("Button Foot").GetComponent<Image>().color = Color.white;
        GameObject.Find("Button Nuke").GetComponent<Image>().color = Color.white;

        GameObject.Find(button).GetComponent<Image>().color = Color.green;
    }

}
