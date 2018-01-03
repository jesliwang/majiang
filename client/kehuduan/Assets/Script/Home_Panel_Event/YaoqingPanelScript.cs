using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class YaoqingPanelScript : MonoBehaviour {

    public InputField Code;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		

	}

    public void CloseBtn()
    {
        Destroy(this);
        Destroy(gameObject);
    }

    public void BangdingCode()
    {
        
    }
}
