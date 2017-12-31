using UnityEngine;
using System.Collections;
using AssemblyCSharp;

public class SettingAppScript : MonoBehaviour
{
    public void exit()
    {
        CustomSocket.getInstance().sendMsg(new LoginRequest());

        Application.Quit();
        //多态  调用退出登录接口

    }

    public void cancle()
    {
        SettingAppScript self = GetComponent<SettingAppScript>();
        self = null;
        Destroy(self);
        Destroy(gameObject);
    }
}
