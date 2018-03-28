package com.dyz.gameserver.msg.processor.ting;

import com.dyz.gameserver.Avatar;
import com.dyz.gameserver.commons.message.ClientRequest;
import com.dyz.gameserver.commons.session.GameSession;
import com.dyz.gameserver.logic.RoomLogic;
import com.dyz.gameserver.manager.RoomManager;
import com.dyz.gameserver.msg.processor.common.INotAuthProcessor;
import com.dyz.gameserver.msg.processor.common.MsgProcessor;

public class TingPaiMsgProcessor extends MsgProcessor implements
		INotAuthProcessor {

	@Override
	public void process(GameSession gameSession, ClientRequest request)
			throws Exception {
		System.out.println("11111111");
		RoomLogic roomLogic = RoomManager.getInstance().getRoom(gameSession.getRole(Avatar.class).getRoomVO().getRoomId());
        if(roomLogic != null){
            roomLogic.tingPaiAction(gameSession.getRole(Avatar.class));
        }

	}

}
