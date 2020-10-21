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