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
<title>编辑角色</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
	<form action="" method="post" id="editRoleid">
		<table class="table11" style="width: 900px; margin-top: 15px;">
			<tr>
				<th colspan="2" style="text-align: center;">编辑角色</th>
			</tr>
			<tr id="msg">
				
			</tr>
			<tr>
				<td align="right">角色名称：</td>
				<td>
					<label>
						<input type="hidden" name="roleid" value="${role.roleid}" />
						<input type="text" name="rolename" value="${role.rolename}">
					</label>
				</td>
			</tr>
			<tr>
				<td align="right">角色说明：</td>
				<td>
					<label><input name="roledesc" type="text" value="${role.roledesc }"/></label>
				</td>
			</tr>
			<tr>
				<td align="right">角色状态：</td>
				<td>
					<select name="rolestate">
						<c:choose>
							<c:when test="${role.rolestate==\"1\"}">
							<option value="1" selected="selected">正常</option>
							<option value="0">锁定</option>		
							</c:when>
							<c:otherwise>
							<option value="1">正常</option>
							<option value="0" selected="selected">锁定</option>	
							</c:otherwise>
						</c:choose>
					</select>
				</td>
			</tr>
	
			<tr>
				<td colspan="2" align="center"><label> 
					<input id="edit" type="button"  value="保 存"
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
	
	$("#edit").click(function(e){
		$.ajax({ 
			url:"/role/editRole",  
	        type:"POST",  
	        data:$("#editRoleid").serialize(),  
	        dataType:"json",  
	        success:function(res){  
	            if(res>0){
	            	var str ='<td colspan="2" style="text-align: center; color: green;">角色修改成功</td>'; 
	            	$("#msg").append(str);
	            }else{  
	            	var str ='<td colspan="2" style="text-align: center; color: green;">角色修改失败</td>';
	            	$("#msg").append(str);  
	            }  
	        }
		});
	});
});
</script>
</body>
</html>