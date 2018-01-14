using System;

namespace AssemblyCSharp
{
	public class HeadRequest : ClientRequest
	{
		public HeadRequest ()
		{
			headCode = APIS.head;
            DateTime d2 = new DateTime(2018, 1, 1); 
            long d=  (int)DateTime.Now.Subtract(d2).TotalMilliseconds;
            messageContent = d.ToString();

		}
			
	}
}

