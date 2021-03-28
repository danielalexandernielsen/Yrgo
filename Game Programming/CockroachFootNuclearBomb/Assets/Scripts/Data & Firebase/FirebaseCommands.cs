using UnityEngine;
using Firebase.Database;
using System.Collections;
using Firebase.Auth;
using System.Linq;
using UnityEngine.SceneManagement;

public class FirebaseCommands : MonoBehaviour
{
    public static FirebaseCommands instance;
    public static bool loggedIn;
    public static bool loginInProcess;


    void OnEnable()
    {
        instance = this;
        LoadData();
    }


    #region FUNCTIONS ACCESSIBLE IN THE EDITOR

    public void RegisterUser(string email, string password)
    {
        StartCoroutine(RegisterUserAsync(email, password));
    }

    public void LoginUser(string email, string password)
    {
        StartCoroutine(LoginUserAsync(email, password));
    }

    public void SaveData()
    {
        StartCoroutine(SaveDataAsync(JsonUtility.ToJson(DataSingleton.Instance.data)));
    }

    public void LoadData()
    {
        StartCoroutine(LoadDataAsync());
    }

    #endregion



    #region COMMUNICATION WITH FIREBASE

    private IEnumerator RegisterUserAsync(string email, string password)
    {
        Debug.Log("Starting Registration.");
        var registrationTask = FirebaseAuth.DefaultInstance.CreateUserWithEmailAndPasswordAsync(email, password);

        yield return new WaitUntil(() => registrationTask.IsCompleted);

        if (registrationTask.Exception is null)
        {
            DataSingleton.Instance.data.playerDataList.players.Add(new PlayerData(email, PlayerMove.Empty));
            FirebaseCommands.instance.SaveData();
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Registration Complete.");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Registration failed.");
        }
    }


    private IEnumerator LoginUserAsync(string email, string password)
    {
        Debug.Log("Attempting to log in.");
        var loginTask = FirebaseAuth.DefaultInstance.SignInWithEmailAndPasswordAsync(email, password);

        yield return new WaitUntil(() => loginTask.IsCompleted);

        if (loginTask.Exception is null)
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Welcome! Login successful.");
            SceneManager.LoadScene("Lobby");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: Wrong username or password.");
        }
    }

    private IEnumerator SaveDataAsync(string data)
    {
        var saveTask = FirebaseDatabase.DefaultInstance.RootReference.SetRawJsonValueAsync(data);

        yield return new WaitUntil(() => saveTask.IsCompleted);

        if (saveTask.Exception is null)
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Data saved in Firebase.");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: Data could not saved.");
        }

    }

    private IEnumerator LoadDataAsync()
    {
        int retryAttempts = 0;

    RetryLoad:
        var loadTask = FirebaseDatabase.DefaultInstance.RootReference.GetValueAsync();
        yield return new WaitUntil(() => loadTask.IsCompleted);

        string jsonData = loadTask.Result.GetRawJsonValue();

        if (jsonData is null)
        {
            retryAttempts++;
            goto RetryLoad;
        }

        if (loadTask.Exception is null)
        {
            ReadJsonData(jsonData);
            //PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Data loaded from firebase.");
            Debug.Log("Data loaded from firebase.");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Error: Data could not be loaded.");
        }

    }


    private static void ReadJsonData(string jsonData)
    {

        var importedData = JsonUtility.FromJson<Data>(jsonData);

        DataSingleton.Instance.data.playerDataList.players.Clear();
        DataSingleton.Instance.data.gameDataList.games.Clear();

        for (int i = 0; i < importedData.playerDataList.players.Count; i++)
        {
            DataSingleton.Instance.data.playerDataList.players.Add(
                new PlayerData(
                    importedData.playerDataList.players.ElementAt(i).email,
                    importedData.playerDataList.players.ElementAt(i).move)
                );
        }

        for (int i = 0; i < importedData.gameDataList.games.Count; i++)
        {
            DataSingleton.Instance.data.gameDataList.games.Add(
                new GameData(
                    importedData.gameDataList.games.ElementAt(i).title,
                    importedData.gameDataList.games.ElementAt(i).playerOne,
                    importedData.gameDataList.games.ElementAt(i).playerTwo)
                );
        }

    }

    #endregion
}