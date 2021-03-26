using UnityEngine;

public class DataSingleton : MonoBehaviour
{

    public Data data = new Data();
    public string loggedInUser;


    private static DataSingleton _instance;
    public static DataSingleton Instance
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