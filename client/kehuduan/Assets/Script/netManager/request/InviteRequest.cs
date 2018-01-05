using UnityEngine;
using System.Collections;

namespace AssemblyCSharp
{
    public class InviteRequest : ClientRequest
    {
        public InviteRequest(string sendMsg)
        {
            headCode = APIS.INVITE_REQUEST;
            messageContent = sendMsg;
        }
    }
}
