using UnityEngine;

public class PlayerControllerTranslate : MonoBehaviour
{

    public float speed;
    

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame

    void Update()
    {

        float x = Input.GetAxis("Horizontal");
        float y = Input.GetAxis("Vertical");

        Vector3 movement = new Vector3(x, y, 0);

        if (movement.sqrMagnitude > 1)
            movement = movement.normalized;

        transform.Translate(movement * speed * Time.deltaTime);

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