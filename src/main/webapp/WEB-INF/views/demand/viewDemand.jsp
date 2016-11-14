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
<title>处理需求</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
<div style="text-align:center;margin-top:15px;">
  <a href="/demand/huishou?deid=${de.deid}">
  	<input type="button" class="btn" value="回 收"/>
  </a>
  <input id="shenhe" type="button" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')" value="审 核"/>
  <input id="chuli" type="button" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')" value="处 理"/>
  <input id="banjie" type="button" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')" value="办 结"/>
  <input id="remind" type="button" class="btn" value="催 办"/>

&nbsp;&nbsp;&nbsp;&nbsp;   
<a href="/demand/toDemandQuery">
<input type="button" name="Submit2" value="返 回" class="btn" />
</a>
<br />
</div>
<table class="table11" style="width:80%; line-height:25px;">
  <tr>
    <th style="text-align:right;">当前处理部门</th>
    <th>${sy.rolename }</th>
    <th style="text-align:right;">当前所处状态</th>
    <th>
    	<c:if test="${de.destate == 0 }">
      		待审核
      	</c:if>
      	<c:if test="${de.destate == 1 }">
      		待处理
      	</c:if>
      	<c:if test="${de.destate == 2 }">
      		待办结
      	</c:if>
      	<c:if test="${de.destate == 3 }">
      		已办结
      	</c:if>
    </th>
    <th style="text-align:right;">是否提交行长</th>
    <th>否</th>
  </tr>
  <tr>
    <td align="right">事务种类</td>
    <td>${de.ttname }</td>
    <td align="right">事务明细</td>
    <td colspan="3">${de.tdname}</td>
  </tr>
  <tr>
    <td align="right">服务保障级别</td>
    <td>${td.tdlevel }</td>
    <td align="right">是否初审</td>
    <td>
    	<c:if test="${de.destate == 0 }">
      		否
      	</c:if>
      	<c:if test="${de.destate != 0 }">
      		是
      	</c:if>
    </td>
    <td align="right">需求处理部门</td>
    <td>${de.handleDepart }</td>
  </tr>
  <tr>
    <td align="right">服务响应时间</td>
    <td>${td.responseTime } </td>
    <td align="right">服务解决时限</td>
    <td>${td.serviceTime }</td>
    <td align="right">超 时</td>
    <td>${de.overTime }</td>
  </tr>
  <tr>
    <td align="right">事务备注</td>
    <td colspan="5">${td.tdremarks }</td>
  </tr>
  <tr>
    <td align="right">需求事项描述</td>
    <td colspan="5">
	${de.dedescription }</td>
  </tr>
  <tr>
    <td align="right">上报单位</td>
    <td>${de.dedeclare }</td>
    <td align="right">上报人</td>
    <td>${de.declareName }</td>
    <td align="right">上报人联系电话</td>
    <td>${de.declareTel }</td>
  </tr>
  <tr>
    <td align="right">上报时间</td>
    <td>${de.reportTime }</td>
    <td align="right">催 办</td>
    <td>
    	<c:if test="${de.reminders == 0 }">
      		否
      	</c:if>
      	<c:if test="${de.reminders != 0 }">
      		是
      	</c:if>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right" valign="top">事务处理过程</td>
    <td colspan="5" id="serviceProcress">
      <p>
        
      </p>
    </td>
  </tr>
</table>

<!-- 弹出的页面 -->
<div id="fill" style="width:100%;height:100%;background-color:#000;position:absolute;top:0px;left:0px;opacity:0.3;display:none;z-index:100">  
</div>
<div id="myform" style="width:100%;height:100%;position:absolute;top:0px;left:0px;z-index:101;display:none">
	<form id="userdemand" action="" method="post" onsubmit="return doAdd(this)">
		<input type="hidden" name="userid" value="${us.userid}">
		<input type="hidden" name="deid" value="${de.deid}">
		<table width="340" border="0" style="margin: 20% auto; background-color: #fff">
			<tr>
				<td>催办描述：</td>
				<td>
					<textarea name="content" rows="7px" cols="25px"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type='submit' value="确认" />
				 	<input type="button" onclick="$('#fill').hide();$('#myform').hide();" value="取消" />
				 </td>
			</tr>
		</table>
	</form>
</div>

<div id="myform2" style="width:100%;height:100%;position:absolute;top:0px;left:0px;z-index:101;display:none">
	<form id="userdemand2" action="" method="post" onsubmit="return shenhe(this)">
		<input type="hidden" name="userid" value="${us.userid}">
		<input type="hidden" name="deid" value="${de.deid}">
		<table width="340" border="0" style="margin: 20% auto; background-color: #fff">
			<tr>
				<td>审核描述：</td>
				<td>
					<textarea name="content" rows="7px" cols="25px"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type='submit' value="确认" />
				 	<input type="button" onclick="$('#fill').hide();$('#myform2').hide();" value="取消" />
				 </td>
			</tr>
		</table>
	</form>
