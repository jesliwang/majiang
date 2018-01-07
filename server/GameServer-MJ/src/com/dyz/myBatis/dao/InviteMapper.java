package com.dyz.myBatis.dao;

import com.dyz.myBatis.model.Invite;
import com.dyz.myBatis.model.InviteExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface InviteMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int countByExample(InviteExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int deleteByExample(InviteExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int insert(Invite record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int insertSelective(Invite record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	List<Invite> selectByExample(InviteExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	Invite selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int updateByExampleSelective(@Param("record") Invite record,
			@Param("example") InviteExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int updateByExample(@Param("record") Invite record,
			@Param("example") InviteExample example);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(Invite record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table invite
	 * @mbggenerated
	 */
	int updateByPrimaryKey(Invite record);

	List<Invite> SelectInviteByInviteid(int id);
}