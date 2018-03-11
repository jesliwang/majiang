package com.dyz.gameserver.msg.response.startgame;

import java.io.IOException;
import java.util.logging.Logger;

import com.context.ConnectAPI;
import com.dyz.gameserver.commons.message.ServerResponse;
import com.dyz.gameserver.pojo.RoomVO;
import com.dyz.persist.util.JsonUtilTool;

public class StartPrepareGameResponse extends ServerResponse {
	/**
	 *
	 * @param status
	 * @param  avatarIndex 准备人的索引
    */
	public StartPrepareGameResponse(int status, RoomVO roomV0) {
		super(status, ConnectAPI.START_PREPARE_GAME_RESPONSE);
		
		try {
			if(status>0){
					output.writeUTF(JsonUtilTool.toJson(roomV0));
					//System.out.println(JsonUtilTool.toJson(roomVO));
			}
			else{
				output.writeUTF(roomV0.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
       	 output.close();
		}
		//entireMsg();
	}
}
