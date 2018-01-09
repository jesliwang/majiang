package com.dyz.persist.util;


import com.dyz.gameserver.sprite.base.GameObj;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;

/**
 * Created by kevin on 2016/6/20.
 */
public class TimeUitl {

    static Map<GameObj,Timer> gameObjMap = new HashMap<GameObj,Timer>();

    /**
     *  延迟销毁对象
     * @param gobj
     * @param delayTime
     */
    public static  void delayDestroy(final GameObj gobj,int delayTime){
        final Timer timer = new Timer();
        gameObjMap.put(gobj,timer);
        getGameObjMapSize();
        TimerTask tt=new TimerTask() {
            @Override
            public void run() {
                gameObjMap.remove(gobj);
                timer.cancel();
                gobj.destroyObj();
            }
        };
        timer.schedule(tt, delayTime);
    }

    /**
     * 停止并销毁计时器
     * @param obj
     */
    public static void stopAndDestroyTimer(GameObj obj){
        Timer timer = getTimer(obj);
        if(timer != null){
            gameObjMap.remove(obj);
            getGameObjMapSize();
            timer.cancel();
            timer = null;
        }
    }

    public static void getGameObjMapSize(){
       System.out.println("计时器 gameObjMap.size() = "+gameObjMap.size());
    }

    /**
     * 获取计时器
     * @param obj
     * @return
     */
    private static Timer getTimer(GameObj obj){
        return gameObjMap.get(obj);
    }
}
