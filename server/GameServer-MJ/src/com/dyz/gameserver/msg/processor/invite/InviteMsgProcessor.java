package com.dyz.gameserver.msg.processor.invite;

import java.util.Date;

import net.sf.json.JSONObject;

import com.dyz.gameserver.Avatar;
import com.dyz.gameserver.commons.message.ClientRequest;
import com.dyz.gameserver.commons.session.GameSession;
import com.dyz.gameserver.msg.processor.common.INotAuthProcessor;
import com.dyz.gameserver.msg.processor.common.MsgProcessor;
import com.dyz.gameserver.msg.response.invite.InviteResponse;
import com.dyz.gameserver.msg.response.roomcard.RoomCardChangerResponse;
import com.dyz.myBatis.model.Account;
import com.dyz.myBatis.model.Invite;
import com.dyz.myBatis.services.AccountService;
import com.dyz.myBatis.services.InviteService;
import com.dyz.persist.util.GlobalUtil;

public class InviteMsgProcessor extends MsgProcessor implements
		INotAuthProcessor {

	@Override
	public void process(GameSession gameSession, ClientRequest request)
			throws Exception {
		if(GlobalUtil.checkIsLogin(gameSession)){
			JSONObject json = JSONObject.fromObject(request.getString());
			int invitor = (int)json.get("uuid");
			
			Avatar avatar = gameSession.getRole(Avatar.class);
			logger.error(avatar.avatarVO.getAccount().getUuid().toString() );
			logger.error( "" + invitor );
			if(avatar.avatarVO.getAccount().getInvite() != 0){
				// 通知邀请使用失败
				gameSession.sendMsg(new InviteResponse(0, "已经绑定邀请账号了！！！"));
			}else{
				Account invAccount = AccountService.getInstance().selectByUUid(invitor);
				if(null == invAccount)
				{
					gameSession.sendMsg(new InviteResponse(0, "邀请码错误！！！"));
				}
				else
				{
					// 邀请绑定成功
					// 写邀请记录
					Invite inv = new Invite();
					inv.setInviteid(invitor);
					inv.setInvitedid(avatar.avatarVO.getAccount().getUuid());
					inv.setInvitetime(new Date());
					inv.setReward(5);
					InviteService.getInstance().AddInvite(inv);
					
					// 被邀请人发奖励 +5
					avatar.avatarVO.getAccount().setInvite(invitor);
					avatar.updateRoomCard(5);
					int roomCard = avatar.avatarVO.getAccount().getRoomcard();
					avatar.getSession().sendMsg(new RoomCardChangerResponse(1,roomCard));
					
					// 邀请人添加奖励
					invAccount.setInvitereward(invAccount.getInvitereward() + 5);
					AccountService.getInstance().updateByPrimaryKeySelective(invAccount);
					
					gameSession.sendMsg(new InviteResponse(1, "绑定成功，获得5张房卡"));
				
				}
			}
		}

	}

}
