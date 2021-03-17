using System.Linq;
using TMPro;
using UnityEngine;

public class Lobby : MonoBehaviour
{
    [SerializeField]
    private TMP_Dropdown dropdownOfGames;


    void CreateGame(string title)
    {
        GameData newGame = new GameData(title);

        if (GameData.games.Contains(newGame) is false)
        {
            GameData.games.Add(newGame);
            FirebaseCommands.instance.SaveGames();
        }
        else
        {
            Debug.Log("Error: This account already exists.");
        }
    }

    void DeleteGame(string title)
    {
        GameData gameToDelete = new GameData(title);

        if (GameData.games.Contains(gameToDelete) is true)
        {
            GameData.games.Remove(gameToDelete);
            FirebaseCommands.instance.SaveGames();
        }
        else
        {
            Debug.Log("Error: Cannot delete. Player does not exist.");
        }
    }

    void JoinGame(string title, string player, int slot)
    {
        GameData game = GameData.games.Where(game => game.title == title).FirstOrDefault();

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

        FirebaseCommands.instance.SaveGames();
    }

    void StartGame()
    {

    }

    void ListGames()
    {
        dropdownOfGames.options.Clear();

        foreach (var game in GameData.games)
        {
            dropdownOfGames.options.Add(new TMP_Dropdown.OptionData() { text = game.title });
        }
    }

}
