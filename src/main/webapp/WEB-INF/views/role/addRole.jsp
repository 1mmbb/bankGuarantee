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
<title>增加角色</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
	<form action="" method="post" id="addRoleid">
		<table class="table11" style="width: 900px; margin-top: 15px;">
			<tr>
				<th colspan="2" style="text-align: center;">新增角色</th>
			</tr>
			<tr id="msg">
				
			</tr>
			<tr>
				<td align="right">角色名称：</td>
				<td>
					<label><input name="rolename" type="text" /></label>
				</td>
			</tr>
			<tr>
				<td align="right">角色说明：</td>
				<td>
					<label><input name="roledesc" type="text" /></label>
				</td>
			</tr>
			<tr>
				<td align="right">角色状态：</td>
				<td>
					<select name="rolestate" style="width: 80px;">
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
			url:"/role/addRole",  
	        type:"POST",  
	        data:$("#addRoleid").serialize(),  
	        dataType:"json",  
	        success:function(res){  
	            if(res>0){
	            	var str ='<td colspan="2" style="text-align: center; color: green;">添加角色成功</td>'; 
	            	$("#msg").append(str);
	            }else{  
	            	var str ='<td colspan="2" style="text-align: center; color: red;">添加角色失败</td>'; 
	            	$("#msg").append(str); 
	            }  
	        }
		});
	});
});
</script>
</body>
</html>