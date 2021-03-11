using UnityEngine;
using Firebase;
using Firebase.Extensions;
using Firebase.Database;
using System.Collections;
using Firebase.Auth;
using TMPro;

public class FirebaseCommands : MonoBehaviour
{
    [SerializeField]
    private TMP_InputField email;

    [SerializeField]
    private TMP_InputField password;

    // Functions accessible in the editor

    public void RegisterUser()
    {
        StartCoroutine(RegisterUserAsync());
    }

    public void LoginUser()
    {
        StartCoroutine(LoginUserAsync());
    }

    public void SaveData()
    {
        StartCoroutine(SaveDataAsync(JsonUtility.ToJson(PlayerData.registeredPlayers), "players"));
        StartCoroutine(SaveDataAsync(JsonUtility.ToJson(GameData.games), "games"));
    }

    public void LoadData()
    {
        StartCoroutine(LoadDataAsync());

        //JsonUtility.FromJson<PlayerData>(jsonString);
    }


    // 


    private IEnumerator RegisterUserAsync()
    {
        Debug.Log("Starting Registration.");
        var registrationTask = FirebaseAuth.DefaultInstance.CreateUserWithEmailAndPasswordAsync(email.text, password.text);

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


    private IEnumerator LoginUserAsync()
    {
        Debug.Log("Attempting to log in.");
        var loginTask = FirebaseAuth.DefaultInstance.SignInWithEmailAndPasswordAsync(email.text, password.text);

        yield return new WaitUntil(() => loginTask.IsCompleted);

        if (loginTask.IsCompleted)
        {
            Debug.Log("Login successful.");
        }
        else if (loginTask.IsFaulted)
        {
            Debug.LogWarning(loginTask.Exception);
        }
    }

    private IEnumerator SaveDataAsync(string data, string folder)
    {
        var userId = FirebaseAuth.DefaultInstance.CurrentUser.UserId;
        var saveTask = FirebaseDatabase.DefaultInstance.RootReference.Child(folder).Child(userId).SetRawJsonValueAsync(data);

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

    private IEnumerator LoadDataAsync()
    {
        var userId = FirebaseAuth.DefaultInstance.CurrentUser.UserId;

        var loadTask = FirebaseDatabase.DefaultInstance.RootReference.Child("users").Child(userId).GetValueAsync().ContinueWithOnMainThread(task =>
        {
            if (task.IsCompleted)
            {
                DataSnapshot snapshot = task.Result;
            }
            else if (task.IsFaulted)
            {
                Debug.LogError(task.Exception);
            }
        });

        yield return new WaitUntil(() => loadTask.IsCompleted);
        Debug.Log("Data loaded from Firebase.");
    }
}