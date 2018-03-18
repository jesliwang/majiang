using UnityEngine;
using UnityEngine.UI;
using System.Collections;
using AssemblyCSharp;
using UnityEngine.EventSystems;
using System.Collections.Generic;
using System;
using LitJson;

public class EnterRoomScript : MonoBehaviour{


	public Button button_sure,button_delete;//确认删除按钮

	private List<String> inputChars;//输入的字符
    //public List<Image> inputTexts;
    public List<Sprite> numberList;
    public List<Text> inputsWithText;

	public List<GameObject> btnList;

	// Use this for initialization
	void Start () {
		
		SocketEventHandle.getInstance().JoinRoomCallBack += onJoinRoomCallBack;
		inputChars = new List<String>();
		for (int i = 0; i < btnList.Count; i++) {
			GameObject gobj = btnList [i];
			btnList [i].GetComponent<Button> ().onClick.AddListener(delegate() {
				this.OnClickHandle(gobj); 
			});
		}

	}
	
	// Update is called once per frame
	void Update () {
	
	}

	public void OnClickHandle (GameObject gobj){
		//if(eventData.button)
		MyDebug.Log(gobj);
        clickNumber(gobj.name.Substring(7));
		//clickNumber (gobj.GetComponentInChildren<Text>().text);
	}



	private void clickNumber(string number){

		MyDebug.Log (number.ToString ());
		if (inputChars.Count >=6) {
			return;
		}
		inputChars.Add(number);

		int index = inputChars.Count;
        inputsWithText [index-1].text = number.ToString();
        //inputTexts[index - 1].enabled = true;
        //inputTexts[index - 1].sprite = numberList[int.Parse(number)];
        //inputTexts[index - 1].SetNativeSize();


        if(inputChars.Count == 6){
            String roomNumber = inputChars[0] + inputChars[1] + inputChars[2] + inputChars[3] + inputChars[4] + inputChars[5];
            MyDebug.Log(roomNumber);
            RoomJoinVo roomJoinVo = new RoomJoinVo();
            roomJoinVo.roomId = int.Parse(roomNumber);
            string sendMsg = JsonMapper.ToJson(roomJoinVo);
            CustomSocket.getInstance().sendMsg(new JoinRoomRequest(sendMsg));
        }
	}

	public void deleteNumber(){
		if (inputChars != null && inputChars.Count > 0) {
			inputChars.RemoveAt (inputChars.Count -1);
            inputsWithText [inputChars.Count].text = "";
            //inputTexts[inputChars.Count].sprite = null;
            //inputTexts[inputChars.Count].enabled = false;

		}
	}

	public void closeDialog(){
		MyDebug.Log ("closeDialog");
		//GlobalDataScript.homePanel.SetActive (false);
		removeListener ();
		Destroy (this);
		Destroy (gameObject);
	}

	private void removeListener(){
		SocketEventHandle.getInstance().JoinRoomCallBack -= onJoinRoomCallBack;
	}

	public void ResetInputNumber(){
		
        inputChars.Clear();
        for (int i = 0; i < 6; i++)
        {
            inputsWithText[i].text = "";
            //inputTexts[i].sprite = null;
            //inputTexts[i].enabled = false;
        }
	}

	public void onJoinRoomCallBack(ClientResponse response){
		MyDebug.Log (response);

		if (response.status == 1) {
            GlobalDataScript.reEnterRoomData = null;

			GlobalDataScript.roomJoinResponseData = JsonMapper.ToObject<RoomJoinResponseVo> (response.message);
			GlobalDataScript.roomVo.addWordCard = GlobalDataScript.roomJoinResponseData.addWordCard;
			GlobalDataScript.roomVo.hong = GlobalDataScript.roomJoinResponseData.hong;
			GlobalDataScript.roomVo.ma = GlobalDataScript.roomJoinResponseData.ma;
			GlobalDataScript.roomVo.name = GlobalDataScript.roomJoinResponseData.name;
			GlobalDataScript.roomVo.roomId = GlobalDataScript.roomJoinResponseData.roomId;
			GlobalDataScript.roomVo.roomType = GlobalDataScript.roomJoinResponseData.roomType;
			GlobalDataScript.roomVo.roundNumber = GlobalDataScript.roomJoinResponseData.roundNumber;
			GlobalDataScript.roomVo.sevenDouble = GlobalDataScript.roomJoinResponseData.sevenDouble;
			GlobalDataScript.roomVo.xiaYu = GlobalDataScript.roomJoinResponseData.xiaYu;
			GlobalDataScript.roomVo.ziMo = GlobalDataScript.roomJoinResponseData.ziMo;
			GlobalDataScript.roomVo.magnification = GlobalDataScript.roomJoinResponseData.magnification;
			GlobalDataScript.surplusTimes = GlobalDataScript.roomJoinResponseData.roundNumber;
			GlobalDataScript.loginResponseData.roomId = GlobalDataScript.roomJoinResponseData.roomId;
			//loadPerfab("Prefab/Panel_GamePlay");
			GlobalDataScript.gamePlayPanel = PrefabManage.loadPerfab ("Prefab/Panel_GamePlay");
			GlobalDataScript.gamePlayPanel.GetComponent<MyMahjongScript> ().joinToRoom (GlobalDataScript.roomJoinResponseData.playerList);
			closeDialog ();
		} else {
			TipsManagerScript.getInstance ().setTips (response.message);
		}

	}

	private void  loadPerfab(string perfabName){
		GameObject panelCreateDialog = Instantiate (Resources.Load(perfabName)) as GameObject;
		panelCreateDialog.transform.parent = GlobalDataScript.getInstance ().canvsTransfrom;;
		panelCreateDialog.transform.localScale = Vector3.one;
		//panelCreateDialog.transform.localPosition = new Vector3 (200f,150f);
		panelCreateDialog.GetComponent<RectTransform>().offsetMax = new Vector2(0f, 0f);
		panelCreateDialog.GetComponent<RectTransform>().offsetMin = new Vector2(0f, 0f);
		panelCreateDialog.GetComponent<MyMahjongScript> ().joinToRoom (GlobalDataScript.roomJoinResponseData.playerList);
	}
}
