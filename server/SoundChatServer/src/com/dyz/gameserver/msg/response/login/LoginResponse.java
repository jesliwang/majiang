package com.dyz.gameserver.msg.response.login;

import com.context.ConnectAPI;
import com.dyz.gameserver.commons.message.ServerResponse;

public class LoginResponse extends ServerResponse{

	public LoginResponse(int status) {
		super(ConnectAPI.Chat_Login_Request);
		try {
			//output.writeBoolean(isSuccess);
			if(status > 0) {
			}
		} finally {
       	 output.close();
		}
	}

}
