using System;
using System.IO;
using System.Net;
using System.Text;
using UnityEngine;
using UnityEngine.UI;


[Serializable]
public class MultiplePlayers
{
    public PlayerInfo[] players;
}


[Serializable]
public class PlayerInfo
{
    public string Name;
    public Vector3 Position;
}

public class SaveManager : MonoBehaviour
{
    public GameObject playerOne;
    public GameObject playerTwo;

    // Start is called before the first frame update
    void Start()
    {
        //SaveData();
        LoadData();
        LoadNames();
    }

    public void SaveData()
    {
        Debug.Log("Saving");

        var players = FindObjectsOfType<PlayerMovement>();
        var multiplePlayers = new MultiplePlayers();
        multiplePlayers.players = new PlayerInfo[players.Length];

        var playerInfos = new PlayerInfo[players.Length];

        for (int i = 0; i < players.Length; i++)
        {
            multiplePlayers.players[i] = new PlayerInfo();
            multiplePlayers.players[i].Position = players[i].transform.position;
            multiplePlayers.players[i].Name = players[i].name;
        }


        string jsonString = JsonUtility.ToJson(multiplePlayers);

        //PlayerPrefs.SetString("json", jsonString);
        //SaveToFile("CarGameSaveFile", jsonString); //Lägger i sig Unity-projekt roten
        SaveOnline("CarGameSaveFile", jsonString);
    }

    public void LoadData()
    {
        Debug.Log("Loading");

        //string jsonString = PlayerPrefs.GetString("json");
        //string jsonString = Load("CarGameSaveFile");
        string jsonString = LoadOnline("CarGameSaveFile");

        var mutiplePlayers = JsonUtility.FromJson<MultiplePlayers>(jsonString);

        var players = FindObjectsOfType<PlayerMovement>();

        for (int i = 0; i < players.Length; i++)
        {
            players[i].name = mutiplePlayers.players[i].Name;
            players[i].transform.position = mutiplePlayers.players[i].Position;
        }


    }

    public void LoadNames()
    {
        //var nameTagManager = GetComponent<NameTagManager>();

        //for (int i = 0; i < nameTagManager.nameTags.Length; i++)
        //{
        //    nameTagManager.GetComponent<Text>().text = PlayerPrefs.GetString("p" + (i+1) + "-name");
        //}
    }


    public void SaveToFile(string fileName, string jsonString)
    {
        // Open a file in write mode. This will create the file if it's missing.
        // It is assumed that the path already exists.
        using (var stream = File.OpenWrite(Application.persistentDataPath + "\\" + fileName))
        {
            // Truncate the file if it exists (we want to overwrite the file)
            stream.SetLength(0);

            // Convert the string into bytes. Assume that the character-encoding is UTF8.
            // Do you not know what encoding you have? Then you have UTF-8
            var bytes = Encoding.UTF8.GetBytes(jsonString);

            // Write the bytes to the hard-drive
            stream.Write(bytes, 0, bytes.Length);

            // The "using" statement will automatically close the stream after we leave
            // the scope - this is VERY important
        }
    }

    public string Load(string fileName)
    {
        // Open a stream for the supplied file name as a text file
        using (var stream = File.OpenText(Application.persistentDataPath + "\\" + fileName))
        {
            // Read the entire file and return the result. This assumes that we've written the
            // file in UTF-8
            return stream.ReadToEnd();
        }
    }





    public string LoadOnline(string name)
    {
        var request = (HttpWebRequest)WebRequest.Create("http://localhost:8080/" + name);
        var response = (HttpWebResponse)request.GetResponse();

        // Open a stream to the server so we can read the response data it sent back from our GET request
        using (var stream = response.GetResponseStream())
        {
            using (var reader = new StreamReader(stream))
            {
                // Read the entire body as a string
                var body = reader.ReadToEnd();

                return body;
            }
        }
    }

    //Saves the playerInfo string on the server.
    public void SaveOnline(string fileName, string saveData)
    {
        //url
        var request = (HttpWebRequest)WebRequest.Create("http://localhost:8080/" + fileName);
        request.ContentType = "application/json";
        request.Method = "PUT";

        using (var streamWriter = new StreamWriter(request.GetRequestStream()))
        {
            streamWriter.Write(saveData);
            streamWriter.Close();
        }

        var httpResponse = (HttpWebResponse)request.GetResponse();
        using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
        {
            var result = streamReader.ReadToEnd();
            Debug.Log(result);
        }
    }

}