using UnityEngine;
using System.Linq;

public class Game : MonoBehaviour
{

    [SerializeField]
    private GameObject waitingText;

    [SerializeField]
    private GameObject availableMoves;

    private bool playersSet;
    private bool tie;
    private PlayerData winner;
    private PlayerData loser;

    private void Start()
    {
        DontDestroyOnLoad(this);
        InvokeRepeating(nameof(StartGame), 1f, 5f);
    }

    private void StartGame()
    {
        waitingText.SetActive(true);
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

        if (playersSet is false)
        {
            SetPlayers();
        }

        waitingText.SetActive(false);
        availableMoves.SetActive(true);
    }


    private void SetPlayers()
    {
        GameSession.Instance.playerOneData = 
            DataSingleton.Instance.data.playerDataList.players.
            Where(player => player.email == GameSession.Instance.activeSession.playerOne).
            FirstOrDefault();

        GameSession.Instance.playerTwoData =
            DataSingleton.Instance.data.playerDataList.players.
            Where(player => player.email == GameSession.Instance.activeSession.playerTwo).
            FirstOrDefault();

        playersSet = true;
    }

    private void Battle()
    {

        if (GameSession.Instance.playerOneData.move is PlayerMove.Empty || GameSession.Instance.playerTwoData.move is PlayerMove.Empty)
        {
            return;
        }

        CancelInvoke();

        if (GameSession.Instance.playerOneData.move == GameSession.Instance.playerTwoData.move)
        {
            tie = true;
        }

        if (GameSession.Instance.playerOneData.move is PlayerMove.Foot)
        {
            if (GameSession.Instance.playerTwoData.move is PlayerMove.Cockroach)
                winner = GameSession.Instance.playerOneData;

            else if (GameSession.Instance.playerTwoData.move is PlayerMove.Nuke)
                winner = GameSession.Instance.playerTwoData;
        }

        else if (GameSession.Instance.playerOneData.move is PlayerMove.Cockroach)
        {
            if (GameSession.Instance.playerTwoData.move is PlayerMove.Nuke)
                winner = GameSession.Instance.playerOneData;

            else if (GameSession.Instance.playerTwoData.move is PlayerMove.Foot)
                winner = GameSession.Instance.playerTwoData;
        }

        else if (GameSession.Instance.playerOneData.move is PlayerMove.Nuke)
        {
            if (GameSession.Instance.playerTwoData.move is PlayerMove.Foot)
                winner = GameSession.Instance.playerOneData;

            else if (GameSession.Instance.playerTwoData.move is PlayerMove.Cockroach)
                winner = GameSession.Instance.playerTwoData;
        }



        GameSession.Instance.playerOneData.move = PlayerMove.Empty;
        GameSession.Instance.playerTwoData.move = PlayerMove.Empty;
    }



    void MakeMyMove(PlayerMove playerMove)
    {

    }


}