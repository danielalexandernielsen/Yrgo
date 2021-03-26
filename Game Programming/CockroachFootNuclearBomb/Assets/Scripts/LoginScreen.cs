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

        if (DataSingleton.Instance.data.playerDataList.players?.Any(playerData => playerData.email == email.text) is true)
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
        DataSingleton.Instance.loggedInUser = email.text;
    }



    public void DeletePlayer()
    {
        PlayerData playerToDelete = new PlayerData(email.text, PlayerMove.Empty);

        if (DataSingleton.Instance.data.playerDataList.players.Contains(playerToDelete) is true)
        {
            DataSingleton.Instance.data.playerDataList.players.Remove(playerToDelete);
            FirebaseCommands.instance.SaveData();
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp Dialog", textbox: "PopUpText (TMP)", message: "Error: Cannot delete. Player does not exist.");
        }
    }



}
