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
        StartCoroutine("RegisterUserAsync");
    }

    public void LoginUser()
    {
        StartCoroutine("LoginUserAsync");
    }

    // 


    private IEnumerator RegisterUserAsync()
    {
        Debug.Log("Starting Registration.");
        var registrationTask = FirebaseAuth.DefaultInstance.CreateUserWithEmailAndPasswordAsync(email.text, password.text);

        yield return new WaitUntil(() => registrationTask.IsCompleted);

        if (registrationTask.Exception is null)
            Debug.Log("Registration Complete.");
        else
            Debug.LogWarning(registrationTask.Exception);
    }


    private IEnumerator LoginUserAsync()
    {
        Debug.Log("Atempting to log in.");
        var loginTask = FirebaseAuth.DefaultInstance.SignInWithEmailAndPasswordAsync(email.text, password.text);

        yield return new WaitUntil(() => loginTask.IsCompleted);

        if (loginTask.Exception is null)
            Debug.Log("Login successful.");
        else
            Debug.LogWarning(loginTask.Exception);
    }

    private IEnumerator SaveDataAsync(string data)
    {
        var userId = FirebaseAuth.DefaultInstance.CurrentUser.UserId;
        var saveTask = FirebaseDatabase.DefaultInstance.RootReference.Child("users").Child(userId).SetRawJsonValueAsync(data);

        yield return new WaitUntil(() => saveTask.IsCompleted);

        if (saveTask.Exception is null)
            Debug.Log("Data saved in Firebase.");
        else
            Debug.LogWarning(saveTask.Exception);

    }

    private void GetDataAsync()
    {
        var userId = FirebaseAuth.DefaultInstance.CurrentUser.UserId;
        
        FirebaseDatabase.DefaultInstance.RootReference.Child("users").Child(userId).GetValueAsync().ContinueWithOnMainThread(task =>
        {
            if (task.Exception is null)
            {
                DataSnapshot snapshot = task.Result;
                //ParseJson(snapshot.GetRawJsonValue());
            }
            else
            {
                Debug.LogError(task.Exception);
            }

        });
    }


    public void ParseStringToJson()
    {
        //Get player info
        var players = FindObjectsOfType<PlayerMovement>();

        //Create holder object that contains multiple players
        var multiplePlayers = new MultiplePlayers();
        multiplePlayers.players = new PlayerInfo[players.Length];

        //put info in playerinfo class
        for (int i = 0; i < players.Length; i++)
        {
            multiplePlayers.players[i] = new PlayerInfo();
            multiplePlayers.players[i].Position = players[i].transform.position;
            multiplePlayers.players[i].Name = players[i].name;
        }

        //turn class into json 
        string jsonString = JsonUtility.ToJson(multiplePlayers);
    }



    //private void ParseJsonToString(string jsonString)
    //{
    //    //Convert our save data to a class
    //    var multiplePlayers = JsonUtility.FromJson<MultiplePlayers>(jsonString);

    //    //Find all players in the scene
    //    var players = FindObjectsOfType<PlayerMovement>();

    //    //Update Players.
    //    for (int i = 0; i < players.Length; i++)
    //    {
    //        players[i].name = multiplePlayers.players[i].Name;
    //        players[i].transform.position = multiplePlayers.players[i].Position;
    //    }

    //    //Tell our nametag manager to update our nametags.
    //    FindObjectOfType<NameTagManager>().UpdateNameTags();
    //}


}