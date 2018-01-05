using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SharePanelScript : MonoBehaviour {

    public GameObject ShareTypePanel;

    public Text Info;

	// Use this for initialization
	void Start () {
        ShareTypePanel.SetActive(false);
        UpdateInfo();
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

    private void UpdateInfo()
    {
        Info.text = string.Format("累计邀请获得房卡<color=#00ff00>{0,3}</color>张，待领取房卡<color=#00ff00>{1,3}</color>张", GlobalDataScript.loginResponseData.account.invitegettedreward, GlobalDataScript.loginResponseData.account.invitereward - GlobalDataScript.loginResponseData.account.invitegettedreward);   
    }
}
