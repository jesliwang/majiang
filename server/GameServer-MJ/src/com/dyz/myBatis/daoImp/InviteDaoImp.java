package com.dyz.myBatis.daoImp;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dyz.myBatis.dao.AccountMapper;
import com.dyz.myBatis.dao.InviteMapper;
import com.dyz.myBatis.model.Invite;
import com.dyz.myBatis.model.InviteExample;

public class InviteDaoImp implements InviteMapper {
	private SqlSessionFactory sqlSessionFactory;
    public InviteDaoImp(SqlSessionFactory sqlSessionFactory){
        this.sqlSessionFactory = sqlSessionFactory;
    }

	@Override
	public int countByExample(InviteExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByExample(InviteExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Invite record) {
		int flag = 0;
        SqlSession sqlSession = sqlSessionFactory.openSession();
        InviteMapper mapper = null;
        try {
            mapper = sqlSession.getMapper(InviteMapper.class);
            flag = mapper.insert(record);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
          
        }finally {
            sqlSession.close();
        }
        return flag;
	}

	@Override
	public int insertSelective(Invite record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Invite> selectByExample(InviteExample example) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Invite selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByExampleSelective(Invite record, InviteExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByExample(Invite record, InviteExample example) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeySelective(Invite record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Invite record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
