using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HurtPlayer : MonoBehaviour
{
    public int returnTime;
    public int speed;
    void Start()
    {

        StartCoroutine("Move");
    }

    // Update is called once per frame
    void Update()
    {   
        transform.Translate(Vector3.forward * speed * Time.deltaTime);
    }

    IEnumerator Move()
    {
        while (true)
        {
            yield return new WaitForSeconds(returnTime);
            transform.eulerAngles += new Vector3(0, 180f, 0);
        }
    }
        private void OnTriggerEnter(Collider other)
    {
        if(other.tag == "Player")
        {
            //SfxManager.instance.DamageSfx();
            HealthManager.instance.Hurt();
        }
    }

}
