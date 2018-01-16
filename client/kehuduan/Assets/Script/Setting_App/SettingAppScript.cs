using UnityEngine;
using System.Collections;
using AssemblyCSharp;
using UnityEngine.UI;

public class SettingAppScript : MonoBehaviour
{
    public Slider yinXiao;
    public GameObject yinXiaoOn;
    public GameObject yinXiaoOff;

    public Slider yingyue;
    public GameObject yingyueOn;
    public GameObject yingyueOff;

    public Toggle fangYang;
    public Toggle puTongHua;

    void Start()
    {
        yinXiaoOn.SetActive(true);
        yinXiaoOff.SetActive(false);
        yinXiao.value = PlayerPrefs.GetFloat("audioYinXiao", 1);

        yingyueOn.SetActive(true);
        yingyueOff.SetActive(false);
        yingyue.value = PlayerPrefs.GetFloat("audioEffect", 1);

        if(PlayerPrefs.GetString("AudioType") == "_0"){
            fangYang.isOn = true;
        }else{
            puTongHua.isOn = true;
        }

    }

    public void yinXiaoChanged()
    {
        float val = yinXiao.value; 
        if(val < 0.01f)
        {
            yinXiaoOn.SetActive(false);
            yinXiaoOff.SetActive(true);
        }
        else
        {
            yinXiaoOn.SetActive(true);
            yinXiaoOff.SetActive(false);   
        }
        PlayerPrefs.SetFloat("audioYinXiao", val);
    }

    public void yingyuechanged(float val)
    {
        if(val < 0.01f)
        {
            yingyueOn.SetActive(false);
            yingyueOff.SetActive(true);
        }
        else
        {
            yingyueOn.SetActive(true);
            yingyueOff.SetActive(false);
        }
        PlayerPrefs.SetFloat("audioEffect", val);
        SoundCtrl.getInstance().ChangeVolume(val);
    }

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

    public void AudioChanged()
    {
        if(fangYang.isOn)
        {
            PlayerPrefs.SetString("AudioType", "_0");
        }

        if(puTongHua.isOn)
        {
            PlayerPrefs.SetString("AudioType", "");
        }
    }
}
