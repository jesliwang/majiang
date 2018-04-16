package com.dyz.persist.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.lang.math.Fraction;

import java.util.Set;

import com.context.Rule;
import com.dyz.gameserver.Avatar;
import com.dyz.gameserver.logic.PlayCardsLogic;

/**
 * 判断胡牌类型
 * @author luck
 *
 */
public class HuPaiType {
     
	/**
	 * 有效码 key：原始码   value：处理之后的码
	 */
	private  Map<Integer , Integer> map = new HashMap<Integer , Integer>();
	/**
	 * 有效码
	 */
	private   List<Integer> validMa;
	
	/**
	 * 包含所有的有效码(处理成0-3之间数的码)
	 */
	private static StringBuffer sb;
	
	
	private static HuPaiType huPaiType ;
	
	
	private HuPaiType() {
		
	}
	public  static HuPaiType getInstance(){
		if(huPaiType == null){
			huPaiType = new HuPaiType();
		}
		return huPaiType;
	}
	/**
	 * 
	 * 	 //区分转转麻将，划水麻将，长沙麻将
	 * 
	 * 返回String的规格
     * 存储本局 杠，胡关系
     * list里面字符串规则 
     * 杠：uuid(出牌家),介绍(明杠，暗杠)  （123，明杠）
     * 自己摸来杠：介绍(明杠，暗杠)
     * 点炮：uuid(出牌家),介绍(胡的类型) （123，qishouhu）
     * 自摸：介绍(胡的类型)
     * Map：key-->1：表示信息    2:表示次数
     * count 为1表示单胡  2表示多响
     */
	public  List<Integer> getHuType(Avatar avatarShu , Avatar avatar , int roomType ,int cardIndex,
			List<Avatar> playerList,List<Integer> mas,int count,String type,boolean hongzhong){
		 //区分转转麻将，划水麻将，长沙麻将
		 System.out.println("type=" + roomType);
		 if(roomType == 1){
			 //转转麻将没有大小胡之分
			 return zhuanZhuan(avatarShu , avatar , cardIndex,playerList,mas,count,type,hongzhong);
		 }
		 else if(roomType == 2){
			 //划水麻将
			  huaShui(avatarShu , avatar, cardIndex,playerList,count);
			  return new ArrayList<>();
		 }
		 else{
			 //长沙麻将
			 changSha(avatarShu,  avatar ,cardIndex);
			  return new ArrayList<>();
		 }
	}
	/**
	 * 划水麻将
	 * @param avatarShu  输家
	 * @param avatar  自己
	 * @param cardIndex
	 * @param playerList
	 * @param huCount 是否是一炮多响
	 */
	private static void huaShui(Avatar avatarShu , Avatar avatar,  int cardIndex , 
			List<Avatar> playerList , int huCount){
		String str;
		int score = 0;
		int xiayu = avatar.getRoomVO().getXiaYu();
		
		if(avatarShu.getUuId() == avatar.getUuId() ){
			//自摸类型
			if(avatar.avatarVO.isMain())
			{
				score = 4;
				// 庄家自摸
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", score*(playerList.size() - 1));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			else
			{
				//闲家自摸
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).avatarVO.isMain())
					{
						score = 4;
					}
					else
					{
						score = 2;
					}
					
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", 4 + 2 * Math.max(0, playerList.size() - 2));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			
		}
		else{
			System.out.println("ting=" + avatarShu.avatarVO.isTing() + "," + avatar.avatarVO.isMain());
			//点炮   单响
			if(avatarShu.avatarVO.isTing() && avatar.avatarVO.isMain())
			{
				// 庄家平胡
				score = 2;
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", score*(playerList.size() - 1));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			else if(avatarShu.avatarVO.isTing())
			{
				// 闲家平胡
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).avatarVO.isMain())
					{
						score = 2;
					}
					else
					{
						score = 1;
					}
					
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1",  2 + Math.max(0, playerList.size() - 2));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			else
			{
				if((avatar.avatarVO.isMain()))
				{
					score = 6;
				}
				else 
				{
					score = 4;
				}
	
				str =avatarShu.getUuId()+":"+cardIndex+":"+Rule.Hu_d_self;  
				//修改胡家自己的番数
				avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
				
				avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("2",1*score);
				//修改点炮玩家的番
				avatarShu.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("3",-1*score);
				//存储hu的关系信息 胡玩家uuid：胡牌id：胡牌类型
				str = avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_d_other; 
				//点炮信息放入放炮玩家信息中
				avatarShu.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
			}
			/*
			if(huCount == 1){
				str =avatarShu.getUuId()+":"+cardIndex+":"+Rule.Hu_d_self;  
				//修改胡家自己的番数
				avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
				
				avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("2",1*score);
				//修改点炮玩家的番
				avatarShu.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("3",-1*score);
				//存储hu的关系信息 胡玩家uuid：胡牌id：胡牌类型
				str = avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_d_other; 
				//点炮信息放入放炮玩家信息中
				avatarShu.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
			}
			else{
				//点炮  多响  
				str =avatarShu.getUuId()+":"+cardIndex+":"+Rule.Hu_d_self;  
				//修改胡家自己的番数
				avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
				avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("2",1*score);
				//修改点炮玩家的番数
				avatarShu.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("3",-1*score);
				
				//存储hu的关系信息 胡玩家uuid：胡牌id：胡牌类型
				str = avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_d_other; 
				//点炮信息放入放炮玩家信息中
				avatarShu.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
			}
			*/
		}
	}
	/**
	 *  转转麻将 算分
	 * @param avatarShu 输家 自摸时也表示赢家
	 * @param avatar 赢家   
	 * @param cardIndex
	 * @param playerList
	 * @param mas
	 * @param count
	 *  type  qiangganghu
	 */
	private  List<Integer> zhuanZhuan(Avatar  avatarShu , Avatar avatar , int cardIndex, List<Avatar> playerList,
			List<Integer> mas , int count,String type,boolean hongzhong){
		map = new HashMap<Integer,Integer>();
		sb = new StringBuffer();
		int score = 0;
		String str; 
		int selfCount = 0;
		List<Integer> maPoint = new ArrayList<Integer>();
		//有效的码   sb = "1,2,3"样式
		sb.append("0,");
		if(mas != null){
			int ma;
			for (Integer cardPoint : mas) {
				ma = returnMa(cardPoint);
				maPoint.add(ma);
				//system.out.println("处理过的码----"+cardPoint);
				map.put(cardPoint, ma);
			}
		}
		//抓的码里面有多少个指向对应的各个玩家
		selfCount  = Collections.frequency(maPoint, 0);//自己 
		int downCount  = Collections.frequency(maPoint, 1);//下家
		int towardCount  = Collections.frequency(maPoint, 2);//对家
		int upCount  = Collections.frequency(maPoint, 3);//上家
		
		
		//int selfIndex = 0;//胡家在数组中的位置 （0-3）//2016-8-3
		int selfIndex = playerList.indexOf(avatar);
		/*for (int i = 0; i < playerList.size(); i++) {
				if(playerList.get(i).getUuId() == avatar.getUuId()){
					selfIndex = i;
				}
			}*///2016-8-3
		//其他三家在playerList中的下标，同上面的selfCount，downCount对应
		int downIndex = otherIndex(selfIndex,1);
		int towardIndex = otherIndex(selfIndex,2);
		int upIndex = otherIndex(selfIndex,3);
		if(avatarShu.getUuId() == avatar.getUuId() ){
			//自摸
			//自摸类型
			if(avatar.avatarVO.isMain())
			{
				score = 4;
				// 庄家自摸
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", score*(playerList.size() - 1));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			else
			{
				//闲家自摸
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).avatarVO.isMain())
					{
						score = 4;
					}
					else
					{
						score = 2;
					}
					
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", 4 + 2 * Math.max(0, playerList.size() - 2));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			
		}
		else{
			//点炮   单响  
			System.out.println("ting=" + avatarShu.avatarVO.isTing() + "," + avatar.avatarVO.isMain());
			//点炮   单响
			if(avatarShu.avatarVO.isTing() && avatar.avatarVO.isMain())
			{
				// 庄家平胡
				score = 2;
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", score*(playerList.size() - 1));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			else if(avatarShu.avatarVO.isTing())
			{
				// 闲家平胡
				for (int i = 0; i < playerList.size(); i++) {
					if(playerList.get(i).avatarVO.isMain())
					{
						score = 2;
					}
					else
					{
						score = 1;
					}
					
					if(playerList.get(i).getUuId() == avatar.getUuId()){
						str ="0:"+cardIndex+":"+Rule.Hu_zi_common;  
						avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1",  2 + Math.max(0, playerList.size() - 2));
					}
					else{
						str =avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_other_common;  
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
						playerList.get(i).avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("1", -1*score);
					}
				}
			}
			else
			{
				if((avatar.avatarVO.isMain()))
				{
					score = 6;
				}
				else 
				{
					score = 4;
				}
	
				str =avatarShu.getUuId()+":"+cardIndex+":"+Rule.Hu_d_self;  
				//修改胡家自己的番数
				avatar.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
				
				avatar.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("2",1*score);
				//修改点炮玩家的番
				avatarShu.avatarVO.getHuReturnObjectVO().updateGangAndHuInfos("3",-1*score);
				//存储hu的关系信息 胡玩家uuid：胡牌id：胡牌类型
				str = avatar.getUuId()+":"+cardIndex+":"+Rule.Hu_d_other; 
				//点炮信息放入放炮玩家信息中
				avatarShu.avatarVO.getHuReturnObjectVO().updateTotalInfo("hu", str);
			}
		}
		validMa = new ArrayList<Integer>();
		Set<Entry<Integer, Integer>>  set= map.entrySet();
		for (Entry<Integer, Integer> entry : set) {
			if(sb.toString().contains(entry.getValue()+"")){
				validMa.add(entry.getKey());
			}
		}
		System.out.println("有效码："+validMa);
		return validMa;
	}
	/**
	 * 处理抓到的码点数，成0-3之间的数
	 * @param cardPoint
	 * @return
	 */
	public static int returnMa(int cardPoint){
			if(cardPoint  <= 8){ 
				return cardPoint%4;
			}
			else {
				cardPoint = cardPoint-9;
				return returnMa(cardPoint);
			}
	}
	
	
	/**
	 * 长沙麻将
	 * @param uuid
	 * @param avatar
	 * @param str
	 * @return
	 */
	private static void changSha(Avatar  avatarShu , Avatar avatar , int cardIndex){
		String str = null;
		int uuid  = avatarShu.getUuId();
		int [] paiList = avatar.getSinglePaiArray();
		 //长沙麻将
		 if(avatarShu.getUuId() == avatar.getUuId() ){
				//自摸类型
				if(checkQingyise(paiList)){
					//清一色
					str = "0:"+Rule.Hu_zi_qingyise;
				}
				if(avatar.getRoomVO().getSevenDouble() && checkQiDui(paiList)){
					if(str != null){
						//七小队对
						str = str +"-"+0+Rule.Hu_self_qixiaodui;
					}
					else{
						str = Rule.Hu_self_qixiaodui;
					}
				}
				if(str == null){
					//str = "0:"+Rule.Hu_zi_common;
				}
			}
			else{
				//点炮类型
				if(checkQingyise(paiList)){
					//清一色
					str = uuid+":"+Rule.Hu_d_qingyise;
				}
				if(avatar.getRoomVO().getSevenDouble() && checkQiDui(paiList)){
					if(str != null){
						//七小队对
						str = str +"-"+uuid+":"+Rule.Hu_other_qixiaodui;
					}
					else{
						str = uuid+":"+Rule.Hu_other_qixiaodui;
					}
				}
				if(str == null){
					//str =uuid+":"+Rule.Hu_zi_common;
				}
			}
		 
	}
	
	
	
	/**
	 * 判断是否是清一色
	 * @param paiList
	 * @return
	 */
	private static  boolean checkQingyise(int [] paiList){
		boolean str= false;
		//是否是清一色
		int qys = 0;
		for (int i = 0; i < paiList.length; i++) {
			if(i <= 8){
				if(paiList[i]>=1){
					qys = qys+1;
				}
			}
			else if( i >= 9 && i<= 17){
				if(paiList[i]>=1){
					qys = qys+1;
				}
			}
			else{
				if(paiList[i]>=1){
					qys = qys+1;
				}
			}
		}
		
		if(qys ==1){
			str = true;
		}
		return str;
	}
	/**
	 * 判断是否是七对
	 * @param paiList
	 * @return
	 */
	private static  boolean checkQiDui(int [] paiList){
		boolean str= false;
		return str;
	}
	
	private static int otherIndex(int selfindex,int count){
		int thisIndex = selfindex + count;
		if(thisIndex>= 4){
			thisIndex = thisIndex -4;
		}
		return thisIndex;
	}
	public List<Integer> getValidMa() {
		return validMa;
	}
	public void setValidMa(List<Integer> validMa) {
		this.validMa = validMa;
	}
	
}
