var myPlaylist;
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
});

function setPrecessBar(){
        var totalWidth = $("body").width();
        precessBarWidth = totalWidth - 130;
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
    //增加点击次数
    addClicks(type,voiceId);
}
/*
function setJPlayer(vSrc,vTitle){
    $.jPlayer.timeFormat.showHour = true;
    $("#jquery_jplayer_1").jPlayer("setMedia", { mp3: vSrc });
    $("#jquery_jplayer_1").jPlayer({
		ready: function () {
			$(this).jPlayer("setMedia", {
				mp3: vSrc
			});
		},
		swfPath: "js",
		supplied: "mp3",
		wmode: "window",
		smoothPlayBar: true,
		keyEnabled: true
	});
        $("#jquery_jplayer_1").jPlayer("load");
        $("#jquery_jplayer_1").jPlayer("play");
        
}
*/