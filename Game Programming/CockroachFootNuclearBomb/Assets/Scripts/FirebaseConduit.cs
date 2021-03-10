using UnityEngine;
using Firebase;
using Firebase.Extensions;


public class FirebaseConduit : MonoBehaviour
{

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

}
