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
        LoadPlayers();
        LoadGames();
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

    public void SavePlayers()
    {
        StartCoroutine(SaveDataAsync(JsonUtility.ToJson(DataSingleton.Instance.playerDataList)));
    }

    public void SaveGames()
    {
        //foreach (var gameData in GameData.games)
        //{
        //    StartCoroutine(SaveDataAsync(JsonUtility.ToJson(gameData), "games", gameData.title));
        //}
    }

    public void LoadPlayers()
    {
        StartCoroutine(LoadDataAsync("players"));
    }

    public void LoadGames()
    {
        StartCoroutine(LoadDataAsync("games"));
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
            DataSingleton.Instance.playerDataList.players.Add(new PlayerData(email));
            FirebaseCommands.instance.SavePlayers();
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

    private IEnumerator LoadDataAsync(string folder)
    {
        int retryAttempts = 0;

    RetryLoad:
        var loadTask = FirebaseDatabase.DefaultInstance.RootReference.Child(folder).GetValueAsync();
        yield return new WaitUntil(() => loadTask.IsCompleted);

        string jsonData = loadTask.Result.GetRawJsonValue();

        if (jsonData is null)
        {
            retryAttempts++;
            goto RetryLoad;
        }

        if (loadTask.Exception is null)
        {
            ReadJsonData(folder, jsonData);
            Debug.Log("Data loaded from firebase.");
        }
        else
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: loadTask.Exception.ToString());
        }

    }


    private static void ReadJsonData(string folder, string jsonData)
    {
        if (folder == "players")
        {
            var importedPlayerDataList = JsonUtility.FromJson<PlayerDataList>(jsonData);

            for (int i = 0; i < importedPlayerDataList.players.Count; i++)
            {
                DataSingleton.Instance.playerDataList.players.ElementAt(i).email = importedPlayerDataList.players.ElementAt(i).email;
                DataSingleton.Instance.playerDataList.players.ElementAt(i).move = importedPlayerDataList.players.ElementAt(i).move;
            }
        }

        else if (folder == "games")
        {
            var gameData = JsonUtility.FromJson<List<GameData>>(jsonData);

            for (int i = 0; i < gameData.Count; i++)
            {
                GameData.games.ElementAt(i).title = gameData[i].title;
                GameData.games.ElementAt(i).playerOne = gameData[i].playerOne;
                GameData.games.ElementAt(i).playerTwo = gameData[i].playerTwo;
            }
        }
    }

    #endregion
}