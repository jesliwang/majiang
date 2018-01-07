using System;

namespace AssemblyCSharp
{
    public class InviteHistoryRequest : ClientRequest
    {
        public InviteHistoryRequest()
        {
            headCode = APIS.INVITE_HISTORY_REQUEST;
            messageContent = "get reward";
        }
    }
}
