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
        StartCoroutine(SaveDataAsync(JsonUtility.ToJson(PlayerData.registeredPlayers), "players"));
    }

    public void SaveGames()
    {
        StartCoroutine(SaveDataAsync(JsonUtility.ToJson(GameData.games), "games"));
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

        if (registrationTask.IsCompleted)
        {
            Debug.Log("Registration Complete.");
        }
        else if (registrationTask.IsFaulted)
        {
            Debug.LogWarning(registrationTask.Exception);
        }
    }


    private IEnumerator LoginUserAsync(string email, string password)
    {
        Debug.Log("Attempting to log in.");
        var loginTask = FirebaseAuth.DefaultInstance.SignInWithEmailAndPasswordAsync(email, password);

        yield return new WaitUntil(() => loginTask.IsCompleted);

        if (loginTask.IsCompleted)
        {
            loggedIn = true;
            Debug.Log("Login successful.");
        }
        else if (loginTask.IsFaulted)
        {
            loggedIn = false;
            Debug.LogWarning(loginTask.Exception);
        }
    }

    private IEnumerator SaveDataAsync(string data, string folder)
    {
        var saveTask = FirebaseDatabase.DefaultInstance.RootReference.Child(folder).SetRawJsonValueAsync(data);

        yield return new WaitUntil(() => saveTask.IsCompleted);

        if (saveTask.IsCompleted)
        {
            Debug.Log("Data saved in Firebase.");
        }
        else if (saveTask.IsFaulted)
        {
            Debug.LogWarning(saveTask.Exception);
        }

    }

    private IEnumerator LoadDataAsync(string folder)
    {
        DataSnapshot snapshot = null;

        var loadTask = FirebaseDatabase.DefaultInstance.RootReference.Child(folder).GetValueAsync().ContinueWithOnMainThread(task =>
        {
            if (task.IsCompleted)
            {
                snapshot = task.Result;
            }
            else if (task.IsFaulted)
            {
                Debug.LogError(task.Exception);
            }
        });

        yield return new WaitUntil(() => loadTask.IsCompleted);

        ToJson(folder, snapshot);

        Debug.Log("Data loaded from Firebase.");
    }


    private static void ToJson(string folder, DataSnapshot snapshot)
    {
        if (folder == "players")
        {
            var playerData = JsonUtility.FromJson<List<PlayerData>>(snapshot.GetRawJsonValue());

            for (int i = 0; i < PlayerData.registeredPlayers.Count; i++)
            {
                PlayerData.registeredPlayers.ElementAt(i).email = playerData[i].email;
                PlayerData.registeredPlayers.ElementAt(i).move = playerData[i].move;
            }
        }

        else if (folder == "games")
        {
            var gameData = JsonUtility.FromJson<List<GameData>>(snapshot.GetRawJsonValue());

            for (int i = 0; i < GameData.games.Count; i++)
            {
                GameData.games.ElementAt(i).title = gameData[i].title;
                GameData.games.ElementAt(i).playerOne = gameData[i].playerOne;
                GameData.games.ElementAt(i).playerTwo = gameData[i].playerTwo;
            }
        }
    }

    #endregion
}