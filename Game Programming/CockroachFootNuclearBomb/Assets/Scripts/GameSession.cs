using UnityEngine;

public class GameSession : MonoBehaviour
{

    public GameData activeSession;
    public PlayerData playerOneData;
    public PlayerData playerTwoData;


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