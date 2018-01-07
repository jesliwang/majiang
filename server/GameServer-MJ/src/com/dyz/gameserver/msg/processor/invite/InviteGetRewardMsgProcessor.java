package com.dyz.gameserver.msg.processor.invite;

import com.dyz.gameserver.Avatar;
import com.dyz.gameserver.commons.message.ClientRequest;
import com.dyz.gameserver.commons.session.GameSession;
import com.dyz.gameserver.msg.processor.common.INotAuthProcessor;
import com.dyz.gameserver.msg.processor.common.MsgProcessor;
import com.dyz.gameserver.msg.response.invite.InviteGetRewardResponse;
import com.dyz.gameserver.msg.response.roomcard.RoomCardChangerResponse;
import com.dyz.persist.util.GlobalUtil;

public class InviteGetRewardMsgProcessor extends MsgProcessor implements
		INotAuthProcessor {

	@Override
	public void process(GameSession gameSession, ClientRequest request)
			throws Exception {
		if(GlobalUtil.checkIsLogin(gameSession)){
			Avatar avatar = gameSession.getRole(Avatar.class);
			if(avatar.avatarVO.getAccount().getInvitereward() > avatar.avatarVO.getAccount().getInvitegettedreward())
			{
				int addCard = avatar.avatarVO.getAccount().getInvitereward() - avatar.avatarVO.getAccount().getInvitegettedreward();
				avatar.avatarVO.getAccount().setInvitegettedreward(avatar.avatarVO.getAccount().getInvitereward());
				avatar.updateRoomCard(addCard);
				// 通知房卡变化
				int roomCard = avatar.avatarVO.getAccount().getRoomcard();
				gameSession.sendMsg(new RoomCardChangerResponse(1,roomCard));
				
				gameSession.sendMsg(new InviteGetRewardResponse(1, avatar.avatarVO));
		    
			}
			else
			{
				gameSession.sendMsg(new InviteGetRewardResponse(0, avatar.avatarVO));
			    
			}
		}

	}

}
