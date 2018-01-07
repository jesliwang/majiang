using UnityEngine;
using System.Collections;
using UnityEngine.UI;

using AssemblyCSharp;

public class InviteHistoryItem : MonoBehaviour
{
    public Text Name;
    public Text PlayTimes;
    public Text Date;
    public Text Reward;

    public void SetData(InviteItemVO data)
    {
        Name.text = data.invitedName;
        PlayTimes.text = data.playTimes.ToString();
        Date.text = data.inviteTime;
        Reward.text = data.reward.ToString();
    }
}
