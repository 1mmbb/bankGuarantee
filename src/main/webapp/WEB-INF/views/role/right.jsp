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
<title>角色权限分配</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
	<form action="" method="post">
	<table width="98%"  class="tableselect" style="text-align:left;margin-top:15px;">
	  <thead>
	  	<tr><th><h2>
	  		角色权限分配(${role.rolename})
	  			</h2></th></tr>
	  </thead>
	  <tr><td></td></tr>
	  <tr>
	    <td>
    		<input id="save" type="button"  value="保 存"
				 class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"/>
				&nbsp;&nbsp; 
			<input type="button" class="btn"
				onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"
				value="取 消" onclick="javascript:history.go(-1);" />
	    </td>
	  </tr>
	</table>
	<hr style="width:98%;"/>
	<input id="roleidname" type="hidden" name="roleid" value="${role.roleid}"/>
	<div id="msg"></div>
	<table class="table11">
		<tr>
			<c:forEach items="${funlist}" var="fun">
				<c:if test="${fun.funpid==\"-1\"}">
					<td>
						<div class="toc">
							<h3>
								<input type="checkbox" onclick="selectparent(this)" ma="${fun.funid}" name="ckrr" value="${fun.funid}" 
								<c:if test="${fun.rr==\"1\"}">
									checked="checked"
								</c:if>
								/>
								${fun.funname}
							</h3>
							<ul style="list-style-type:none">
							<c:forEach items="${funlist}" var="child">
								<c:if test="${child.funpid==fun.funid}">
								<li>
									<input type="checkbox" onclick="selectchild(this)" parent="${fun.funid}" name="ckrr" value="${child.funid}" 
									<c:if test="${child.rr==\"1\"}">
									checked="checked"
									</c:if>
									/>
									${child.funname}
								</li>
								</c:if>
							</c:forEach>		
							</ul>
						</div>
					</td>
				</c:if>
			</c:forEach>
		</tr>
	</table>
	</form>

<script type="text/javascript">
$(function(){
	
	$("#save").click(function(e){
		var roleid = $( "#roleidname" ).val();
		var funids = $("input[type='checkbox']:checked").map(function(){
		      return $(this).val();
		}).get();
		
		$.ajax({ 
			url:"/role/saveRoleRight",  
	        type:"POST",  
	        data:{'roleid':roleid,'funids':funids},  
	        dataType:"json",  
	        traditional: true,  
	        success:function(res){  
	            if(res>0){
	            	var str ='<td colspan="2" style="text-align: center; color: green;">保存角色权限成功</td>'; 
	            	$("#msg").append(str);
	            }else{  
	            	var str ='<td colspan="2" style="text-align: center; color: red;">保存角色权限失败</td>'; 
	            	$("#msg").append(str); 
	            }  
	        }
		});
	});
});
</script>
<script>
	function selectparent(obj){
		var ma = $(obj).attr("ma");
		
		var objs = $("[parent='"+ma+"']");
		if($(obj).attr("checked")=="checked"){
			for(var i=0;i<objs.length;i++){
				$(objs[i]).attr("checked","checked");
			}
		}else{
			for(var i=0;i<objs.length;i++){
				$(objs[i]).removeAttr("checked");
			}
		}
	}
	
	function selectchild(obj){
		var parent = $(obj).attr("parent");
		var objs = $("[ma='"+parent+"']");
		if($(obj).attr("checked")=="checked"){
			objs.attr("checked","checked");
		}else{
			var children =  $("[parent='"+parent+"']");
			var bl = false;
			for(var i=0;i<children.length;i++){
				if($(children[i]).attr("checked")=="checked"){
					bl = true;
					break;
				}
			}
			if(!bl){
				objs.removeAttr("checked");
			}
		}
	}
	
</script>
</body>
</html>