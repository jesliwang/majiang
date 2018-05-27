package com.dyz.gameserver.msg.response.ting;

import java.io.IOException;

import net.sf.json.JSONObject;

import com.context.ConnectAPI;
import com.dyz.gameserver.commons.message.ServerResponse;

public class TingResponse extends ServerResponse {
	public TingResponse(int status, int AvatarId, int curPoint) {
        super(status, ConnectAPI.TINGPAI_RESPONE);
        try {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("avatarId",AvatarId);
            jsonObject.put("curPoint", curPoint);
            output.writeUTF(jsonObject.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