</div>
<div id="myform3" style="width:100%;height:100%;position:absolute;top:0px;left:0px;z-index:101;display:none">
	<form id="userdemand3" action="" method="post" onsubmit="return chuli(this)">
		<input type="hidden" name="userid" value="${us.userid}">
		<input type="hidden" name="deid" value="${de.deid}">
		<table width="340" border="0" style="margin: 20% auto; background-color: #fff">
			<tr>
				<td>处理描述：</td>
				<td>
					<textarea name="content" rows="7px" cols="25px"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type='submit' value="确认" />
				 	<input type="button" onclick="$('#fill').hide();$('#myform3').hide();" value="取消" />
				 </td>
			</tr>
		</table>
	</form>
</div>
<div id="myform4" style="width:100%;height:100%;position:absolute;top:0px;left:0px;z-index:101;display:none">
	<form id="userdemand4" action="" method="post" onsubmit="return banjie(this)">
		<input type="hidden" name="userid" value="${us.userid}">
		<input type="hidden" name="deid" value="${de.deid}">
		<table width="340" border="0" style="margin: 20% auto; background-color: #fff">
			<tr>
				<td>办结描述：</td>
				<td>
					<textarea name="content" rows="7px" cols="25px"></textarea>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type='submit' value="确认" />
				 	<input type="button" onclick="$('#fill').hide();$('#myform4').hide();" value="取消" />
				 </td>
			</tr>
		</table>
	</form>
</div>

<script type="text/javascript">
$(function(){  
	load("${de.deid}");
    $("#remind").click(function(){  
        $("#fill").show();  
        $("#myform").show();  
    });
    $("#shenhe").click(function(){  
        $("#fill").show();  
        $("#myform2").show();  
    });
    $("#chuli").click(function(){  
        $("#fill").show();  
        $("#myform3").show();  
    });
    $("#banjie").click(function(){  
        $("#fill").show();  
        $("#myform4").show();  
    });
    
});

function banjie(form){  
    $.ajax({  
       url:"/demand/addbanjie",  
       type:"POST",  
       data:$("#userdemand4").serialize(),  
       dataType:"json",  
       success:function(res){  
           if(res>0){  
               $('#fill').hide();  
               $('#myform4').hide();  
               load("${de.deid}");  
           }else{  
               alert('添加失败！');  
           }  
       }  
   }); 
     
   return false;  
}
function chuli(form){  
    $.ajax({  
       url:"/demand/addchuli",  
       type:"POST",  
       data:$("#userdemand3").serialize(),  
       dataType:"json",  
       success:function(res){  
           if(res>0){  
               $('#fill').hide();  
               $('#myform3').hide();  
               load("${de.deid}");  
           }else{  
               alert('添加失败！');  
           }  
       }  
   }); 
     
   return false;  
}
function shenhe(form){  
    $.ajax({  
       url:"/demand/addshenhe",  
       type:"POST",  
       data:$("#userdemand2").serialize(),  
       dataType:"json",  
       success:function(res){  
           if(res>0){  
               $('#fill').hide();  
               $('#myform2').hide();  
               load("${de.deid}");  
           }else{  
               alert('添加失败！');  
           }  
       }  
   }); 
     
   return false;  
}

function doAdd(form){  
     $.ajax({  
        url:"/demand/addUserDemand",  
        type:"POST",  
        data:$("#userdemand").serialize(),  
        dataType:"json",  
        success:function(res){  
            if(res>0){  
                $('#fill').hide();  
                $('#myform').hide();  
                load("${de.deid}");  
            }else{  
                alert('添加失败！');  
            }  
        }  
    }); 
      
    return false;  
}

function load(deid){  
    $.ajax({  
        url:"/demand/selectUserDemand",  
        type:"GET", 
        data:{deid:deid},
        dataType:"json",  
        success:function(data){  
            var str='';  
            for(var i=0;i<data.length;i++){  
                str+="<p>";  
                str+='<textarea name="textarea" rows="4" style="width:70%;" readonly="readonly">'; 
                str+=data[i].rolename+"  "+data[i].content; 
                str+="\n\n\n";
                str+="                                 处理人："+data[i].username+"   处理时间："+data[i].dealtime+"</textarea>";  
                str+="</p>";  
                  
            }  
            $("#serviceProcress").empty();  
            $("#serviceProcress").append(str);  
        }  
    });  
}
</script>
</body>
</html>