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
<table width="700" style="text-align:left;margin-top:15px;" class="tableselect">
  <tr>
    <td style="text-align:right;">事务明细：</td>
    <td><input id="inputname" name="tdname" type="text" />    </td>
    
    <td><input id="search" type="button" value="查 询" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')"/>
      &nbsp;&nbsp;
      <a href="/trans/toAddTrans">
      	<input name="add" type="button" value="添加事务明细" class="btn2"/>
      </a>
    </td>
    <td>
    	<a href="/trans/toTransType">
    		<input name="add2" type="button" value="设置事务种类" class="btn2" />
    	</a>
    </td>
  </tr>
</table>
<hr style="width:98%;"/>
<table class="table11" style="margin:0 auto;" id="transid">
	<thead>
		<tr>
		    <th>事务明细</th>
		    <th>事务种类</th>
		    <th>初审时限</th>
		    <th>响应时限</th>
		    <th>解决时限</th>
		    <th style="text-align:center">操作</th>
		  </tr>
	</thead>
	<tbody>
		<c:if test="${!empty pi.list }">
	  		<c:forEach items="${pi.list}" var="item">
	  			<tr>
				    <td>${item.tdname}</td>
				    <td>${item.ttname}</td>
				    <td>${item.firstTime}</td>
				    <td>${item.responseTime}</td>
				    <td>${item.serviceTime }</td>
				    <td style="text-align:center">
				    	<a href="/trans/toEditTrans?tdid=${item.tdid }">编辑</a>&nbsp;&nbsp;
				    	<a href="javascript:void(0);" onclick="doDel(${item.tdid},this)">删除</a>
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
			$.ajax({  
                url:"/trans/selectAllTDByTDName",  
                type:"POST",  
                data:{'name':$( "#inputname" ).val()},
                dataType:"json",  
                success:function(data){  
                    var str=null;
                    var li = data.list;
                    var name2 = $( "#inputname" ).val();
                    for(var i=0;i<li.length;i++){  
                        str+="<tr>";  
                        str+='<td>'+li[i].tdname+'</td>';  
                        str+='<td>'+li[i].ttname+'</td>';  
                        str+='<td>'+li[i].firstTime+'</td>'; 
                        str+='<td>'+li[i].responseTime+'</td>'; 
                        str+='<td>'+li[i].serviceTime+'</td>'; 
                        str+='<td style="text-align:center;"><a href=\"/trans/toEditTrans?tdid='+li[i].tdid+'\">编辑</a>&nbsp;&nbsp';
                        str+='<a href=\"javascript:void(0);\" onclick="doDel('+li[i].tdid+',this)">删除</a></td>';
				    	
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
			        
                	$("#transid tbody").empty();  
                    $("#transid tbody").append(str);        	
			        
            		$("#pageid").empty();  
                    $("#pageid").append(pagestr);
                    $("#pageid").append(pagestr2);
                    $("#pageid").append(pagestr3);
                }   
            }); 
		});
		
	});

	 function selUserByNamePage(name,current){  
         $.ajax({  
             url:"/trans/selectAllTDByTDName",  
             type:"POST",  
             data:{'name':name,'current':current},
             dataType:"json",  
             success:function(data){  
            	 var str=null;
                 var li = data.list;
                 var name2 = name;
                 for(var i=0;i<li.length;i++){  
                	 str+="<tr>";  
                     str+='<td>'+li[i].tdname+'</td>';  
                     str+='<td>'+li[i].ttname+'</td>';  
                     str+='<td>'+li[i].firstTime+'</td>'; 
                     str+='<td>'+li[i].responseTime+'</td>'; 
                     str+='<td>'+li[i].serviceTime+'</td>'; 
                     str+='<td style="text-align:center;"><a href=\"/trans/toEditTrans?tdid='+li[i].tdid+'\">编辑</a>&nbsp;&nbsp';
                     str+='<a href=\"javascript:void(0);\" onclick="doDel('+li[i].tdid+',this)">删除</a></td>'; 
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
                 
                 $("#transid tbody").empty();  
                 $("#transid tbody").append(str);        	
			        
         		 $("#pageid").empty();  
                 $("#pageid").append(pagestr);
                 $("#pageid").append(pagestr2);
                 $("#pageid").append(pagestr3);  
             }  
         });  
     }
	 
	 function doDel(tdid,ob){  
		    if(confirm("确定要删除吗？"))  
		    $.ajax({  
		        url:"/trans/delTrans",  
		        type:"POST",  
		        data:{tdid:tdid},  
		        dataType:"json",  
		        success:function(res){  
		            //判断是否删除成功  
		            if(res>0){  
		                $(ob).parents("tr").remove();  
		            }  
		        },  
		        error:function(){  
		            alert('删除失败！');  
		        }  
		    });  
		}
</script>
</body>
</html>