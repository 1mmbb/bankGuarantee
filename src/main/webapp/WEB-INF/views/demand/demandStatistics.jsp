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
<title>需求统计</title>
<base href="<%=basePath%>">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
<script language="javascript" src="js/js.js"></script>
<script language="JavaScript" src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function gtChange(){
	var flag = document.getElementById("graphType").value;
	if (flag == 1) {
		document.getElementById("year").style.display = "";
		document.getElementById("halfYear").style.display = "none";
		document.getElementById("month").style.display = "";
	} else if (flag == 2) {
		document.getElementById("year").style.display = "";
		document.getElementById("halfYear").style.display = "";
		document.getElementById("month").style.display = "none";
	} else {
		document.getElementById("year").style.display = "";
		document.getElementById("halfYear").style.display = "none";
		document.getElementById("month").style.display = "none";
	}
}
function gtChangeS(){
	var flag = document.getElementById("graphTypeS").value;
	if (flag == 1) {
		document.getElementById("yearS").style.display = "";
		document.getElementById("halfYearS").style.display = "none";
		document.getElementById("monthS").style.display = "";
	} else if (flag == 2) {
		document.getElementById("yearS").style.display = "";
		document.getElementById("halfYearS").style.display = "";
		document.getElementById("monthS").style.display = "none";
	} else {
		document.getElementById("yearS").style.display = "";
		document.getElementById("halfYearS").style.display = "none";
		document.getElementById("monthS").style.display = "none";
	}
}
</script>
</head>
<body>
<table width="98%" style="text-align:center;margin-top:15px;">
  <tr>
    <td>
    	<form action="/demand/excel" method="post">
	       <table class="table11" style=" text-align:center; width:500px;;">
	        <tr>
	          <th style="text-align:center;">需求明细</th>
	        </tr>
	        <tr>
	          <td>统计时间：
	            <input name="firsttime" type="text" class="Wdate" onclick="WdatePicker();" size="15"/>
	            &nbsp;&nbsp;至&nbsp;&nbsp;
	            <input name="lasttime" type="text" class="Wdate" onclick="WdatePicker();" size="15"/></td>
	        </tr>
	        <tr>
	          <td>
	          	<input name="button4" type="submit" value="导出" class="btn"/>
	          </td>
	        </tr>
	      </table>
	   </form>
    </td>
    <td></td>
  </tr>
  <tr>
    <td></td>
    <td></td>
  </tr>
</table>
<br/>
</body>
</html>