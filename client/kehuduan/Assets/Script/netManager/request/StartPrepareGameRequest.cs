using System;

namespace AssemblyCSharp
{
    public class StartPrepareGameRequest : ClientRequest
    {
        public StartPrepareGameRequest(string sendMsg)
        {
            headCode = APIS.START_PREPARE_GAME_REQUEST;
            messageContent = sendMsg;
        }
    }
}
