var myPlaylist;
var voiceType; //视频表示类型 modified by khzliu 2014年2月17日14:07:52
var playingId; //正在播放记录 modified by khzliu 2014年2月17日14:07:52
var playingFlag = 0; //记录播放状态 modified by khzliu 2014年2月17日14:07:52
$(document).ready(function(){
    myPlaylist = new jPlayerPlaylist({
        jPlayer: "#jquery_jplayer_1",
        cssSelectorAncestor: "#jp_container_1"
        }, myVoicelist, {
        playlistOptions: {
        enableRemoveControls: true
        },
        swfPath: "js",
        supplied: "mp3",
        free:true,
        preload: "auto",
        wmode: "window",
        smoothPlayBar: true,
        keyEnabled: true,
        audioFullScreen: true // Allows the audio poster to go full screen via keyboard
    });
    $.jPlayer.timeFormat.showHour = true;
    $(".jp-title li").text(myVoicelist.name);
    $(".jp-title").css("display","inline");
    myPlaylist.select(0); 
    $('#x-'+0).attr("class","ui-link-inherit ui-btn-active");
    setPrecessBar();
    // Using ".jp-repeat" namespace so we can easily remove this event
    // 增加监听状态，实现播放次数实时更新 modified by khzliu 2014年2月17日16:09:57
    $("#jquery_jplayer_1").bind($.jPlayer.event.play, function(event) { 
        updateClick();
    }); 
});

function setPrecessBar(){
        var totalWidth = $("body").width();
        precessBarWidth = totalWidth - 90; //增加进度条长度 modified by khzliu 2014年2月17日10:30:26
        $("div.jp-progress").css("width",precessBarWidth+"px");
        $("div.jp-time-holder").css("width",precessBarWidth+"px");
}

function setJPlayer(id,vTitle,type,voiceId,size){
    myPlaylist.select(id);
    //设置声音条码
    setPrecessBar();
    $(".jp-title li").text(vTitle);
    $(".jp-title").css("display","inline");
    window.scrollTo(0,0);
    for(var i=0;i<size;i++){
    	$('#x-'+i).attr("class","ui-link-inherit");
    }
    $('#x-'+id).attr("class","ui-link-inherit ui-btn-active");
    myPlaylist.play();
    //增加点击次数 实现播放次数实时更新 modified by khzliu 2014年2月17日16:09:57
    voiceType = type;
    playingId = voiceId;
    playingFlag = 0;
}    
    //增加点击次数
    //console.log("--------------------");
//实现播放次数实时更新 modified by khzliu 2014年2月17日16:09:57
function updateClick()
{
	if(playingFlag == 0)
	{
		addClicks(voiceType,playingId); //modified by khzliu 2014年2月17日14:07:52
		playingFlag = 1;
	}
	
}
