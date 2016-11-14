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
<title>业务申报</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script>
</head>
<body>
  <form action="/demand/AddDemand" method="post">
<table class="table11"  style="width:900px;margin-top:15px;">
  <tr>
    <th colspan="6" style="text-align:center;">选填新需求详细信息</th>
  </tr>
  <tr>
    <td align="right">事务种类</td>
    <td>
      <select id="tt" size="1" onChange="tdetail();">
      	 <option value="-1" selected="selected">--请选择--</option>
	     <c:forEach items="${ttlist}" var="item">
			<option value="${item.ttid }">${item.ttname }</option>
		 </c:forEach>
	   </select>
    </td>
    <td align="right">事务明细</td>
    <td colspan="3">
		<select id="td" name="tdid"  onChange="tdetail2();">
			
	    </select>	
    </td>
  </tr>
  <tr>
    <td align="right">服务保障级别</td>
    <td>
    	<select id="fuwu" name="tdlevel" disabled="true">
        	<option value="无" selected="selected">无</option>
        	<option value="一级">一级</option>
        	<option value="二级">二级</option>
      	</select>
    </td>
    <td align="right">是否初审</td>
    <td>
    	<input name="iftrial" type="text" value="否" disabled="true"/>
    </td>
    <td align="right">需求处理部门</td>
    <td>
    	<input name="handleDepart" type="text"/>
   </td>
  </tr>
  <tr>
    <td align="right">服务响应时间</td>
    <td>
    	<input id="response" type="text" disabled="true"/>
    </td>
    <td align="right">服务解决时限</td>
    <td>
    <input id="service" type="text" disabled="true"/>
    </td>
    <td align="right">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td align="right">事务备注</td>
    <td colspan="5" id="remarks"></td>
  </tr>
  <tr>
    <td align="right">需求事项描述</td>
    <td colspan="5">
	请简要描述需求解决事项的现状、数量、缓急程度等<br />
	<label>
      <textarea name="dedescription" cols="100" rows="5"></textarea>
      </label></td>
  </tr>
  <tr>
    <td align="right">需求申报点</td>
    <td><select name="dedeclare">
        <option value="网管中心" selected="selected">网管中心</option>
        <option value="游仙支行">游仙支行</option>
		<option value="三台支行">三台支行</option>
      </select></td>
    <td align="right">需求申报人姓名</td>
    <td><label>
      <input name="declareName" type="text" />
      </label></td>
    <td align="right">联系电话</td>
    <td><input name="declareTel" type="text"/></td>
  </tr>
  <tr>
    <td colspan="6" align="center">
        <input type="submit" class="btn"  value="提 交" />
      &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="reset" class="btn" value="重 置" />
	</td>
  </tr>
</table>
</form>


<script type="text/javascript">

	var tdetail=function(){
		//alert($( "#tt" ).val());
		 $.ajax({  
           url:"/demand/selectTdName",  
           type:"POST",  
           data:{ttid:$( "#tt" ).val()},
           dataType:"json",  
           success:function(data){  
                var str=null;
                str+='<option selected="selected">--请选择--</option>';
               for(var i=0;i<data.length;i++){  
                   str+='<option value=\"'+data[i].tdid+'\">'+data[i].tdname+'</option>';  
               }
           		$("#td").empty();  
               $("#td").append(str); 
           }   
       }); 
	}
	var tdetail2=function(){
		 $.ajax({  
	           url:"/demand/selectTdetails",  
	           type:"POST",  
	           data:{tdid:$( "#td" ).val()},
	           dataType:"json",  
	           success:function(data){  
	                var str=null;
	                var level = data.tdlevel;
	                var le1 = "一级";
	                var le2 = "二级";
	                if(level==le1){
	                	str+='<option value="一级" selected="selected">一级</option>';
	                	str+='<option value="无">无</option>';
	                	str+='<option value="二级">二级</option>';
	                }else if(level==le2){
	                	str+='<option value="一级">一级</option>';
	                	str+='<option value="无">无</option>';
	                	str+='<option value="二级" selected="selected">二级</option>';
	                }else{
	                	str+='<option value="一级">一级</option>';
	                	str+='<option value="无" selected="selected">无</option>';
	                	str+='<option value="二级">二级</option>';
	                }
	                     
	           	   $("#fuwu").empty();  
	               $("#fuwu").append(str); 
	               var textId=$("#response");//根据文本框的id找到这个文本框，并将其变成jquery对象
	               textId.val(data.responseTime);
	               $("#service").val(data.serviceTime);
	               var str2='<textarea cols="115" rows="1" disabled="true">'+data.tdremarks+'</textarea>';
	               $("#remarks").empty();
	               $("#remarks").append(str2); 
	           }   
	       });
	}

</script>
</body>
</html>