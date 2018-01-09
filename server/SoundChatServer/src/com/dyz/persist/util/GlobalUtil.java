package com.dyz.persist.util;

import com.dyz.gameserver.commons.session.GameSession;

/**
 * Created by kevin on 2016/6/23.
 */
public class GlobalUtil {

    public static boolean checkIsLogin(GameSession session){
        if(session.isLogin() == false){
            System.out.println("此帐号没有登录");
//            try {
//                //session.sendMsg(new ErrorResponse(ErrorCode.Error_000002));
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
            return false;
        }
        return true;
    }

}
