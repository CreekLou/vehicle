var myPlaylist;
var loadingObj;
var videoType; //视频表示类型 modified by khzliu 2014年2月17日14:07:52
var playingId; //正在播放记录 modified by khzliu 2014年2月17日14:07:52
var playingFlag = 0; //记录播放状态 modified by khzliu 2014年2月17日14:07:52
$(document).ready(function(){
    //设置播放列表
        var totalWidth = $("body").width();
        myPlaylist = new jPlayerPlaylist({
        jPlayer: "#jquery_jplayer_1",
        cssSelectorAncestor: "#jp_container_1"
        }, myVideolist, {
        playlistOptions: {
        	enableRemoveControls: true
        },
        size: {
	            width: "100%",
	            height: 0.75*(totalWidth-50)+"px",
	            cssClass: "jp-video-360p"
	        },
        swfPath: "js",
        supplied: "m4v",
        free:true,
        preload: "auto",
        smoothPlayBar: true,
        keyEnabled: true,
        audioFullScreen: true // Allows the audio poster to go full screen via keyboard
    });
    myPlaylist.select(0);
    $('#x-'+0).attr("class","ui-link-inherit ui-btn-active");
    playingId = 
    //设置声音条码
    setPrecessBar();
    
    //设置播放图标
    setPlayIcon();
    
    //设置loading图标
    loadingObj = new loading(document.getElementById('canvas'),{radius:40,circleLineWidth:15});
    //设置全屏处理   
    $(".jp-fullScreen").click(function() {
	if($("#jquery_jplayer_1").jPlayer("option","fullScreen")==false)
        {   
            $("#header").css("display","none");
            $(".ui-content").css("display","none");
            var totalWidth = $("body").width();
            $("#jquery_jplayer_1").jPlayer({fullScreen: true, size: {
	            width: "100%",
	            height: (totalWidth-160)+"px",
	            cssClass: "jp-video-360p"
	        }});
            if($.jPlayer.event.playing)
                myPlaylist.play();
            
        }
        else
        {
            var totalWidth = $("body").width();
            $("#jquery_jplayer_1").jPlayer({fullScreen: false,
                size: {
	            width: "100%",
	            height: (totalWidth-160)+"px",
	            cssClass: "jp-video-360p"
	     }});
            $("#header").css("display","inline");
            $(".ui-content").css("display","block");
            if($.jPlayer.event.playing){
                //设置播放图标
                setPlayIcon();
                $("div.jp-video-360p div.jp-video-play").css("display","none");
            }
        }
    });
   
    //监听屏幕切换事件
    $(window).bind('orientationchange',function(e){

      //此处为手持设备方向改变时执行的代码
      var totalWidth = $("body").width();
      $("#jquery_jplayer_1").jPlayer({size: {
	            width: "100%",
	            height: (totalWidth-160)+"px",
	            cssClass: "jp-video-360p"
	        }});
      setPrecessBar();
      //设置播放图标
      setPlayIcon();
    });
    $("#jquery_jplayer_1").click(function() {
        
        if($.jPlayer.event.playing)    
            myPlaylist.pause();
        else
            myPlaylist.play();
            
    });
    //暂停显示播放图标
    $("#jquery_jplayer_1").bind($.jPlayer.event.pause, function(event) { // Using ".jp-repeat" namespace so we can easily remove this event
        $("div.jp-video-360p div.jp-video-play").css({"display":"block"});
    });
    $("#jquery_jplayer_1").bind($.jPlayer.event.play, function(event) { // Using ".jp-repeat" namespace so we can easily remove this event
        $("div.jp-video-360p div.jp-video-play").css({"display":"none"});
        updateClick();
    });
    
    $("#jquery_jplayer_1").bind($.jPlayer.event.emptied, function(event) { // Using ".jp-repeat" namespace so we can easily remove this event
        $("div.jp-video-360p div.jp-video-play").css("display","none");
        loadingShow();
    });
    
    $("#jquery_jplayer_1").bind($.jPlayer.event.loadeddata, function(event) { // Using ".jp-repeat" namespace so we can easily remove this event
        loadingHide();
        $("div.jp-video-360p div.jp-video-play").css("display","block");
    });
   
    $("#jquery_jplayer_1").bind($.jPlayer.event.waiting, function(event) { // Using ".jp-repeat" namespace so we can easily remove this event
        loadingShow();
    }); 
    $("#jquery_jplayer_1").bind($.jPlayer.event.playing, function(event) { // Using ".jp-repeat" namespace so we can easily remove this event
        loadingHide();
    });
    
   
});

function setPrecessBar(){
        var totalWidth = $("body").width();
        precessBarWidth = totalWidth - 210;
        $("div.jp-progress").css("width",precessBarWidth+"px");
}

