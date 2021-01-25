using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{

    public float speed = 5;

    public void MovePlayer(Vector3 movement)
    {
        movement = movement.normalized;

        if (movement.sqrMagnitude > 0.01f)
        {
            transform.up = movement;
            transform.eulerAngles = new Vector3(0, 0, transform.eulerAngles.z);
        }

        movement.z = 0;
        transform.position += (movement * speed * Time.deltaTime);
    }


}
