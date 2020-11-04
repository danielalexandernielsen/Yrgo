using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class GameSceneManager : MonoBehaviour
{
	public static GameSceneManager instance;  //Singleton instance

	// public GameState currentState;  //State Machine state.

	void Start()
	{
		if (instance == null)
        {
			instance = this;	//Save our object so we can use it easily
			DontDestroyOnLoad(gameObject);
        }
		else
        {
			Destroy(gameObject);   //If we already have an instance, avoid creating another.
        }
	}

	public void ChangeScene(string name)
    {
		SceneManager.LoadScene(name);
    }

	public void ReloadCurrentScene()
	{
		SceneManager.LoadScene(SceneManager.GetActiveScene().name);
	}

	public void LoadNextScene()
    {
		int nextIndex = SceneManager.GetActiveScene().buildIndex + 1;
		nextIndex = nextIndex % SceneManager.sceneCount;
		SceneManager.LoadScene(nextIndex);
	}

	public void LoadPreviousScene()
	{
		int nextIndex = SceneManager.GetActiveScene().buildIndex - 1 + SceneManager.sceneCount;
		nextIndex = nextIndex % SceneManager.sceneCount;
		SceneManager.LoadScene(nextIndex);
	}

    private void Update()
    {
		if (Input.GetKeyDown(KeyCode.B))
        {
			GameSceneManager.instance.LoadPreviousScene();
        }

		if (Input.GetKeyDown(KeyCode.N))
		{
			GameSceneManager.instance.LoadNextScene();
		}
	}

}