function setJPlayer(id,type,videoId,size){
    //设置声音条码
    setPrecessBar();
    //设置播放图标
    setPlayIcon();
    myPlaylist.select(id);
    window.scrollTo(0,0);
    console.log("videoId = "+videoId);
    console.log("播放ID = "+id);
   // setPlayActive(id,size);
    for(var i=0;i<size;i++){
    	$('#x-'+i).attr("class","ui-link-inherit");
    }
    $('#x-'+id).attr("class","ui-link-inherit ui-btn-active");
    //增加标记，记录选定的项 modified by khzliu 2014年2月19日14:15:38
    videoType = type;
    playingId = videoId;
    playingFlag = 0;
    
    $("#jp_container_1").hide();
	$("#ad").show();
	timer = setInterval("CountDownS()",1000);
	maxtimes = 10;
}    

//----start-----
function CountDownS()
{   console.log("maxtimes -----=="+maxtimes);
	if(maxtimes>=0)
	{   
		console.log("time 00000");
		minutes = Math.floor(maxtimes/60);   
		seconds = Math.floor(maxtimes%60);   
		//msg = "距离结束还有 "+minutes+" 分 "+seconds+" 秒";   
		msg = "距离广告结束还有 "+seconds+" 秒"; 
		document.all["timer"].innerHTML=msg;   
		//if(maxtime == 5*60) alert('注意，还有5分钟!');   
		--maxtimes;   
	}   
	else
	{   
		console.log("time 22222");
		clearInterval(timer);
		console.log("time 33333");
		 $("#ad").hide();
		 $("#jp_container_1").show();
		//alert("时间到，结束!");   
	}   
}  
//----end-----

    //增加点击次数
    //console.log("--------------------");
function updateClick()
{
	if(playingFlag == 0)
	{
		addClicks(videoType,playingId); //modified by khzliu 2014年2月17日14:07:52
		playingFlag = 1;
	}
	
}
    


function setPlayIcon(){
    var jplayerHeight = $("#jquery_jplayer_1").height();
    $("div.jp-video-360p div.jp-video-play").css("width","100%");
    //$("div.jp-video-play").css("Height",jplayerHeight+"px");
    $("div.jp-video-360p div.jp-video-play").css("height",jplayerHeight+"px");
    $("div.jp-video-360p div.jp-video-play").css("margin-top",(-jplayerHeight)+"px");
    
}

//显示加载状态图标
function loadingShow(){
	$("canvas#canvas").css({"display":"block"}); //点击显示canvas modified by khzliu 2014年2月19日15:12:26
    loadingObj.show();
}
//隐藏加载状态图标
function loadingHide(){
	$("canvas#canvas").css({"display":"none"}); //点击隐藏canvas modified by khzliu 2014年2月19日15:12:26
    loadingObj.hide();
}
function loading(canvas,options){   
          this.canvas = canvas;   
          if(options){   
            this.radius = options.radius||12;   
            this.circleLineWidth = options.circleLineWidth||4;   
            this.circleColor = options.circleColor||'lightgray';   
            this.dotColor = options.dotColor||'gray';   
          }else{         
            this.radius = 12;   
            this.circelLineWidth = 4;   
            this.circleColor = 'lightgray';   
            this.dotColor = 'gray';   
          }   
        }   
        loading.prototype = {   
          show:function (){   
            var canvas = this.canvas;   
            if(!canvas.getContext)return;   
            if(canvas.__loading)return;   
            canvas.__loading = this;   
            var ctx = canvas.getContext('2d');   
            var radius = this.radius;         
            var rotators = [{angle:0,radius:6},{angle:12/radius,radius:8},{angle:28/radius,radius:10},{angle:48/radius,radius:12}];         
            var me = this;   
            canvas.loadingInterval = setInterval(function(){   
              ctx.clearRect(0,0,canvas.width,canvas.height);            
              var lineWidth = me.circleLineWidth;   
              //var center = {x:canvas.width/2 - radius,y:canvas.height/2-radius};
              var center = {x:canvas.width/2,y:canvas.height/2};  
              ctx.beginPath();   
              ctx.lineWidth = lineWidth;   
              ctx.strokeStyle = me.circleColor;   
              ctx.arc(center.x,center.y,radius,0,Math.PI*2);   
              ctx.closePath();   
              ctx.stroke();   
              for(var i=0;i<rotators.length;i++){           
                var rotatorAngle = rotators[i].currentAngle||rotators[i].angle;               
                //在圆圈上面画小圆   
       var rotatorCenter = {x:center.x-(radius)*Math.cos(rotatorAngle) ,y:center.y-(radius)*Math.sin(rotatorAngle)};               
                var rotatorRadius = rotators[i].radius;   
                ctx.beginPath();   
                ctx.fillStyle = me.dotColor;   
                ctx.arc(rotatorCenter.x,rotatorCenter.y,rotatorRadius,0,Math.PI*2);   
                ctx.closePath();   
                ctx.fill();   
                rotators[i].currentAngle = rotatorAngle+16/radius;   
              }   
            },50);   
          },   
          hide:function(){   
            var canvas = this.canvas;   
            canvas.__loading = false;   
            if(canvas.loadingInterval){   
              window.clearInterval(canvas.loadingInterval);   
            }   
            var ctx = canvas.getContext('2d');   
            if(ctx)ctx.clearRect(0,0,canvas.width,canvas.height);   
          }   
        };   

