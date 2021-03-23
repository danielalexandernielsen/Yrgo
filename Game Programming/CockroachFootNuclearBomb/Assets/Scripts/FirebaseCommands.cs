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


    void Start()
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
        foreach (var playerData in PlayerDataList.registeredPlayers)
        {
            StartCoroutine(SaveDataAsync(JsonUtility.ToJson(playerData), "players", playerData.email.Replace("@", "").Replace(".", "")));
        }

    }

    public void SaveGames()
    {
        foreach (var gameData in GameData.games)
        {
            StartCoroutine(SaveDataAsync(JsonUtility.ToJson(gameData), "games", gameData.title));
        }

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
            PlayerDataList.registeredPlayers.Add(new PlayerData(email));
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

    private IEnumerator SaveDataAsync(string data, string folder, string subfolder)
    {
        var saveTask = FirebaseDatabase.DefaultInstance.RootReference.Child(folder).Child(subfolder).SetRawJsonValueAsync(data);

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

        if (loadTask.Exception is not null)
        {
            PopUpManager.DisplayPopUp(dialog: "PopUp", textbox: "PopUpText", message: loadTask.Exception.ToString());
            goto Exit;
        }

        if (jsonData is null)
        {
            retryAttempts++;
            goto RetryLoad;
        }

        Exit:

        //if (snapshot is null)
        //{
        //    Debug.Log("Database folder: " + folder + " is empty.");
        //}
        //else
        //{
        //    ReadJsonData(folder, snapshot);
        //    Debug.Log("Data loaded from Firebase.");
        //}

        Debug.Log(jsonData);

    }


    private static void ReadJsonData(string folder, DataSnapshot snapshot)
    {
        if (folder == "players")
        {
            var playerData = JsonUtility.FromJson<PlayerDataList>(snapshot.GetRawJsonValue());
            var playerData2 = JsonUtility.FromJson<PlayerDataList>(snapshot.GetRawJsonValue());


            //for (int i = 0; i < playerData.Count; i++)
            //{
            //    PlayerDataList.registeredPlayers.ElementAt(i).email = playerData[i].email;
            //    PlayerDataList.registeredPlayers.ElementAt(i).move = playerData[i].move;
            //}
        }

        else if (folder == "games")
        {
            var gameData = JsonUtility.FromJson<List<GameData>>(snapshot.GetRawJsonValue());

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