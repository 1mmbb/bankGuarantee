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
<title>增加系统功能</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
	<form action="" method="post" id="addFunid">
		<table class="table11" style="width: 900px; margin-top: 15px;">
			<tr>
				<th colspan="2" style="text-align: center;">添加功能信息</th>
			</tr>
			<tr id="msg">
				
			</tr>
			<tr>
				<td align="right">父功能名称：</td>
				<td>
					<c:choose>
						<c:when test="${pid==0}">
							<input type="hidden" name="funpid" value="-1" />
							<input type="text" name="funpname" value="无"
								readonly="readonly">			
						</c:when>
						<c:otherwise>
							<input type="hidden" name="funpid" value="${pid}" />
							<input type="text" name="funpname" value="${pname}" 
								 readonly="readonly">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td align="right">功能名称：</td>
				<td>
					<label><input name="funname" type="text" /></label>
				</td>
			</tr>
			<tr>
				<td align="right">功能地址：</td>
				<td>
					<label><input name="funurl" type="text" /></label>
				</td>
			</tr>
			<tr>
				<td align="right">功能状态：</td>
				<td>
					<select name="funstate" style="width: 80px;">
						<option selected="selected" value="1">正常</option>
						<option value="0">锁定</option>
					</select>
				</td>
			</tr>
	
			<tr>
				<td colspan="2" align="center"><label> 
					<input id="add" type="button"  value="保 存"
						 class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"/>
						&nbsp;&nbsp; 
					<input type="reset" class="btn"
						onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"
						value="重 置" /> &nbsp;&nbsp; 
					<input type="button" class="btn"
						onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"
						value="返 回" onclick="javascript:history.go(-1);" />
				</label></td>
			</tr>
		</table>
	</form>

<script type="text/javascript">
$(function(){
	
	$("#add").click(function(e){
		$.ajax({ 
			url:"/function/addFunction",  
	        type:"POST",  
	        data:$("#addFunid").serialize(),  
	        dataType:"json",  
	        success:function(res){  
	            if(res>0){
	            	var str ='<td colspan="2" style="text-align: center; color: green;">添加功能成功</td>'; 
	            	$("#msg").append(str);
	            }else{  
	            	var str ='<td colspan="2" style="text-align: center; color: red;">添加功能失败</td>'; 
	            	$("#msg").append(str); 
	            }  
	        }
		});
	});
});
</script>
</body>
</html>