package com.dyz.gameserver.msg.processor.invite;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;

import com.alibaba.fastjson.JSONObject;
import com.dyz.gameserver.Avatar;
import com.dyz.gameserver.commons.message.ClientRequest;
import com.dyz.gameserver.commons.session.GameSession;
import com.dyz.gameserver.msg.processor.common.INotAuthProcessor;
import com.dyz.gameserver.msg.processor.common.MsgProcessor;
import com.dyz.gameserver.msg.response.invite.InviteGetRewardResponse;
import com.dyz.gameserver.msg.response.invite.InviteHistoryResponse;
import com.dyz.gameserver.msg.response.roomcard.RoomCardChangerResponse;
import com.dyz.gameserver.pojo.InviteItemVO;
import com.dyz.myBatis.model.Account;
import com.dyz.myBatis.model.Invite;
import com.dyz.myBatis.services.AccountService;
import com.dyz.myBatis.services.InviteService;
import com.dyz.persist.util.GlobalUtil;
import com.dyz.persist.util.JsonUtilTool;

public class InviteHistoryMsgProcessor extends MsgProcessor implements
		INotAuthProcessor {

	@Override
	public void process(GameSession gameSession, ClientRequest request)
			throws Exception {
		if(GlobalUtil.checkIsLogin(gameSession)){
			Avatar avatar = gameSession.getRole(Avatar.class);
			List<Invite> ans = InviteService.getInstance().SelectInviteByInviteid(avatar.getUuId());
			
			List<Integer> ids = new ArrayList<Integer>();
			for(int i = 0; i < ans.size(); i++)
			{
				ids.add(ans.get(i).getInvitedid());
			}
			List<Account> accs = AccountService.getInstance().selectByIds(ids);
			
			List<InviteItemVO> historys = new ArrayList<InviteItemVO>();
			for(int i = 0; i < ans.size(); i++)
			{
				Account accountSelect = null;
				for(int j = 0; j < accs.size();j++)
				{
					if(ans.get(i).getInvitedid().equals(accs.get(j).getUuid()))
					{
						accountSelect = accs.get(j);
						break;
					}
				}
				
				InviteItemVO item = new InviteItemVO();
				item.setInviteName(accountSelect.getNickname());
				item.setPlayTimes(accountSelect.getPlaytimes());
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");  
				item.setInviteTime(dateFormat.format(ans.get(i).getInvitetime()));
						
				item.setReward(ans.get(i).getReward());
				historys.add(item);
				
				JSONObject json  = new JSONObject();
				json.put("history", historys);
				gameSession.sendMsg(new InviteHistoryResponse(1, json.toString()));
			}
		}
		


	}

}
