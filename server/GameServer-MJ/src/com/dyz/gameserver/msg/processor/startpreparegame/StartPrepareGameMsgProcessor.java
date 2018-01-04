package com.dyz.gameserver.msg.processor.startpreparegame;

import net.sf.json.JSONObject;

import com.context.ErrorCode;
import com.dyz.gameserver.Avatar;
import com.dyz.gameserver.commons.message.ClientRequest;
import com.dyz.gameserver.commons.session.GameSession;
import com.dyz.gameserver.logic.RoomLogic;
import com.dyz.gameserver.manager.GameSessionManager;
import com.dyz.gameserver.manager.RoomManager;
import com.dyz.gameserver.msg.processor.common.INotAuthProcessor;
import com.dyz.gameserver.msg.processor.common.MsgProcessor;
import com.dyz.gameserver.msg.response.ErrorResponse;
import com.dyz.persist.util.GlobalUtil;

public class StartPrepareGameMsgProcessor extends MsgProcessor implements
		INotAuthProcessor {

	public StartPrepareGameMsgProcessor() {
	}
	
	@Override
	public void process(GameSession gameSession, ClientRequest request)
			throws Exception {
		if(GlobalUtil.checkIsLogin(gameSession)) {
			JSONObject json = JSONObject.fromObject(request.getString());
			int roomId = (int)json.get("roomId");
			logger.error("roomID=" + roomId);
			//if (avatar != null) {
				RoomLogic roomLogic = RoomManager.getInstance().getRoom(roomId);
				if (roomLogic != null) {
						roomLogic.StartGame();
				} else {
					gameSession.sendMsg(new ErrorResponse(ErrorCode.Error_000018));
				}
			//}
			//system.out.println("roomId --> " + roomId);
		}
		else{
			//system.out.println("该用户还没有登录");
			gameSession.destroyObj();
		}

	}

}
