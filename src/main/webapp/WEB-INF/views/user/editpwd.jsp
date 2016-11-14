<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<base href="<%=basePath%>">
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script language="javascript" src="js/js.js"></script>
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script> 
<script type="text/javascript">
    function test(){
	    if(document.getElementById("yuan").value != ${us.userpwd}){
	    	var rst = "密码不正确";
	    	document.getElementById("msg").innerHTML=rst;
	    }else{
	    	document.getElementById("msg").innerHTML=null;
	    }
    }
    function test2(){
    	var pass1 = document.getElementById("pass1").value;
    	var pass2 = document.getElementById("pass2").value;
    	if(pass1 != pass2){
    		var rst2 = "两次密码输入不一致";
	    	document.getElementById("msg2").innerHTML=rst2;
	    }else{
	    	document.getElementById("msg2").innerHTML=null;
	    }
	}
    </script>
</head>
<body>
<form action="/editpwd" method="post">
<div style="width:30%;margin: 0 auto; margin-top:15px; ">
  <input type="hidden" name="userid" value="${us.userid}" />
  <table class="table11">
    <tr>
      <th style="padding:0 0 0 0; width:30%;"></th>
      <th style="padding:0 0 0 0;"></th>
    </tr>
    <tr>
      <th colspan="2">&nbsp;
      	<div id="msg" style="color: red"></div>
      	<div id="msg2" style="color: red"></div>
      	<div style="color: green">${mm}</div>
      </th>
    </tr>
    <tr>
      <td style="text-align:right;">旧密码</td>
      <td style="text-align:left;"><input id="yuan" type="password" style="width:85%;" onchange="test();">      </td>
    </tr>
    <tr>
      <td style="text-align:right;">新密码</td>
      <td style="text-align:left; "><input id="pass1" type="password" style="width:85%;" size="30">      </td>
    </tr>
    <tr>
      <td style="text-align:right;">确认新密码</td>
      <td style="text-align:left; "><input id="pass2" name="userpwd" type="password" style="width:85%;" size="30" onkeyup="test2();">      </td>
    </tr>
    <tr>
      <td colspan="2" align="center"><input type="submit" value="提 交" class="btn">
       
    </tr>
  </table>
</div>
</form>

</body>
</html>