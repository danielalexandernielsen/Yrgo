using UnityEngine;

public class DataSingleton : MonoBehaviour
{
    private static DataSingleton _instance;
    public static DataSingleton Instance
    {
        get
        {
            return _instance;
        }
    }

    public PlayerDataList playerDataList = new PlayerDataList();

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