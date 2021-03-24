using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;
using System.Linq;

public class LoginScreen : MonoBehaviour
{

    [SerializeField]
    private TMP_InputField email;

    [SerializeField]
    private TMP_InputField password;


    public void Register()
    {

        if (DataSingleton.Instance.playerDataList.players?.Any(playerData => playerData.email == email.text) is true)
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: This account already exists.");

        }
        else
        {
            FirebaseCommands.instance.RegisterUser(email.text, password.text);
        }
    }

    public void Login()
    {
        FirebaseCommands.instance.LoginUser(email.text, password.text);

        if (FirebaseCommands.loggedIn)
        {
            SceneManager.LoadScene("Lobby");
        }
    }


    public void DeletePlayer()
    {
        PlayerData playerToDelete = new PlayerData(email.text, PlayerMove.Empty);

        if (DataSingleton.Instance.playerDataList.players.Contains(playerToDelete) is true)
        {
            DataSingleton.Instance.playerDataList.players.Remove(playerToDelete);
            FirebaseCommands.instance.SavePlayers();
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp Dialog", textbox: "PopUpText (TMP)", message: "Error: Cannot delete. Player does not exist.");
        }
    }



}
