using System;
using LitJson;
using System.Collections;

namespace AssemblyCSharp
{
	public class LoginRequest:ClientRequest
	{
		
		public LoginRequest (string data)
		{
			headCode = APIS.LOGIN_REQUEST;
			
			LoginVo loginvo = new LoginVo ();
			if (data != null) {
                MyDebug.Log (data);
				try {
                    LitJson.JsonData dataJson = JsonMapper.ToObject<JsonData>(data);

                    loginvo.openId = (string)dataJson ["openid"];
                    loginvo.nickName = (string)dataJson ["nickname"];
                    loginvo.headIcon = (string)dataJson ["headimgurl"];
                    loginvo.unionid = (string)dataJson ["unionid"];
                    loginvo.province = (string)dataJson ["province"];
                    loginvo.city = (string)dataJson ["city"];
                    string sex = dataJson ["sex"].ToString();
					loginvo.sex = int.Parse(sex);
					loginvo.IP = GlobalDataScript.getInstance().getIpAddress();
				} catch (Exception e) {
					MyDebug.Log ("微信接口有变动！" + e.Message);
					TipsManagerScript.getInstance ().setTips ("请先打开你的微信客户端");
					return;
				}
			} else {

			}

			MyDebug.Log ("loginvo.IP" + loginvo.IP);

			if (data == null) {
				//LoginVo loginvo = new LoginVo ();
				Random ran = new Random();
				string str = ran.Next (100, 1000) + "for" + ran.Next (2000, 5000);
				loginvo.openId = "1272" ;


				loginvo.nickName = "127";
				loginvo.headIcon = "imgicon";
				loginvo.unionid = "127";
				loginvo.province = "21sfsd";
				loginvo.city = "afafsdf";
				loginvo.sex = 1;
				loginvo.IP = GlobalDataScript.getInstance().getIpAddress();
				data = JsonMapper.ToJson (loginvo);

				GlobalDataScript.loginVo = loginvo;
				GlobalDataScript.loginResponseData = new AvatarVO ();
				GlobalDataScript.loginResponseData.account = new Account ();
				GlobalDataScript.loginResponseData.account.city = loginvo.city;
				GlobalDataScript.loginResponseData.account.openid = loginvo.openId;
				GlobalDataScript.loginResponseData.account.nickname = loginvo.nickName;
				GlobalDataScript.loginResponseData.account.headicon = loginvo.headIcon;
				GlobalDataScript.loginResponseData.account.unionid = loginvo.city;
				GlobalDataScript.loginResponseData.account.sex = loginvo.sex;
				GlobalDataScript.loginResponseData.IP = loginvo.IP;
			}
			messageContent = data;

		}

		/**用于重新登录使用**/


		//退出登录
		public LoginRequest (){
			headCode = APIS.QUITE_LOGIN;
			if (GlobalDataScript.loginResponseData != null) {
				messageContent = GlobalDataScript.loginResponseData.account.uuid + "";
			}

		}


	}
}

