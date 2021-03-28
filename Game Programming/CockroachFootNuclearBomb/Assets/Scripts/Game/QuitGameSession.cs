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

        GameSession.Instance.activeSession = null;
        GameSession.Instance.dataPlayerOne = null;
        GameSession.Instance.dataPlayerTwo = null;
        GameSession.Instance.winner = null;
        GameSession.Instance.tie = false;

        FirebaseCommands.instance.SaveData();
    }

}
