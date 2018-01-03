using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SharePanelScript : MonoBehaviour {

    public GameObject ShareTypePanel;

	// Use this for initialization
	void Start () {
        ShareTypePanel.SetActive(false);
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void CloseDialog()
    {
        Destroy(this);
        Destroy(gameObject);
    }

    public void GetReward()
    {
        
    }

    public void Share()
    {
        ShareTypePanel.SetActive(true);
    }

    public void RequestHistory()
    {
        
    }

    public void ShareToFriends()
    {
        GlobalDataScript.getInstance().wechatOperate.ShareGames(cn.sharesdk.unity3d.PlatformType.WeChat);
        ShareTypePanel.SetActive(false);
    }

    public void ShareToCircle()
    {
        GlobalDataScript.getInstance().wechatOperate.ShareGames(cn.sharesdk.unity3d.PlatformType.WeChatMoments);
        ShareTypePanel.SetActive(false);
    }
}
