package com.dyz.myBatis.daoImp;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.dyz.myBatis.dao.RoominfoMapper;
import com.dyz.myBatis.dao.StandingsMapper;
import com.dyz.myBatis.model.Roominfo;
import com.dyz.myBatis.model.RoominfoExample;

public class RoomInfoDaoImp implements RoominfoMapper {
	 private SqlSessionFactory sqlSessionFactory;
	    public RoomInfoDaoImp(SqlSessionFactory sqlSessionFactory){
	        this.sqlSessionFactory = sqlSessionFactory;
	    }
		@Override
		public int deleteByPrimaryKey(Integer id) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public int insert(Roominfo record) {
			int flag = 0;
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        try {
	            RoominfoMapper mapper = sqlSession.getMapper(RoominfoMapper.class);
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
		public int insertSelective(Roominfo record) {
			int flag = 0;
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        try {
	            RoominfoMapper mapper = sqlSession.getMapper(RoominfoMapper.class);
	            flag = mapper.insertSelective(record);
	            sqlSession.commit();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
	            sqlSession.close();
	        }
	        return flag;
		}
		@Override
		public Roominfo selectByPrimaryKey(Integer id) {
			Roominfo flag = null ;
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        try {
	            RoominfoMapper mapper = sqlSession.getMapper(RoominfoMapper.class);
	            flag = mapper.selectByPrimaryKey(id);
	            sqlSession.commit();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
	            sqlSession.close();
	        }
	        return flag;
		}
		@Override
		public int updateByPrimaryKeySelective(Roominfo record) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public int updateByPrimaryKey(Roominfo record) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public int selectCount() {
			int roomCount = 0 ;
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        try {
	            RoominfoMapper mapper = sqlSession.getMapper(RoominfoMapper.class);
	            roomCount = mapper.selectCount();
	            sqlSession.commit();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
	            sqlSession.close();
	        }
	        return roomCount;
		}
		@Override
		public int selectTodayCount(Date date) {
			int roomCount = 0 ;
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        try {
	            RoominfoMapper mapper = sqlSession.getMapper(RoominfoMapper.class);
	            roomCount = mapper.selectTodayCount(date);
	            sqlSession.commit();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
	            sqlSession.close();
	        }
	        return roomCount;
		}
		@Override
		public Roominfo selectRoomId(Integer roomid) {
			Roominfo roomCount = null;
	        SqlSession sqlSession = sqlSessionFactory.openSession();
	        try {
	            RoominfoMapper mapper = sqlSession.getMapper(RoominfoMapper.class);
	            roomCount = mapper.selectRoomId(roomid);
	            sqlSession.commit();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
	            sqlSession.close();
	        }
	        return roomCount;
		}
		@Override
		public int countByExample(RoominfoExample example) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public int deleteByExample(RoominfoExample example) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public List<Roominfo> selectByExample(RoominfoExample example) {
			// TODO Auto-generated method stub
			return null;
		}
		@Override
		public int updateByExampleSelective(Roominfo record,
				RoominfoExample example) {
			// TODO Auto-generated method stub
			return 0;
		}
		@Override
		public int updateByExample(Roominfo record, RoominfoExample example) {
			// TODO Auto-generated method stub
			return 0;
		}

}
