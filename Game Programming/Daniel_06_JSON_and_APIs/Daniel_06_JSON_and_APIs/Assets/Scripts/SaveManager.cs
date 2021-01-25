using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SaveManager : MonoBehaviour
{

    public GameObject playerOne;
    public GameObject playerTwo;

    // Start is called before the first frame update
    void Start()
    {
        LoadData();
        LoadNames();
    }

    public void SaveData()
    {
        Debug.Log("Saving");

        PlayerPrefs.SetFloat("p1-pos-x", playerOne.transform.position.x);
        PlayerPrefs.SetFloat("p1-pos-y", playerOne.transform.position.y);

        PlayerPrefs.SetFloat("p2-pos-x", playerTwo.transform.position.x);
        PlayerPrefs.SetFloat("p2-pos-y", playerTwo.transform.position.y);
    }

    public void LoadData()
    {
        Debug.Log("Loading");

        Vector3 pos = Vector3.zero;

        pos.x = PlayerPrefs.GetFloat("p1-pos-x");
        pos.y = PlayerPrefs.GetFloat("p1-pos-y");
        playerOne.transform.position = pos;

        pos.x = PlayerPrefs.GetFloat("p2-pos-x");
        pos.y = PlayerPrefs.GetFloat("p2-pos-y");
        playerTwo.transform.position = pos;
    }

    public void LoadNames()
    {
        var nameTagManager = GetComponent<NameTagManager>();

        for (int i = 0; i < nameTagManager.nameTags.Length; i++)
        {
            nameTagManager.GetComponent<Text>().text = PlayerPrefs.GetString("p" + (i+1) + "-name");
        }
    }

}
