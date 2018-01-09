package com.dyz.gameserver.commons.session;

import com.dyz.gameserver.commons.message.ResponseMsg;
import com.dyz.gameserver.manager.GameSessionManager;
import com.dyz.gameserver.sprite.base.GameObj;
import org.apache.mina.core.future.WriteFuture;
import org.apache.mina.core.session.AttributeKey;
import org.apache.mina.core.session.IoSession;

import java.net.InetSocketAddress;
import java.net.SocketAddress;
import java.util.*;

/**
 * 游戏中的session回话，封装了mina的session
 * @author dyz
 *
 */
public class GameSession implements GameObj {
	/**
	 * IoSession
	 */
	private IoSession session;
	/**
	 * 用户的服务器地址
	 */
	private String address;
	/**
	 *
	 */
	private int userId;
	
	private boolean isLogin=false;

	private List<ResponseMsg> responseList;
	
	private static final AttributeKey KEY_PLAYER_SESSION = new AttributeKey(GameSession.class, "player.session");
	
	public GameSession(IoSession session){
		this.session = session;
		this.session.setAttribute(KEY_PLAYER_SESSION, this);
		SocketAddress socketaddress = session.getRemoteAddress();
		InetSocketAddress s = (InetSocketAddress) socketaddress;
		address = s.getAddress().getHostAddress();
		responseList = new ArrayList<>();
		showTimer();
		//存当前用户相关的服务器地址
	}

	/**
	 * 得到一个GameSession的实例化对象
	 * @param session
	 * @return
     */
	public static GameSession getInstance(IoSession session) {
		Object playerObj = session.getAttribute(KEY_PLAYER_SESSION);
		session.getService().getManagedSessions();
		return (GameSession) playerObj;
	}
	private  Timer timer;
	/**
	 * 发送消息给客户端
	 * @param msg
	 * @return
	 * @throws InterruptedException 
	 */
	public WriteFuture sendMsg(ResponseMsg msg)  {
		if (session == null || !session.isConnected() || session.isClosing()) {
			System.out.println("session == null || !session.isConnected() || session.isClosing()");
			return null;
		}
		responseList.add(msg);
		return null;//session.write(msg);
	}

	private  void showTimer() {
		TimerTask task = new TimerTask() {
			@Override
			public void run() {
				if(responseList.size()>0){
					ResponseMsg temp = responseList.remove(0);
					session.write(temp);
				}
			}
		};

		//设置执行时间
		Calendar calendar = Calendar.getInstance();
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH);
		int day = calendar.get(Calendar.DAY_OF_MONTH);//每天
		//定制每天的21:09:00执行，
		calendar.set(year, month, day, 0, 0, 1);
		Date date = calendar.getTime();
		timer = new Timer();
		System.out.println(date);
		timer.schedule(task, date,1000);
	}



	/**
	 *
	 * @return
     */
	public String getAddress(){
		return this.address;
	}

	/**
	 *
	 * @param isLogin
     */
	public  void setLogin(boolean isLogin){
		this.isLogin=isLogin;
	}

	/**
	 * 是否登录
	 * @return
     */
	public boolean isLogin(){
		return this.isLogin;
	}

	/**
	 * 保存角色信息
	 * @param
     */
	public void setUserId(int userId){
		this.userId = userId;
	}
	
	@SuppressWarnings("unchecked")
	/**
	 * 得到角色信息
	 */
	public int getUserId(){
		return this.userId;
	}

	/**
	 * 关闭SESSION
	 */
	public void close(){
		timer.cancel();
		timer = null;
		System.out.println("关闭聊天SESSION -- > "+session.getRemoteAddress());
		GameSessionManager.getInstance().removeGameSession(userId);
		if(session != null && session.isConnected()) {
			System.out.println("关闭聊天SESSION -- >  session.close(false);");
			session.close(false);
		}
	}

	@Override
	public void destroyObj() {
		close();
	}
}
