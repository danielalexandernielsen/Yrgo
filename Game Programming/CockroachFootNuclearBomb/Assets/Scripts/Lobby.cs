using System.Linq;
using UnityEngine;
using TMPro;
using UnityEngine.SceneManagement;

public class Lobby : MonoBehaviour
{
    [SerializeField]
    private TMP_InputField hostedGameTitle;

    [SerializeField]
    private TMP_Dropdown joinedGameTitle;

    private void Awake()
    {
        FirebaseCommands.instance.LoadData();
    }

    public void CreateGame()
    {

        if (DataSingleton.Instance.data.gameDataList.games?.Any(gameData => gameData.title == hostedGameTitle.text) is false)
        {
            var hostedGame = new GameData(hostedGameTitle.text, DataSingleton.Instance.loggedInUser, null);
            DataSingleton.Instance.data.gameDataList.games.Add(hostedGame);
            GameSession.Instance.activeSessionTitle = hostedGameTitle.text;

            FirebaseCommands.instance.SaveData();
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Game created successfully.");
            SceneManager.LoadScene("Game");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: A game with this title already exists.");
        }
    }

    public void JoinGame()
    {
        GameData joinedGame = DataSingleton.Instance.data.gameDataList.games.Where(game => game.title == joinedGameTitle.captionText.text).FirstOrDefault();

        if (joinedGame is null)
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: Cannot join game. Game does not exist.");
            return;
        }
        else if (joinedGame.playerOne == joinedGame.playerTwo)
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: You cannot join as the second player on your own game.");
            return;
        }
        else
        {
            joinedGame.playerTwo = DataSingleton.Instance.loggedInUser;
            GameSession.Instance.activeSessionTitle = joinedGameTitle.captionText.text;

            SceneManager.LoadScene("Game");
        }

        FirebaseCommands.instance.SaveData();
    }

    public void DeleteGame(string title)
    {

        if (DataSingleton.Instance.data.gameDataList.games?.Any(gameData => gameData.title == title) is true)
        {
            var gameToDelete = DataSingleton.Instance.data.gameDataList.games?.Where(gameData => gameData.title == title).FirstOrDefault();
            DataSingleton.Instance.data.gameDataList.games.Remove(gameToDelete);
            FirebaseCommands.instance.SaveData();
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: Cannot delete. Game does not exist.");
        }
    }




}
