using UnityEngine;
using Firebase.Extensions;
using Firebase.Database;
using System.Collections;
using Firebase.Auth;
using System.Linq;
using System.Collections.Generic;

public class FirebaseCommands : MonoBehaviour
{
    public static FirebaseCommands instance;
    public static bool loggedIn;


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
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: registrationTask.Exception.ToString());
        }
    }


    private IEnumerator LoginUserAsync(string email, string password)
    {
        Debug.Log("Attempting to log in.");
        var loginTask = FirebaseAuth.DefaultInstance.SignInWithEmailAndPasswordAsync(email, password);

        yield return new WaitUntil(() => loginTask.IsCompleted);

        if (loginTask.Exception is null)
        {
            loggedIn = true;
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: "Welcome! Login successful.");
        }
        else
        {
            loggedIn = false;
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: loginTask.Exception.ToString());
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
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: saveTask.Exception.ToString());
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
            Debug.Log("Data loaded from firebase.");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: loadTask.Exception.ToString());
        }

    }


    private static void ReadJsonData(string jsonData)
    {

        var importedData = JsonUtility.FromJson<Data>(jsonData); // Has to be done slower

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