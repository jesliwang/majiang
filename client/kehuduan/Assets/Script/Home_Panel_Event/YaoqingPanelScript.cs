using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

namespace AssemblyCSharp
{
    public class YaoqingPanelScript : MonoBehaviour
    {

        public InputField Code;

        // Use this for initialization
        void Start()
        {
            SocketEventHandle.getInstance().inviteResponse += InviteCalback;
        }

        // Update is called once per frame
        void Update()
        {


        }

        public void CloseBtn()
        {
            SocketEventHandle.getInstance().inviteResponse -= InviteCalback;

            Destroy(this);
            Destroy(gameObject);
        }

        public void BangdingCode()
        {
            if (Code.text.Trim() == "")
            {
                TipsManagerScript.getInstance().setTips("邀请码不能为空");
            }
            else
            {
                InviteUUID inv = new InviteUUID();
                int uuid = 0;
                if(int.TryParse(Code.text.Trim(), out uuid))
                {
                    inv.uuid = uuid;
                    CustomSocket.getInstance().sendMsg(new InviteRequest(JsonUtility.ToJson(inv)));
                }
                else
                {
                    TipsManagerScript.getInstance().setTips("邀请码错误");
                }
            }
        }

        private void InviteCalback(ClientResponse response)
        {
            if(response.status == 1){
                TipsManagerScript.getInstance().setTips(response.message);
                CloseBtn();
            }
            else{
                TipsManagerScript.getInstance().setTips(response.message);
            }

        }
    }
}