using System.Linq;
using TMPro;
using UnityEngine;

public class Lobby : MonoBehaviour
{
    [SerializeField]
    private TMP_Dropdown dropdownOfGames;


    void CreateGame(string title, string playerOne, string playerTwo)
    {
        GameData newGame = new GameData(title, playerOne, playerTwo);

        if (DataSingleton.Instance.data.gameDataList.games.Contains(newGame) is false)
        {
            DataSingleton.Instance.data.gameDataList.games.Add(newGame);
            FirebaseCommands.instance.SaveData();
        }
        else
        {
            Debug.Log("Error: This account already exists.");
        }
    }

    void DeleteGame(string title, string playerOne, string playerTwo)
    {
        GameData gameToDelete = new GameData(title, playerOne, playerTwo);

        if (DataSingleton.Instance.data.gameDataList.games.Contains(gameToDelete) is true)
        {
            DataSingleton.Instance.data.gameDataList.games.Remove(gameToDelete);
            FirebaseCommands.instance.SaveData();
        }
        else
        {
            Debug.Log("Error: Cannot delete. Player does not exist.");
        }
    }

    void JoinGame(string title, string player, int slot)
    {
        GameData game = DataSingleton.Instance.data.gameDataList.games.Where(game => game.title == title).FirstOrDefault();

        if (game is null)
        {
            Debug.Log("Error: Cannot join game. Game does not exist.");
            return;
        }

        if (slot == 1)
        {
            game.playerOne = player;  
        }
        else if (slot == 2)
        {
            game.playerTwo = player;
        }

        FirebaseCommands.instance.SaveData();
    }

    void StartGame()
    {

    }

    void ListGames()
    {
        dropdownOfGames.options.Clear();

        foreach (var game in DataSingleton.Instance.data.gameDataList.games)
        {
            dropdownOfGames.options.Add(new TMP_Dropdown.OptionData() { text = game.title });
        }
    }

}
