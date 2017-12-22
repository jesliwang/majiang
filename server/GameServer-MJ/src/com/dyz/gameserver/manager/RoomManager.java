package com.dyz.gameserver.manager;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.dyz.gameserver.Avatar;
import com.dyz.gameserver.logic.RoomLogic;
import com.dyz.gameserver.pojo.RoomVO;
import com.dyz.myBatis.services.RoomInfoService;

/**
 * Created by kevin on 2016/6/18.
 */
public class RoomManager {

    Map<Integer,RoomLogic> roomList;
	//创建/加入房间之后存 玩家uuid和房间id
	private Map<Integer,Integer> uuidAndRoomId;
	
	private int roomCount = 0;
	

    public RoomManager(){
        roomList = new HashMap<Integer, RoomLogic>();
        uuidAndRoomId = new HashMap<Integer,Integer>();
    }

    private static RoomManager roomManager;

    public static RoomManager getInstance(){
        if(roomManager == null){
            roomManager = new RoomManager();
        }
        return roomManager;
    }

    /**
     * 创建房间
     * @param avatar
     */
    public void createRoom(Avatar avatar, RoomVO roomVO){
        int roomId = randRoomId();
        roomVO.setRoomId(roomId);
        RoomLogic roomLogic = new RoomLogic(roomVO);
        roomLogic.CreateRoom(avatar);
        //表中录入房间信息
        RoomInfoService.getInstance().createRoomInfo(roomVO);
        roomList.put(roomId,roomLogic);
        roomCount++;
        System.out.println("(创建新房间成功)当前在线房间数量："+roomCount+":"+roomList.size());
        addUuidAndRoomId(avatar.avatarVO.getAccount().getUuid(), roomVO.getRoomId());
    }
    /**
     * 移除房间/销毁房间
     * @param avatar
     */
    public void destroyRoom(RoomVO roomVO){
    	RoomLogic roomLogic = roomList.get(roomVO.getRoomId());
    	System.out.println("(销毁房间)当前在线房间数量："+roomCount+":"+roomList.size());
    	if(roomLogic != null){
    		roomList.remove(roomVO.getRoomId());
	    	if(roomCount >= 1){
	    		roomCount --;
	    		System.out.println("(销毁房间成功)当前在线房间数量："+roomCount+":"+roomList.size());
	    	}
	    	else{
	    		System.out.println("在线房间数量出现问题!");
	    	}
	    	roomLogic = null;
	    	roomVO = null;
    	}
    }

    /**
     * 获取room
     * @param roomId 房间号
     * @return
     */
    public RoomLogic getRoom(int roomId){
        return roomList.get(roomId);
    }

    /**
     * 随机获取房间ID
     * @return
     */
    public int randRoomId(){
        int roomId = (int)(899999 * Math.random());
        if(roomId < 100000){
            roomId += 300000;
        }

        RoomLogic temp = getRoom(roomId);
        if(temp == null){
            return roomId;
        }else{
            roomId = randRoomId();
        }
        return roomId;
    }


    /**
     * 检查房间号是否被使用了
     * @param key
     * @return
     */
    public boolean checkRoomIdIsUsed(String key){
        RoomLogic resultObj = roomList.get(key);
        if(resultObj != null){
            return false;
        }
        return  true;
    }

	public int getRoomsCount() {
		return roomList.size();
	}
	/**
	 * 存玩家id和房间roomid
	 * @param uuid  玩家uuid
	 * @param roomid  房间id
	 */
	public void addUuidAndRoomId(Integer uuid,Integer roomid){
		uuidAndRoomId.put(uuid, roomid);
	}
	/**
	 * 移除缓存的房间id和房间roomid
	 * 解散房间，退出房间和断线超时时调用
	 * @param uuid  玩家uuid
	 * @param roomid  房间id
	 */
	public void removeUuidAndRoomId(Integer uuid,Integer roomid){
		if(uuidAndRoomId.get(uuid) != null){
			uuidAndRoomId.remove(uuid, roomid);
		}
	}
	
	public Map<Integer, Integer> getUuidAndRoomId(){
		return uuidAndRoomId;
	}
    
}
