using TMPro;
using UnityEngine;

public class RefreshGames : MonoBehaviour
{

    [SerializeField]
    private TMP_Dropdown dropdownOfGames;


    public void ListGames()
    {
        dropdownOfGames.options.Clear();

        foreach (var game in DataSingleton.Instance.data.gameDataList.games)
        {
            dropdownOfGames.options.Add(new TMP_Dropdown.OptionData() { text = game.title });
        }
    }

}
