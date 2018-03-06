using System;

namespace AssemblyCSharp
{
	public class MessageBoxRequest : ClientRequest
	{
		public MessageBoxRequest (int codeIndex,int uuid, int sex)
		{
			headCode = APIS.MessageBox_Request;
			messageContent = codeIndex + "|"+uuid;
		}
	}
}

