<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户列表</title>
<script language="javascript" src="js/js.js"></script>
<script language="JavaScript" src="js/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="js/dialog/lhgcore.js" type="text/javascript"></script>
<script language="JavaScript" src="js/dialog/lhgdialog/lhgdialog.js" type="text/javascript"></script>
<script type="text/javascript" charset="UTF-8">
        function showDialog(pageName) {
            J.dialog.get({ id: 'showDialog', title: '备注说明', page: pageName, cover: true });
        }
</script>
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script> 


</head>
<body>
<table width="98%"  class="tableselect" style="text-align:left;margin-top:15px;">
  <tr>
    
    <td>
    	<form action="" method="post">
    		<input id="inputname" name="username" type="text" size="30" placeholder="用户名..."/>
    		<input type="button" id="search" value="查 询" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')" />
    		<a href="/toAddUser" style="text-decoration:none">
    			<input type="button" value="+新 增" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')" />
    		</a>
    	</form>
    </td>
  </tr>
</table>
<hr style="width:98%;"/>

<table class="table11" id="userid">
	<thead>
	  <tr>
	    <th style="text-align:center;">用户名</th>
	    <th style="text-align:center;">用户姓名</th>
	    <th style="text-align:center;">用户角色</th>
	    <th style="text-align:center;">用户状态</th>
	    <th style="text-align:center;">编辑</th>
	  </tr>
	</thead>
  <tbody>
	  <c:if test="${!empty pi.list }">
	  	<c:forEach items="${pi.list}" var="item">
	  		<tr>
				<td style="text-align:center;">
					${item.username}
				</td>
				<td style="text-align:center;">
					${item.usertruename}
				</td>
				<td style="text-align:center;">
					${item.rolename}
				</td>
				<td style="text-align:center;">
					<c:choose>
						<c:when test="${item.userstate==\"1\"}">
							正常		
						</c:when>
						<c:otherwise>锁定</c:otherwise>
					</c:choose>
				</td>
				<td style="text-align:center;">
					<a href="/selectUserByid?userid=${item.userid}">编辑</a>
				</td>
			</tr>
		</c:forEach>
	  </c:if>
  </tbody>
  
</table>

<div id="pageid">
	<span>当前第
		<span style="color:red">${pi.current }</span>
		页/共
		<span style="color:red">${pi.count }</span>
		条/
		<span style="color:red">${pi.total }</span>
		页
	</span>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<c:if test="${pi.current gt 1 }">
		<a href="javascript:void(0);" onclick="selUserByNamePage('',1)">首页</a>
		<a href="javascript:void(0);" onclick="selUserByNamePage('',${pi.current - 1 })">上一页</a>
	</c:if>
	
	<c:if test="${pi.current lt pi.total }">
		<a href="javascript:void(0);" onclick="selUserByNamePage('',${pi.current + 1 })">下一页</a>
		<a href="javascript:void(0);" onclick="selUserByNamePage('',${pi.total})">尾页</a>
	</c:if>
</div>
<script type="text/javascript">
	
	 $(function(){
		
		$("#search").click(function(e){
			//alert(e);
			$.ajax({  
                url:"/selectAllUserByName",  
                type:"POST",  
                data:{'name':$( "#inputname" ).val()},
                dataType:"json",  
                success:function(data){  
                    var str=null;
                    var li = data.list;
                    var name2 = $( "#inputname" ).val();
                    for(var i=0;i<li.length;i++){  
                        str+="<tr>";  
                        str+='<td style="text-align:center;">'+li[i].username+'</td>';  
                        str+='<td style="text-align:center;">'+li[i].usertruename+'</td>';  
                        str+='<td style="text-align:center;">'+li[i].rolename+'</td>'; 
						if(li[i].userstate==1){
							str+='<td style="text-align:center;">正常</td>'; 
						}else{
							str+='<td style="text-align:center;">锁定</td>';
						}
                        str+='<td style="text-align:center;"><a href=\"selectUserByid?userid='+li[i].userid+'\">编辑</a></td>';  
                        str+="</tr>";  
                          
                    }
                    
                   var pagestr = '<span>当前第<span style="color:red;">'+data.current+'</span>页/共'+
			                    '<span style="color:red;">'+data.count+'</span>条/'+
			                    '<span style="color:red;">'+data.total+'</span>页'+
			            		'</span>'+
			            		'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			       if(data.current > 1){
			    	   var pagestr2 = '<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\',1)">首页</a>'+
			    	   				'<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\','+(data.current-1)+')">上一页</a>';
			       }
			       if(data.current < data.total ){
			    	   var pagestr3 = '<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\','+(data.current+1)+')">下一页</a>'+
			    		   			'<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\','+data.total+')">尾页</a>';
	
			       }
			        
                	$("#userid tbody").empty();  
                    $("#userid tbody").append(str);        	
			        
            		$("#pageid").empty();  
                    $("#pageid").append(pagestr);
                    $("#pageid").append(pagestr2);
                    $("#pageid").append(pagestr3);
                }   
            }); 
		});
		
	});
	
	//$("span").on("click", 'a', function(){
		
		//});
	 function selUserByNamePage(name,current){  
         $.ajax({  
             url:"/selectAllUserByName",  
             type:"POST",  
             data:{'name':name,'current':current},
             dataType:"json",  
             success:function(data){  
            	 var str=null;
                 var li = data.list;
                 var name2 = name;
                 for(var i=0;i<li.length;i++){  
                     str+="<tr>";  
                     str+='<td style="text-align:center;">'+li[i].username+'</td>';  
                     str+='<td style="text-align:center;">'+li[i].usertruename+'</td>';  
                     str+='<td style="text-align:center;">'+li[i].rolename+'</td>';  
                     if(li[i].userstate==1){
						 str+='<td style="text-align:center;">正常</td>'; 
					 }else{
						 str+='<td style="text-align:center;">锁定</td>';
					 }
                     str+='<td style="text-align:center;"><a href=\"selectUserByid?userid='+li[i].userid+'\">编辑</a></td>';  
                     str+="</tr>";  
                       
                 } 
                 
                 var pagestr = '<span>当前第<span style="color:red;">'+data.current+'</span>页/共'+
			                 '<span style="color:red;">'+data.count+'</span>条/'+
			                 '<span style="color:red;">'+data.total+'</span>页'+
			         		'</span>'+
			         		'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;';
			       if(data.current > 1){
			    	   var pagestr2 = '<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\',1)">首页</a>'+
			    	   				'<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\','+(data.current-1)+')">上一页</a>';
			       }
			       if(data.current < data.total ){
			    	   var pagestr3 = '<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\','+(data.current+1)+')">下一页</a>'+
			    		   			'<a href="javascript:void(0);" onclick="selUserByNamePage(\''+name2+'\','+data.total+')">尾页</a>';
	
			       }
                 
                 $("#userid tbody").empty();  
                 $("#userid tbody").append(str);        	
			        
         		 $("#pageid").empty();  
                 $("#pageid").append(pagestr);
                 $("#pageid").append(pagestr2);
                 $("#pageid").append(pagestr3);  
             }  
         });  
     }
</script>
</body>
</html>