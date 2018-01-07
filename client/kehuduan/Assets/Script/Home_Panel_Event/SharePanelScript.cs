using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using AssemblyCSharp;
using LitJson;
using UnityEngine;
using UnityEngine.UI;

public class SharePanelScript : MonoBehaviour {

    public GameObject ShareTypePanel;

    public GameObject HistoryPanel;

    public GameObject InviteItemPrefab;

    public RectTransform HistoryRect;

    public Text Info;

    public Text detalInfo;

	// Use this for initialization
	void Start () {
        ShareTypePanel.SetActive(false);
        UpdateInfo();

        SocketEventHandle.getInstance().inviteGetRewardResponse += InviteGetRewardCallBack;
        SocketEventHandle.getInstance().inviteHistoryResponse += ShowHistory;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void CloseDialog()
    {
        SocketEventHandle.getInstance().inviteGetRewardResponse -= InviteGetRewardCallBack;
        SocketEventHandle.getInstance().inviteHistoryResponse -= ShowHistory;
        Destroy(this);
        Destroy(gameObject);
    }

    void InviteGetRewardCallBack(ClientResponse response)
    {
        if(response.status > 0)
        {
            GlobalDataScript.loginResponseData = JsonMapper.ToObject<AvatarVO>(response.message);
            UpdateInfo();
            TipsManagerScript.getInstance().setTips("奖励领取成功");
        }
        else
        {
            TipsManagerScript.getInstance().setTips("奖励已经领取完毕");
        }
    }

    public void GetReward()
    {
        CustomSocket.getInstance().sendMsg(new InviteGetRewardRequest());
    }

    public void Share()
    {
        ShareTypePanel.SetActive(true);
    }

    public void RequestHistory()
    {
        CustomSocket.getInstance().sendMsg(new InviteHistoryRequest());
    }

    private List<GameObject> historyItems = new List<GameObject>();
    void ShowHistory(ClientResponse response)
    {

        InviteItemList Redata = JsonMapper.ToObject<InviteItemList>(response.message);
        List<InviteItemVO> data = Redata.history;

        int monthTotal = 0;
        int weekTotal = 0;
        int dayTotal = 0;
        DateTime now = DateTime.Now;
        for (int i = 0; i < data.Count; i++)
        {
            GameObject go = Instantiate(InviteItemPrefab);
            go.transform.parent = HistoryRect;
            go.GetComponent<InviteHistoryItem>().SetData(data[i]);
            go.transform.localScale = Vector3.one;
            go.GetComponent<RectTransform>().anchoredPosition3D = new Vector3(0, 19 - 54 * i, 0);
            historyItems.Add(go);

            DateTime dt = Convert.ToDateTime(data[i].inviteTime);
            if(now.Year == dt.Year)
            {
                if(now.Month == dt.Month){
                    monthTotal += 1;
                    if(now.Day == dt.Day){
                        dayTotal += 1;
                    }
                }

            }

            if(GetWeekOfYear(now) == GetWeekOfYear(dt))
            {
                weekTotal += 1;
            }
        }
        detalInfo.text = string.Format("累计成功邀请{0}人，本月成功邀请{1}人，本周成功邀请{2}人，本日成功邀请{3}人.", data.Count, monthTotal, weekTotal, dayTotal);
            HistoryPanel.SetActive(true);
       
    }

    private static int GetWeekOfYear(DateTime dt)
    {
        GregorianCalendar gc = new GregorianCalendar();
        int weekOfYear = gc.GetWeekOfYear(dt, CalendarWeekRule.FirstDay, DayOfWeek.Monday);
        return weekOfYear;
    }

    public void HideHistory()
    {
        HistoryPanel.SetActive(false);
        for (int i = 0; i < historyItems.Count; i++)
        {
            Destroy(historyItems[i]);
        }
        historyItems.Clear();


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
