package com.dyz.gameserver.pojo;

import java.util.Date;

public class InviteItemVO {
	private String InvitedName;
	
	private int playTimes;
	
	private String InviteTime;
	
	private int Reward;
	
	public String getInviteName()
	{
		return InvitedName;
	}
	
	public void setInviteName(String name)
	{
		InvitedName = name;
	}
	
	public int getPlayTimes()
	{
		return playTimes;
	}
	
	public void setPlayTimes(int times)
	{
		playTimes = times;
	}
	
	public String getInviteTime()
	{
		return InviteTime;
	}
	
	public void setInviteTime(String time)
	{
		InviteTime = time;
	}
	
	public int getReward()
	{
		return Reward;
	}
	
	public void setReward(int reward)
	{
		Reward = reward;
	}
}
