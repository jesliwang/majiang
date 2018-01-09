package com.dyz.gameserver.msg.processor.login;

import com.dyz.gameserver.commons.message.ClientRequest;
import com.dyz.gameserver.commons.session.GameSession;
import com.dyz.gameserver.manager.GameSessionManager;
import com.dyz.gameserver.msg.processor.common.INotAuthProcessor;
import com.dyz.gameserver.msg.processor.common.MsgProcessor;

public class LoginMsgProcessor extends MsgProcessor implements INotAuthProcessor{

	@Override
	public void process(GameSession gameSession, ClientRequest request)
			throws Exception {
		int  count = request.getInt();
		int userId = request.getInt();
		gameSession.setUserId(userId);
		GameSessionManager.getInstance().putGameSessionInHashMap(gameSession,userId);
	}

}
