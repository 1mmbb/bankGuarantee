<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
	<form action="" method="post" id="addUserid">
		<table class="table11" style="width: 900px; margin-top: 15px;">
			<tr>
				<th colspan="2" style="text-align: center;">添加用户信息</th>
			</tr>
			<tr>
				<td id="msg" colspan="2" style="text-align: center; color: red;">
					
				</td>
			</tr>
			<tr>
				<td align="right">用户名：</td>
				<td>
					<label><input name="username" type="text" /></label>
				</td>
			</tr>
			<tr>
				<td align="right">用户姓名：</td>
				<td>
					<label><input name="usertruename" type="text" /></label>
				</td>
			</tr>
			<tr>
				<td align="right">角色：</td>
				<td>
					<select name="roleid">
						<c:forEach items="${roleList}" var="item">
							<c:choose>
								<c:when test="${item.roleid == user.roleid}">
									<option value="${item.roleid }" selected="selected">${item.rolename }</option>
								</c:when>
								<c:otherwise>
									<option value="${item.roleid }">${item.rolename }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">用户状态：</td>
				<td>
					<select name="userstate" style="width: 80px;">
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
			url:"/addUser",  
	        type:"POST",  
	        data:$("#addUserid").serialize(),  
	        dataType:"json",  
	        success:function(res){  
	            if(res>0){
	            	if(confirm("是否继续添加用户信息？")){
	            		$("input[type=reset]").trigger("click");
	            	}else{
	            		 window.location.href = '/selectAllUser';
	            	}
	            }else{  
	                //alert('添加失败！');  
	            	document.getElementById("msg").innerHTML="添加失败";
	            }  
	        }
		});
	});
});
</script>
</body>
</html>