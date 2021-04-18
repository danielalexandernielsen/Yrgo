using System.Linq;
using UnityEngine;
using UnityEngine.SceneManagement;

public class QuitGameSession : MonoBehaviour
{

    public void ReturnToLobby()
    {
        ScrubData();
        SceneManager.LoadScene("Lobby");
    }


    private void ScrubData()
    {
        DataSingleton.Instance.data.gameDataList.games.Remove(GameSession.Instance.activeSession);

        FirebaseCommands.instance.SavePlayerMove(GetPlayerIndex().ToString(), "0");

        GameSession.Instance.activeSession = null;
        GameSession.Instance.dataPlayerOne.move = PlayerMove.Empty;
        GameSession.Instance.dataPlayerOne = null;
        GameSession.Instance.dataPlayerTwo.move = PlayerMove.Empty;
        GameSession.Instance.dataPlayerTwo = null;
        GameSession.Instance.winner = null;
        GameSession.Instance.tie = false;
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

}
