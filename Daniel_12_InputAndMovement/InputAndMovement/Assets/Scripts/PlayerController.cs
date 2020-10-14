using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{

    public float speed;
    Rigidbody2D rg2d;
    Vector2 movement;

    // Start is called before the first frame update
    void Start()
    {
        rg2d = GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame

    void Update()
    {
        // Movement
        float x = Input.GetAxisRaw("Horizontal");
        float y = Input.GetAxisRaw("Vertical");

        movement = new Vector2(x, y);

        if (movement.sqrMagnitude > 1)
            movement = movement.normalized;

    }

    void FixedUpdate()
    {
        rg2d.velocity = movement * speed;
    }
}







//void Update()
//{
//    // Movement
//    float x = Input.GetAxisRaw("Horizontal");
//    float y = Input.GetAxisRaw("Vertical");

//    Vector2 movement = new Vector2(x, y);

//    if (movement.sqrMagnitude > 1)
//        movement = movement.normalized;

//    // RigidBody velocity är redan i meter per sekund, så det behövs inte DeltaTime på den.
//    rg2d.velocity = movement * speed;

//}








// Om något i spelet påverkar spelarens position, kommer detta funka ihop med att ersatta velocity?


// Add force to RigidBody

//void FixedUpdate()
//{
//    // Movement
//    float x = Input.GetAxisRaw("Horizontal");
//    float y = Input.GetAxisRaw("Vertical");

//    Vector3 movement = new Vector3(x, y, 0);

//    rg2d.AddForce(movement * speed);

//}




// Movement without rigidbody, gives us jittery/teleporty collisions.

//if (movement.sqrMagnitude > 1)
//    movement = movement.normalized;


//transform.Translate(movement * speed * Time.deltaTime);

//// Button Demo
//if (Input.GetButtonDown("Fire1"))
//{
//    Debug.Log("Button Fire1 pressed down!");
//}