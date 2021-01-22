using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMouse : MonoBehaviour
{

    PlayerMovement pm;

    // Start is called before the first frame update
    void Start()
    {
        pm = GetComponent<PlayerMovement>();
    }

    // Update is called once per frame
    void Update()
    {

        Vector3 move = Vector3.zero;

        if (Input.GetMouseButton(0))
        {
            Vector3 mouse = Input.mousePosition;
            move = mouse - Camera.main.WorldToScreenPoint(transform.position);
        }

        pm.MovePlayer(move);
    }
}
