package com.dyz.gameserver.msg.processor;
import com.dyz.gameserver.commons.message.ClientRequest;
import com.dyz.gameserver.commons.session.GameSession;
import com.dyz.gameserver.manager.GameSessionManager;
import com.dyz.gameserver.msg.processor.common.INotAuthProcessor;
import com.dyz.gameserver.msg.processor.common.MsgProcessor;
import com.dyz.gameserver.msg.response.SoundResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by kevin on 2016/8/1.
 */
public class SoundMsgProcessor extends MsgProcessor implements INotAuthProcessor {
    @Override
    public void process(GameSession gameSession, ClientRequest request) throws Exception {
        int len = request.getInt();
        List<Integer> userList = new ArrayList<Integer>();
        for(int i=0;i<len;i++){
            userList.add(request.getInt());
        }
        int sendUuid = request.getInt();
        byte[] sounds = request.getBytes();
        for(int a=0;a<userList.size();a++){
            System.out.println("==> "+userList.get(a));
           GameSession tempSession =  GameSessionManager.getInstance().getGameSessionFromHashMap(userList.get(a));
            if(tempSession != null){
                tempSession.sendMsg(new SoundResponse(sendUuid,sounds));
            }else{
                System.out.println(userList.get(a) +"   session is null");
            }
        }
    }
}
