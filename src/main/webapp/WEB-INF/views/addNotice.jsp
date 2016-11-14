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
<title>发布新公告</title>
<base href="<%=basePath%>">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<br />
<table class="table11" style="width:90%;">
  <tr>
    <th style="text-align:center;">最近一周的公告</th>
  </tr>
  <form method="post" name="myform" id="myform">
    <tr>
      <td style="height:100px; color:#FF0000;"><marquee direction="up" height="100%" scrollamount="2" onmousemove="this.stop()" onmouseout="this.start()">
        <c:forEach items="${notices }" var="notice">
          	 <div style="height:20px;"><font style="font-weight:bold;">&gt;&gt;&nbsp;&nbsp;${notice.rolename }</font>&nbsp;&nbsp;&nbsp;&nbsp;${notice.noticetime }&nbsp;&nbsp;&nbsp;&nbsp;发表公告：${notice.noticecon }</div>
        </c:forEach>
        </marquee>
      </td>
    </tr>
  </form>
</table>
<br /><br />
<form action="/notice/addNotice" method="post" name="myform" id="myform">
<table class="table11" style="width:90%; text-align:center;">
  <tr>
    <th style="text-align:center;">公告内容</th>
  </tr>
  
    <tr>
      <td><textarea name="noticecon" cols="100" rows="5"></textarea></td>
    </tr>
    <tr>
      <td>
      <input type="submit" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')" value="提 交"/>&nbsp;
      <a href="/notice/toNotice">
      	<input type="button" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"  value="取 消"/>
      </a>
      </td>
    </tr>
</table>
</form>
</body>
</html>