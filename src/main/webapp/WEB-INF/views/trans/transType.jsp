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
<title>事务设置</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<script language="JavaScript" src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
<form action="" method="post" id="ttid">
	<table width="400" style="text-align:left;margin-top:15px;" class="tableselect">
	  <tr>
	    <td style="text-align:right;">事务种类：</td>
	    <td><input name="ttname" type="text" />    </td>
	    <td><input id="add" type="button" value="添 加" class="btn" />
	      &nbsp;&nbsp;
	      <a href="/trans/toTransSetup">
	      	<input type="button" value="返 回" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"/>
	      </a>
	    </td>
	  </tr>
	</table>
</form>
<hr style="width:98%;"/>
<table class="table11" style="width:500px;" id="ttid2">
	<thead>
	  <tr>
	    <th>事务种类</th>
	    <th style="text-align:center">操作</th>
	  </tr>
  </thead>
  <tbody>
	  <c:forEach items="${ttlist}" var="item">
		  <tr>
		    <td>${item.ttname}</td>
		    <td style="text-align:center">
		    	<a href="javascript:void(0);" onclick="doDel(${item.ttid},this)">删除</a>
		    </td>
		  </tr>
	  </c:forEach>
   </tbody>
</table>

<script type="text/javascript">
$(function(){
	$("#add").click(function(e){
		$.ajax({  
            url:"/trans/addTransType",  
            type:"POST",  
            data:$("#ttid").serialize(),
            dataType:"json",  
            success:function(data){  
                var str=null;
                for(var i=0;i<data.length;i++){  
                    str+="<tr>";  
                    str+='<td>'+data[i].ttname+'</td>';  
                    str+='<td style="text-align:center;"><a href="javascript:void(0);" onclick="doDel('+data[i].ttid+',this)">删除</a></td>'; 
                    str+="</tr>";  
                }
            	$("#ttid2 tbody").empty();  
                $("#ttid2 tbody").append(str);
            }   
        }); 
	});
	
});

function doDel(ttid,ob){  
    //执行ajax删除  
    if(confirm("确定要删除吗？"))  
    $.ajax({  
        url:"/trans/delTransType",  
        type:"POST",  
        data:{ttid:ttid},  
        dataType:"json",  
        success:function(res){  
            //判断是否删除成功  
            if(res>0){  
                //alert(res.num);  
                $(ob).parents("tr").remove();  
            }  
        },  
        error:function(){  
            alert('error');  
        }  
    });  
}
</script>
</body>
</html>