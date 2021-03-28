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

    private bool playersSet;
    private float loadDelay;
    private float loadTimer;


    private void Start()
    {
        DontDestroyOnLoad(this);
        InvokeRepeating(nameof(StartGame), 1f, 5f);
        loadDelay = 5f;
    }

    private void StartGame()
    {
        FirebaseCommands.instance.LoadData();

        waitingForJoinText.SetActive(true);
        availableMoves.SetActive(false);

        if (GameSession.Instance.activeSession is null)
        {
            return;
        }

        if (GameSession.Instance.activeSession.playerOne is null || GameSession.Instance.activeSession.playerTwo is null)
        {
            return;
        }

        CancelInvoke();

        waitingForJoinText.SetActive(false);
        availableMoves.SetActive(true);
        InvokeRepeating(nameof(Battle), 1f, 5f);
    }


    private void Battle()
    {
        FirebaseCommands.instance.LoadData();

        if (GameSession.Instance.dataPlayerOne.move is PlayerMove.Empty || GameSession.Instance.dataPlayerTwo.move is PlayerMove.Empty)
        {
            waitingForMoveText.SetActive(true);
            return;
        }

        waitingForMoveText.SetActive(false);
        CancelInvoke();

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

        GameSession.Instance.dataPlayerOne.move = PlayerMove.Empty;
        GameSession.Instance.dataPlayerTwo.move = PlayerMove.Empty;
        SceneManager.LoadScene("Results");
    }



}