/**
 * 得到ajax对象
 */
function getajaxHttp() {
    var xmlHttp;
    try {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
        } catch (e) {
            // Internet Explorer
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
            try {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
                alert("您的浏览器不支持AJAX！");
                return false;
            }
        }
    }
    return xmlHttp;
}
/**
 * 发送ajax请求
 * url--url
 * methodtype(post/get)
 * con (true(异步)|false(同步))
 * parameter(参数)
 * functionName(回调方法名，不需要引号,这里只有成功的时候才调用)
 * (注意：这方法有二个参数，一个就是xmlhttp,一个就是要处理的对象)
 * obj需要到回调方法中处理的对象
 */
function addClicks(type,id){
	 var url = '/media/addClicks-'+type+'-'+id+'.do';
	 console.log("url = "+url);
    var url1 = "UpdateClicks?type="+type+"&id="+id;
    var xmlhttp=getajaxHttp();
    xmlhttp.onreadystatechange=function(){
        if(xmlhttp.readyState==4){
            //HTTP响应已经完全接收才调用
            if(xmlhttp.responseText==0){
                alert("服务器错误！！！");
		window.location.href="http://192.168.5.1/index.jsp";
            }else {
		updateNumber(id);
            }
        }
    };
    xmlhttp.open("POST",url,true);
    xmlhttp.send();
}

function updateNumber(id){
    var number = parseInt($("#"+id).text());
    $("#"+id).text(number + 1);
}