using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BatteryState : MonoBehaviour {
    public List<GameObject> status;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        if(status.Count > 0){
            status[0].SetActive(true);
        }
        if(status.Count > 1)
        {
            status[0].SetActive(!(SystemInfo.batteryLevel > 0.1f));
            status[1].SetActive(SystemInfo.batteryLevel > 0.1f);
        }
        if(status.Count > 2)
        {
            status[0].SetActive(!(SystemInfo.batteryLevel > 0.4f));
            status[1].SetActive(!(SystemInfo.batteryLevel > 0.4f));
            status[2].SetActive(SystemInfo.batteryLevel > 0.4f);
        }
        if (status.Count > 3)
        {
            status[0].SetActive(!(SystemInfo.batteryLevel > 0.9f));
            status[1].SetActive(!(SystemInfo.batteryLevel > 0.9f));
            status[2].SetActive(!(SystemInfo.batteryLevel > 0.9f));
            status[3].SetActive(SystemInfo.batteryLevel > 0.9f);
        }

	}
}
