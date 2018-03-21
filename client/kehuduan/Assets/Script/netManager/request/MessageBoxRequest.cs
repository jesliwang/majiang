using System;

namespace AssemblyCSharp
{
    // data format
    // type | codeindex | uuid | sex
    // type 0: 语音
    // type 1: 表情
	public class MessageBoxRequest : ClientRequest
	{
		public MessageBoxRequest (int type, int codeIndex,int uuid, int sex)
		{
			headCode = APIS.MessageBox_Request;
			messageContent = type + "|" + codeIndex + "|"+uuid + "|" + sex;
		}
	}
}

