using UnityEngine;
using Firebase;
using Firebase.Extensions;
using Firebase.Database;
using System.Collections;
using Firebase.Auth;
using TMPro;

public class FirebaseDBConnection : MonoBehaviour
{
    [SerializeField]
    private TMP_InputField email;

    [SerializeField]
    private TMP_InputField password;


    void Start()
    {
        FirebaseApp.CheckAndFixDependenciesAsync().ContinueWithOnMainThread(task =>
        {
            if (task.Exception != null)
            {
                Debug.LogError(task.Exception);
            }
        });
    }

    public void RegisterUser()
    {
        StartCoroutine("IERegisterUser");
    }

    public void LoginUser()
    {
        StartCoroutine("IELoginUser");
    }


    private IEnumerator IERegisterUser()
    {
        Debug.Log("Starting Registration.");
        var authentication = FirebaseAuth.DefaultInstance;
        var registrationTask = authentication.CreateUserWithEmailAndPasswordAsync(email.text, password.text);
        yield return new WaitUntil(() => registrationTask.IsCompleted);

        if (registrationTask.Exception is null)
            Debug.Log("Registration Complete.");
        else
            Debug.LogWarning(registrationTask.Exception);
    }


    private IEnumerator IELoginUser()
    {
        Debug.Log("Atempting to log in.");
        var authentication = FirebaseAuth.DefaultInstance;
        var loginTask = authentication.SignInWithEmailAndPasswordAsync(email.text, password.text);

        yield return new WaitUntil(() => loginTask.IsCompleted);

        if (loginTask.Exception is null)
            Debug.Log("Login successful.");
        else
            Debug.LogWarning(loginTask.Exception);

        StartCoroutine(DataTest(FirebaseAuth.DefaultInstance.CurrentUser.UserId, "TestWrite1"));
    }

    private IEnumerator DataTest(string userID, string data)
    {
        Debug.Log("Trying to write data");
        var database = FirebaseDatabase.DefaultInstance;
        var dataTask = database.RootReference.Child("users").Child(userID).SetValueAsync(data);

        yield return new WaitUntil(() => dataTask.IsCompleted);

        if (dataTask.Exception is null)
            Debug.Log("DataTestWrite: Complete"); 
        else
            Debug.LogWarning(dataTask.Exception);
    }
}