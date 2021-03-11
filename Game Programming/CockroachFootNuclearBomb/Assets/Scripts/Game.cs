using UnityEngine;

public class Game : MonoBehaviour
{

    void CreateGame(string title)
    {
        GameData newGame = new GameData(title);

        if (GameData.games.Contains(newGame) is false)
        {
            GameData.games.Add(newGame);
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
        }
        else
        {
            Debug.Log("Error: Cannot delete. Player does not exist.");
        }
    }

    void JoinGame()
    {

    }

}
