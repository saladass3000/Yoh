using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    public static PlayerController instance;

    public float moveSpeed;
    private float fixedspeed;
    public float jumpForce;
    public float gravityScale = 5f;
    //public Joystick joystick;

    private Vector3 moveDirection;
    public CharacterController charCont;

    private Camera cam;
    public GameObject playerModel;
    public float rotateSpeed = 5f;

    public Animator anim;

    public bool isAttacking;
    private float attackCounter;
    public float Attacktimmer;

    public bool isKnocking;
    public float knockbackLength = .5f;
    private float knockbackCounter;
    public Vector2 knockbackPower;

    public GameObject[] playerPieces;

    private void Awake()
    {
        instance = this;
    }
    // Start is called before the first frame update
    void Start()
    {
        cam = Camera.main;
        fixedspeed = moveSpeed;
    }

    // Update is called once per frame
    void Update()
    {
        if (!isKnocking)
        {
            float yStore = moveDirection.y;
            //moveDirection = new Vector3(Input.GetAxisRaw("Horizontal"), 0f, Input.GetAxisRaw("Vertical"));
            moveDirection = (transform.right * Input.GetAxisRaw("Horizontal"));
           // moveDirection = (transform.forward * joystick.Vertical) + (transform.right * joystick.Horizontal);
            moveDirection.Normalize();
            moveDirection = moveDirection * fixedspeed;
            moveDirection.y = yStore;

            if (charCont.isGrounded)
            {
                moveDirection.y = 0f;

                if (Input.GetKeyDown(KeyCode.Space))
                {
                    moveDirection.y = jumpForce;
                }
                if (Input.GetKeyDown(KeyCode.J))
                {
                    StartCoroutine("Attackings");
                }

            }

            moveDirection.y += Physics.gravity.y * gravityScale * Time.deltaTime;
            //transform.position = transform.position + (moveDirection * Time.deltaTime * moveSpeed);

            charCont.Move(moveDirection * Time.deltaTime);

            if (Input.GetAxisRaw("Horizontal") != 0 || Input.GetAxisRaw("Vertical") != 0)
               // if (joystick.Horizontal != 0 || joystick.Vertical != 0)
                {
                transform.rotation = Quaternion.Euler(0f, cam.transform.rotation.eulerAngles.y, 0f);
                Quaternion newRotation = Quaternion.LookRotation(new Vector3(moveDirection.x, 0f, moveDirection.z));
                // playerModel.transform.rotation = newRotation;
                playerModel.transform.rotation = Quaternion.Slerp(playerModel.transform.rotation, newRotation, rotateSpeed * Time.deltaTime);

            }
        }
        if (isKnocking)
        {
            knockbackCounter -= Time.deltaTime;

            float yStore = moveDirection.y;
            moveDirection = playerModel.transform.forward * -knockbackPower.x;
            moveDirection.y = yStore;
            moveDirection.y += Physics.gravity.y * gravityScale * Time.deltaTime;

            if (charCont.isGrounded)
            {
                moveDirection.y = 0f;

            }

            charCont.Move(moveDirection * Time.deltaTime);

            if (knockbackCounter <= 0)
            {
                isKnocking = false;
            }
        }

        anim.SetFloat("Speed", Mathf.Abs( moveDirection.x) + Mathf.Abs(moveDirection.z));
        anim.SetBool("Grounded", charCont.isGrounded);
    }

    public void Knockback()
    {
        isKnocking = true;
        knockbackCounter = knockbackLength;
        moveDirection.y = knockbackPower.y;
        charCont.Move(moveDirection * Time.deltaTime);
    }
    public void stopAttacking()
    {
        fixedspeed = moveSpeed;
    }
    IEnumerator Attackings()
    {
        anim.SetTrigger("Attacking");
        fixedspeed = 0.1f;
        yield return new WaitForSeconds(0.5f);
        fixedspeed = moveSpeed;
    }
}
