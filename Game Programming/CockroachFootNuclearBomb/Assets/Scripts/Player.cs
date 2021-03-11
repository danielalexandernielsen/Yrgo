using UnityEngine;

public class Player : MonoBehaviour
{

    void CreatePlayer(string name)
    {
        PlayerData newPlayer = new PlayerData(name);

        if (PlayerData.registeredPlayers.Contains(newPlayer) is false)
        {
            PlayerData.registeredPlayers.Add(newPlayer);
        }
        else
        {
            Debug.Log("Error: This account already exists.");
        }
    }

    void DeletePlayer(string name)
    {
        PlayerData playerToDelete = new PlayerData(name);

        if (PlayerData.registeredPlayers.Contains(playerToDelete) is true)
        {
            PlayerData.registeredPlayers.Remove(playerToDelete);
        }
        else
        {
            Debug.Log("Error: Cannot delete. Player does not exist.");
        }
    }

    void MakeMyMove(PlayerMove playerMove)
    {

    }

}
