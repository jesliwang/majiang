using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MessagePanelScript : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void CloseDialog()
    {
        Destroy(this);
        Destroy(gameObject);
    }
}
