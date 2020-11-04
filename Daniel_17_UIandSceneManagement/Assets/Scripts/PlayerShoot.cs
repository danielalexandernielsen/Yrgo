using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class PlayerShoot : MonoBehaviour
{

    public Text bulletText;
    public TextMeshProUGUI bulletTMPText;
    public GameObject bullet;
    public GameObject gun;

    int numberOfBullets = 0;

    // Update is called once per frame
    void Update()
    {
        if (Input.GetButtonDown("Fire1"))
        {
            GameObject newBullet = Instantiate(bullet, gun.transform.position, gun.transform.rotation);
            newBullet.GetComponent<Rigidbody2D>().velocity = gun.transform.right * 10;

            numberOfBullets++;
            bulletText.text = "Bullets fired: " + numberOfBullets;
            bulletTMPText.text = "Bullets fired: " + numberOfBullets;
        }


        if (Input.GetKeyDown(KeyCode.M))
        {
            GameSceneManager.instance.ChangeScene("Menu");
        }
    }
}
