package com.dyz.gameserver.msg.response.invite;

import java.io.IOException;
import java.util.List;

import net.sf.json.JSONArray;

import com.context.ConnectAPI;
import com.dyz.gameserver.commons.message.ServerResponse;
import com.dyz.gameserver.pojo.InviteItemVO;
import com.dyz.persist.util.JsonUtilTool;

public class InviteHistoryResponse extends ServerResponse {
	public InviteHistoryResponse(int status,String history) {
		super(status,ConnectAPI.INVITE_HISTORY_RESPONSE);
		try {
			
			//System.out.print(history);
			output.writeUTF(history);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
       	 output.close();
		}
		//entireMsg();
	}
}
