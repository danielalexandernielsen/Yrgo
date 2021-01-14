using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerPlatformController : MonoBehaviour
{
    public float speed = 5;
    public float jumpPower = 10;
    bool grounded = false;
    bool jump = false;

    Animator animator;
    SpriteRenderer spriteRenderer;

    Rigidbody2D rb2d;
    Vector2 movement = new Vector2();

    // Start is called before the first frame update
    void Start()
    {
        rb2d = GetComponent<Rigidbody2D>();
        animator = GetComponent<Animator>();
        spriteRenderer = GetComponent<SpriteRenderer>();
    }

    // Update is called once per frame
    void Update()
    {
        //Movement
        float x = Input.GetAxis("Horizontal");

        movement = new Vector2(x * speed, rb2d.velocity.y);
        animator.SetFloat("Fall", rb2d.velocity.y);

        animator.SetFloat("Speed", Mathf.Abs(x));

        if (x < 0)
        {
            spriteRenderer.flipX = true;
        }
        else if (x > 0)
        {
            spriteRenderer.flipX = false;
        }

        //Jump with impulse
        if (Input.GetButtonDown("Jump") && grounded)
        {
            jump = true;            
        }

    }

    //Update is called every physics interval (0.02s) before physics
    private void FixedUpdate()
    {
        rb2d.velocity = movement;

        if (jump)
        {
            animator.SetTrigger("Jump");

            rb2d.AddForce(Vector2.up * jumpPower, ForceMode2D.Impulse);
            jump = false;
        }

    }


    // Dessa nedanför borde checka vad för collision som kommer in, tex att det är marken. 
    private void OnTriggerEnter2D(Collider2D collision)
    {
        grounded = true;
        animator.SetTrigger("Landed");
    }

    private void OnTriggerExit2D(Collider2D collision)
    {
        grounded = false;
    }


    private void OnTriggerStay2D(Collider2D collision)
    {
        grounded = true;
    }
}