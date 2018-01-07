using System;

namespace AssemblyCSharp
{
    public class InviteGetRewardRequest : ClientRequest
    {
        public InviteGetRewardRequest()
        {
            headCode = APIS.INVITE_GET_REWARD_REQUEST;
            messageContent = "get reward";
        }
    }
}
