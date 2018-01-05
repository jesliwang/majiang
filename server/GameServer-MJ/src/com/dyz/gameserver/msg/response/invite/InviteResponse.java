package com.dyz.gameserver.msg.response.invite;

import java.io.IOException;

import com.context.ConnectAPI;
import com.dyz.gameserver.commons.message.ServerResponse;
import com.dyz.gameserver.pojo.RoomVO;
import com.dyz.persist.util.JsonUtilTool;

public class InviteResponse extends ServerResponse {
	public InviteResponse(int status,String message) {
		super(status,ConnectAPI.INVITE_RESPONSE);
		try {
			output.writeUTF(message);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
       	 output.close();
		}
		//entireMsg();
	}
}
