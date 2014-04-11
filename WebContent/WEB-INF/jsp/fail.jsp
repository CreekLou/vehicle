<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车载系统</title>
</head>

<%

    String Ag = request.getHeader("User-Agent");
    if(Ag!=null){
        //out.println(Ag);
        //System.out.println("fail.jsp: "+Ag);
        //String url = (String)request.getAttribute("javax.servlet.forward.request_uri");
        //System.out.println("fail.jsp: "+url);
        //System.out.println("");
        
        String Agent = Ag.toLowerCase();
        if(Agent.indexOf("captive")>-1){
            response.setStatus(404);
	}else{
            response.setStatus(200);
        }
    }else{
        response.setStatus(200);
        //System.out.println("fail.jsp: Ag is null");
        //String url = (String)request.getAttribute("javax.servlet.forward.request_uri");
        //System.out.println("fail.jsp: "+url);
        //System.out.println("");
    }

    //String url = (String)request.getAttribute("javax.servlet.forward.request_uri");
    //out.println(url);
    
    /*
    if(url.indexOf("ping.html")>0){
		response.setStatus(200);
	}
    if(url.indexOf("wifi.html")>0){
		response.setStatus(200);
	}
    if(url.indexOf("generate_204")>0){
		response.setStatus(200);
	}
    if(url.indexOf("list.html")>0){
		response.setStatus(200);
	}
    */
%>

  

<script>
window.location.href="http://www.letu.com";
</script>

