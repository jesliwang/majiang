package com.dyz.gameserver.msg.response.invite;

import java.io.IOException;

import com.context.ConnectAPI;
import com.dyz.gameserver.commons.message.ServerResponse;
import com.dyz.gameserver.pojo.AvatarVO;
import com.dyz.persist.util.JsonUtilTool;

public class InviteGetRewardResponse extends ServerResponse {
	public InviteGetRewardResponse(int status, AvatarVO avatarVO ) {
		super(status,ConnectAPI.INVITE_GET_REWARD_RESPONSE);
		try {
			if(status > 0) {
				output.writeUTF(JsonUtilTool.toJson(avatarVO));
			}
			//entireMsg();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
       	 output.close();
		}
	}
}
