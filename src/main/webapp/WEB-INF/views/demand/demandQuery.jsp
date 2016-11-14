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
<title>事务处理</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body onload="myfunction()">
<table class="table11" cellpadding="0" cellspacing="0" style="margin:0px auto;margin-top:15px;">
    <tr>
      <th style="width:70px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:180px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:60px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:50px;padding:0;"></th>
    </tr>
    <tr>
      <th colspan="8" style="text-align:center;color:#ffffff;background: url('images/menu_bg.jpg') repeat-x;height:20px;padding:0;">待办理</th>
    </tr>
    <tr>
      <th style="width:80px;">状态</th>
      <th style="width:100px;">事务种类</th>
      <th style="width:150px;">事务明细</th>
      <th style="width:100px;">上报单位</th>
      <th style="width:100px;">超时时间</th>
      <th style="width:60px;">催办次数</th>
      <th style="width:100px;">上报时间</th>
      <th style="width:40px;">操作</th>
    </tr>
    <c:forEach items="${notdlist}" var="item">
	    <tr>
	      <td>
	      	<c:if test="${item.destate == 0 }">
	      		待审核
	      	</c:if>
	      	<c:if test="${item.destate == 1 }">
	      		待处理
	      	</c:if>
	      	<c:if test="${item.destate == 2 }">
	      		待办结
	      	</c:if>
	      </td>
	      <td>${item.ttname}</td>
	      <td>${item.tdname}</td>
	      <td>${item.dedeclare}</td>
	      <td><div id=${item.deid }>${item.overTime}</div></td>
	      <td>${item.reminders}次</td>
	      <td>${item.reportTime}</td>
	      <td><a href="/demand/toViewDemand?deid=${item.deid }&tdid=${item.tdid}">查看</a></td>
	    </tr>
    </c:forEach>
</table>
  <br/>
  
  <table class="table11" cellpadding="0" cellspacing="0" style="margin:0 auto;">
  	<tr>
      <th style="width:70px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:180px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:60px;padding:0;"></th>
      <th style="width:100px;padding:0;"></th>
      <th style="width:50px;padding:0;"></th>
    </tr>
    <tr>
      <th colspan="8" style="text-align:center;color:#ffffff;background: url('images/menu_bg.jpg') repeat-x;height:20px;padding:0;">受理完毕</th>
    </tr>
    
    <tr>
      <th>状态</th>
      <th>事务种类</th>
      <th style="width:150px;">事务明细</th>
      <th style="width:120px;">上报单位</th>
      <th style="width:60px;">超时时间</th>
      <th style="width:60px;">催办次数</th>
      <th style="width:150px;">上报时间</th>
      <th style="width:80px;">操作</th>
    </tr>
    
    <c:forEach items="${dlist}" var="item">
	    <tr>
	      <td>
	      	<c:if test="${item.destate == 3 }">
	      		已办结
	      	</c:if>
	      </td>
	      <td>${item.ttname}</td>
	      <td>${item.tdname}</td>
	      <td>${item.dedeclare}</td>
	      <td>${item.overTime}</td>
	      <td>${item.reminders}次</td>
	      <td>${item.reportTime}</td>
	      <td><a href="/demand/toViewDemand?deid=${item.deid }&tdid=${item.tdid}">查看</a></td>
	    </tr>
    </c:forEach>
  </table>
  
<script type="text/javascript">
function myfunction(){
	var nowtime = (new Date()).getTime(); 
	//alert(nowtime);
	$.ajax({ 
		url:"/demand/toDemandQuery2",  
        type:"POST",  
        dataType:"json",  
        success:function(data){  
        	for(var i=0;i<data.length;i++){ 
        		var vt = data[i].overTime;
        		vt = vt.replace(/-/g,"/");
        		//alert(vt);
        		var overtime = (new Date(vt )).getTime();
        		var a = nowtime-overtime;
        		if(a>0){
        			$("#"+data[i].deid).attr("style", "color:red");
        		}
        	}
              
        }
	});
	
}
/*用window.onload调用myfun()*/
window.onload=myfunction;//不要括号

</script>
</body>
</html>