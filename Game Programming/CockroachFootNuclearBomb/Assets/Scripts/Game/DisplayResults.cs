using UnityEngine;
using TMPro;
using UnityEngine.UI;                

public class DisplayResults : MonoBehaviour
{

    [SerializeField]
    private TMP_Text playerOneText;

    [SerializeField]
    private TMP_Text playerTwoText;

    [SerializeField]
    private Image playerOneImage;

    [SerializeField]
    private Image playerTwoImage;


    [SerializeField]
    private Sprite nuke;

    [SerializeField]
    private Sprite cockroach;

    [SerializeField]
    private Sprite foot;



    private void Start()
    {
        if (GameSession.Instance.tie)
        {
            playerOneText.text = GameSession.Instance.dataPlayerOne.email + ". It's tie!";
            playerTwoText.text = GameSession.Instance.dataPlayerTwo.email + ". It's tie!";

        }
        else if (GameSession.Instance.winner == GameSession.Instance.dataPlayerOne)
        {
            playerOneText.text = GameSession.Instance.dataPlayerOne.email + " wins!";
            playerTwoText.text = GameSession.Instance.dataPlayerTwo.email + " loses!";
        }
        else
        {
            playerOneText.text = GameSession.Instance.dataPlayerOne.email + " loses!";
            playerTwoText.text = GameSession.Instance.dataPlayerTwo.email + " wins!";
        }

        playerOneImage.sprite = FindMoveImage(GameSession.Instance.dataPlayerOne.move);
        playerTwoImage.sprite = FindMoveImage(GameSession.Instance.dataPlayerTwo.move);
    }

    private Sprite FindMoveImage(PlayerMove playerMove)
    {
        if (playerMove is PlayerMove.Foot)
        {
            return foot;
        }
        else if (playerMove is PlayerMove.Cockroach)
        {
            return cockroach;
        }
        else
        {
            return nuke;
        }
    }

}
