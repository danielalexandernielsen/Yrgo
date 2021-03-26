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

    public void CreateGame()
    {

        if (DataSingleton.Instance.data.gameDataList.games?.Any(gameData => gameData.title == hostedGameTitle.text) is false)
        {
            GameData newGame = new GameData(hostedGameTitle.text, DataSingleton.Instance.loggedInUser, null);
            DataSingleton.Instance.data.gameDataList.games.Add(newGame);
            FirebaseCommands.instance.SaveData();
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Game created successfully.");
            SceneManager.LoadScene("Game");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: A game with this title already exists.");
        }
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
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: Cannot delete. Player does not exist.");
        }
    }

    public void JoinGame()
    {
        GameData game = DataSingleton.Instance.data.gameDataList.games.Where(game => game.title == joinedGameTitle.captionText.text).FirstOrDefault();

        if (game is null)
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: Cannot join game. Game does not exist.");
            return;
        }
        else
        {
            game.playerTwo = DataSingleton.Instance.loggedInUser;
        }


        FirebaseCommands.instance.SaveData();
    }

    public void StartGame()
    {

    }
}
