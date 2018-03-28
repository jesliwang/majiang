using System;

namespace AssemblyCSharp
{
    public class TingpaiRequest : ClientRequest
    {

        public TingpaiRequest(string sendMsg)
        {
            headCode = APIS.TINGPAI_REQUEST;
            messageContent = sendMsg;
        }
    }
}

