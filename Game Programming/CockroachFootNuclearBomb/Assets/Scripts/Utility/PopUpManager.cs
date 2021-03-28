using TMPro;
using UnityEngine;

public class PopUpManager : MonoBehaviour
{

    public static void ClosePopUp(string dialog)
    {
        GameObject.Find(dialog).transform.GetChild(0).gameObject.SetActive(false);
    }

    public static void DisplayPopUp(string dialog, string textbox, string message)
    {
        GameObject.Find(dialog).transform.GetChild(0).gameObject.SetActive(true);
        GameObject.Find("PopUpText").GetComponent<TMP_Text>().text = message;
    }
}