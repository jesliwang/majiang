package com.dyz.myBatis.services;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSessionFactory;

import com.dyz.myBatis.dao.AccountMapper;
import com.dyz.myBatis.dao.InviteMapper;
import com.dyz.myBatis.daoImp.AccountDaoImp;
import com.dyz.myBatis.daoImp.InviteDaoImp;
import com.dyz.myBatis.model.Invite;

public class InviteService {
	private InviteMapper inviteMap;

    private static InviteService inviteService = new InviteService();

    public static InviteService getInstance(){
        return inviteService;
    }

    public void initSetSession(SqlSessionFactory sqlSessionFactory){
    	inviteMap = new InviteDaoImp(sqlSessionFactory);
    }
    
    public int AddInvite(Invite inv) throws SQLException
    {
    	int index = inviteMap.insert(inv);
    	return index;
    }
}
