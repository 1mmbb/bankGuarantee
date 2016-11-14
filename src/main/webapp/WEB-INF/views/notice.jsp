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
<title>系统公告</title>
<base href="<%=basePath%>">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<STYLE type=text/css>
#demo a div{
	height:20px;
	color:#FF0000;
}
#demo a {
width:100%;
overflow:hidden;
font:12px/16px tahoma;
display:block;
text-decoration:none;
margin:2px;
color:#4a551c;
padding-left:2px;
text-align:left;
}
</STYLE>
</head>
<body>
<div class="topbtStyle">
	<a href="/notice/toaddNotice">
  		<input name="pizhun" type="button" value="写 新 公 告"  class="btn2" onmouseover="changebg(this,'2')" onmouseout="changebg(this,'2')"/>
	</a>
</div>
<hr/>
<table class="table11" style="width:90%;">
  <tr>
    <th style="text-align:center;">最近一周的公告</th>
  </tr>

    <tr>
      <td><div id="demo" style="overflow:hidden;height:100px;border:1px solid #dde5bc;">
          <div id="demo1"> 
          	<c:forEach items="${notices }" var="notice">
          		<a href="#">
            	<div><font style="font-weight:bold;">>>&nbsp;&nbsp;${notice.rolename }</font>&nbsp;&nbsp;&nbsp;&nbsp;${notice.noticetime }&nbsp;&nbsp;&nbsp;&nbsp;发表公告：${notice.noticecon }</div>
          		</a>
          	</c:forEach>
          </div>
          <div id="demo2"></div>
        </div>
        <script>
			var speed=40
			var demo=document.getElementById("demo");
			var demo2=document.getElementById("demo2");
			var demo1=document.getElementById("demo1");
			demo2.innerHTML=demo1.innerHTML
			function Marquee(){
			if(demo2.offsetTop-demo.scrollTop<=0)
			demo.scrollTop-=demo1.offsetHeight
			else{
			demo.scrollTop++
			}
			}
			var MyMar=setInterval(Marquee,speed)
			demo.onmouseover=function(){clearInterval(MyMar)}
			demo.onmouseout=function(){MyMar=setInterval(Marquee,speed)}
		</script>
      </td>
    </tr>
</table>
<br />
<br />
  <form method="post" name="myform" id="myform">
<table class="table11" style="width:90%;">
  <tr>
    <th>公告发布部门</th>
    <th style="width:500px;">公告内容</th>
    <th style="text-align:center;">发布时间</th>
    <th style="text-align:center;">操作</th>
  </tr>
  <c:forEach items="${notices }" var="notice">
    <tr>
      <td>${notice.rolename }</td>
      <td>${notice.noticecon }</td>
      <td style="text-align:center;">${notice.noticetime }</td>
      <td style="text-align:center;"><a href="javascript:void(0);" onclick="doDel(${notice.niticeid },this)">删除</a></td>
    </tr>
  </c:forEach>
</table>

 </form>
 
<script type="text/javascript">
function doDel(noticeid,ob){  
    if(confirm("确定要删除吗？"))  
    $.ajax({  
        url:"/notice/delNotice",  
        type:"POST",  
        data:{noticeid:noticeid},  
        dataType:"json",  
        success:function(res){  
            
            var str=null;
            for(var i=0;i<res.length;i++){
            	str+='<a href="#">';
            	str+='<div><font style="font-weight:bold;">>>&nbsp;&nbsp;'+res[i].rolename+'</font>&nbsp;&nbsp;&nbsp;&nbsp;'+res[i].noticetime+'&nbsp;&nbsp;&nbsp;&nbsp;发表公告：'+res[i].noticecon+'</div>';
            	str+='</a>';
            }
            $(ob).parents("tr").remove();
            $("#demo1").empty();  
            $("#demo1").append(str); 
        },  
        error:function(){  
            alert('删除失败！');  
        }  
    });  
}
</script>
</body>
</html>