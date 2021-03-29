using UnityEngine;

public class GameSession : MonoBehaviour
{

    public GameData activeSession;
    public string activeSessionTitle;
    public PlayerData dataPlayerOne;
    public PlayerData dataPlayerTwo;

    public PlayerData winner;
    public bool tie;

    private static GameSession _instance;
    public static GameSession Instance
    {
        get
        {
            return _instance;
        }
    }


    private void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(gameObject);
        }
        else
        {
            _instance = this;
            DontDestroyOnLoad(this);
        }
    }

}