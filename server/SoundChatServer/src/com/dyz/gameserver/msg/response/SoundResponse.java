package com.dyz.gameserver.msg.response;

import com.context.ConnectAPI;
import com.dyz.gameserver.commons.message.ServerResponse;

import java.io.IOException;

/**
 * Created by kevin on 2016/8/1.
 */
public class SoundResponse extends ServerResponse {
    /**
     * 必须调用此方法设置消息号
     *
     * @param
     */
    public SoundResponse(int sendUuid,byte[] sound) {
        super(ConnectAPI.MicInput_Response);
        try {
            uuid = sendUuid;
            output.writeBytes(sound);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            output.close();
        }
    }
}
