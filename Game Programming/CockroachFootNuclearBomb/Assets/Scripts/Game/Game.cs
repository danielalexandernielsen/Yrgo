using UnityEngine;
using System.Linq;
using UnityEngine.SceneManagement;

public class Game : MonoBehaviour
{

    [SerializeField]
    private GameObject waitingForJoinText;

    [SerializeField]
    private GameObject waitingForMoveText;

    [SerializeField]
    private GameObject availableMoves;

    private bool dataLoaded;


    private void Start()
    {
        DontDestroyOnLoad(this);

        waitingForJoinText.SetActive(true);
        availableMoves.SetActive(false);

        InvokeRepeating(nameof(LoadGame), 10f, 10f);
        InvokeRepeating(nameof(StartGame), 15f, 15f);
    }

    private void LoadGame()
    {
        Debug.Log("Attempting to Load Game");
        FirebaseCommands.instance.LoadData();
    }

    private void StartGame()
    {
        Debug.Log("Attempting to Start Game");

        GameSession.Instance.activeSession =
            DataSingleton.Instance.data.gameDataList.games.
            Where(game => game.title == GameSession.Instance.activeSessionTitle).
            FirstOrDefault();

        if (GameSession.Instance.activeSession.playerOne == "" || GameSession.Instance.activeSession.playerTwo == "" ||
            GameSession.Instance.activeSession.playerOne is null || GameSession.Instance.activeSession.playerTwo is null)
        {
            Debug.Log("Waiting for second player to join.");
            return;
        }

        Debug.Log("Players are ready. Starting game.");
        Debug.Log("Player one: " + GameSession.Instance.activeSession.playerOne);
        Debug.Log("Player two: " + GameSession.Instance.activeSession.playerTwo);
        CancelInvoke(nameof(StartGame));

        waitingForJoinText.SetActive(false);
        availableMoves.SetActive(true);

        InvokeRepeating(nameof(Battle), 5f, 15f);
    }


    private void Battle()
    {
        Debug.Log("Attempting to Start Battle");
        Debug.Log("Player one: " + GameSession.Instance.activeSession.playerOne);
        Debug.Log("Player two: " + GameSession.Instance.activeSession.playerTwo);

        GameSession.Instance.dataPlayerOne =
            DataSingleton.Instance.data.playerDataList.players.
            Where(player => player.email == GameSession.Instance.activeSession.playerOne).
            FirstOrDefault();

        GameSession.Instance.dataPlayerTwo =
            DataSingleton.Instance.data.playerDataList.players.
            Where(player => player.email == GameSession.Instance.activeSession.playerTwo).
            FirstOrDefault();

        if (GameSession.Instance.dataPlayerOne.move is PlayerMove.Empty || GameSession.Instance.dataPlayerTwo.move is PlayerMove.Empty)
        {
            waitingForMoveText.SetActive(true);
            return;
        }

        waitingForMoveText.SetActive(false);
        CancelInvoke(nameof(Battle));

        if (GameSession.Instance.dataPlayerOne.move == GameSession.Instance.dataPlayerTwo.move)
        {
            GameSession.Instance.tie = true;
        }

        if (GameSession.Instance.dataPlayerOne.move is PlayerMove.Foot)
        {
            if (GameSession.Instance.dataPlayerTwo.move is PlayerMove.Cockroach)
                GameSession.Instance.winner = GameSession.Instance.dataPlayerOne;

            else if (GameSession.Instance.dataPlayerTwo.move is PlayerMove.Nuke)
                GameSession.Instance.winner = GameSession.Instance.dataPlayerTwo;
        }

        else if (GameSession.Instance.dataPlayerOne.move is PlayerMove.Cockroach)
        {
            if (GameSession.Instance.dataPlayerTwo.move is PlayerMove.Nuke)
                GameSession.Instance.winner = GameSession.Instance.dataPlayerOne;

            else if (GameSession.Instance.dataPlayerTwo.move is PlayerMove.Foot)
                GameSession.Instance.winner = GameSession.Instance.dataPlayerTwo;
        }

        else if (GameSession.Instance.dataPlayerOne.move is PlayerMove.Nuke)
        {
            if (GameSession.Instance.dataPlayerTwo.move is PlayerMove.Foot)
                GameSession.Instance.winner = GameSession.Instance.dataPlayerOne;

            else if (GameSession.Instance.dataPlayerTwo.move is PlayerMove.Cockroach)
                GameSession.Instance.winner = GameSession.Instance.dataPlayerTwo;
        }

        Debug.Log("Battle completed!");

        SceneManager.LoadScene("Results");
    }

}