using UnityEngine;
using System.Collections;
/**
 * sound control class
 * 
 * author :kevin
 * 
 * */
public class SoundCtrl  {

	private Hashtable soudHash = new Hashtable (); 

	private static SoundCtrl _instance;

	private static AudioSource audioS; 

	public static SoundCtrl getInstance(){
		if (_instance == null) {
			_instance = new SoundCtrl ();
			audioS = GameObject.Find ("MyAudio").GetComponent<AudioSource> ();
            audioS.volume = PlayerPrefs.GetFloat("audioEffect", 1);
		}

		return _instance;
	}

    public void ChangeVolume(float vol)
    {
        audioS.volume = vol;
    }

	public void playSound(int cardPoint,int sex){
		if (GlobalDataScript.soundToggle) {
			string path = "Sounds/";
			if (sex == 1) {
                path += "boy" + PlayerPrefs.GetString("AudioType", "") + "/" + (cardPoint + 1);
			} else {
                path += "girl" + PlayerPrefs.GetString("AudioType", "") + "/" + (cardPoint + 1);
			}
			AudioClip temp = (AudioClip)soudHash [path];
			if (temp == null) {
				temp = GameObject.Instantiate (Resources.Load (path)) as AudioClip;
				soudHash.Add (path, temp);
			}
			audioS.clip = temp;
			audioS.loop = false;
			audioS.Play ();
		}
	}

	public void playMessageBoxSound(int codeIndex){
		if(GlobalDataScript.soundToggle){
			string path = "Sounds/other/"+codeIndex;
			AudioClip temp = (AudioClip)soudHash[path];
			if(temp == null){
				temp = GameObject.Instantiate(Resources.Load (path)) as AudioClip;
				soudHash.Add (path,temp);
			}
			audioS.clip = temp;
			audioS.Play ();
		}
	}

	public void playBGM(){
		string path = "Sounds/mjBGM";
		AudioClip temp = (AudioClip)soudHash[path];
		if(temp == null){
			temp = GameObject.Instantiate(Resources.Load (path)) as AudioClip;
			soudHash.Add (path,temp);
		}
		audioS.clip = temp;
		audioS.loop = true;
		audioS.Play ();
		if (GlobalDataScript.soundToggle) {
			audioS.mute = false;
		} else {
			audioS.mute = true;
		}
	}

	public void stopBGM(){
		audioS.loop = false;
		audioS.Stop ();
	}

	public void playSoundByAction(string str,int sex){
		string path = "Sounds/";
		if (sex == 1) {
            path += "boy" + PlayerPrefs.GetString("AudioType", "") + "/" + str;
		} else {
            path += "girl" + PlayerPrefs.GetString("AudioType", "") + "/" + str;
		}
		AudioClip temp = (AudioClip)soudHash[path];
		if(temp == null){
			temp = GameObject.Instantiate(Resources.Load (path)) as AudioClip;
			soudHash.Add (path,temp);
		}
		audioS.clip = temp;
		audioS.Play ();
	}


}
