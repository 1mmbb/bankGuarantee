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
<title>需求保障管理系统</title>
<base href="<%=basePath%>">
<script language="javascript" src="js/js.js"></script>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="/js/jquery-1.8.1.min.js"></script> 
</head>
<body>
<form action="/trans/addTrans" method="post">
<table class="table11" style="width:900px;margin-top:15px;">
  <tr>
    <th colspan="6" style="text-align:center;">修改事务详细信息</th>
  </tr>
  <tr>
    <td align="right">事务明细</td>
    <td><label>
    <input name="tdname" type="text" value="${td.tdname }"/>
    </label></td>
    <td align="right">事务种类</td>
    <td colspan="3">
	   <select name="ttid" size="1">
	     <c:forEach items="${ttlist}" var="item">
	     	<c:choose>
				<c:when test="${item.ttid == td.ttid}">
					<option value="${item.ttid }" selected="selected">${item.ttname }</option>
				</c:when>
				<c:otherwise>
					<option value="${item.ttid }">${item.ttname }</option>
				</c:otherwise>
			</c:choose>
		 </c:forEach>
	   </select>
    </td>
  </tr>
  
  <tr>
    <td align="right">类 型</td>
    <td><select name="tdtype">
      <option selected="selected" value="网点提交">网点提交</option>
      <option value="网管中心提交">网管中心提交</option>
    </select></td>
    <td align="right">服务保障部门</td>
    <td colspan="3"><select name="tddepat">
      <option value="行长办公室">行长办公室</option>
      <option value="会计部">会计部</option>
      <option value="网管中心">网管中心</option>
      <option value="保卫部">保卫部</option>
      <option value="ATM中心">ATM中心</option>
      <option value="办公室">办公室</option>
                    </select></td>
  </tr>
  <tr>
    <td align="right">服务保障级别</td>
    <td><select name="tdlevel">
        <option selected="selected">无</option>
        <option value="一级">一级</option>
        <option value="二级">二级</option>
      </select></td>
    <td align="right">涉及外包服务商</td>
    <td><input name="tdifout" type="text" value="${td.tdifout }"/></td>
    <td align="right">初审时限 </td>
    <td><select name="firstTime">
      <option selected="selected">无</option>
      <option value="1工时">1工时</option>
      <option value="2工时">2工时</option>
	  <option value="3工时">3工时</option>
	  <option value="4工时">4工时</option>
	  <option value="5工时">5工时</option>
	  <option value="6工时">6工时</option>
	  <option value="1工作日">1工作日</option>
	  <option value="2工作日">2工作日</option>
	  <option value="3工作日">3工作日</option>
    </select></td>
  </tr>
  <tr>
    <td align="right">服务响应时限</td>
    <td><select name="responseTime">
      <option selected="selected">无</option>
      <option value="1工时">1工时</option>
      <option value="2工时">2工时</option>
	  <option value="3工时">3工时</option>
	  <option value="4工时">4工时</option>
	  <option value="5工时">5工时</option>
	  <option value="6工时">6工时</option>
	  <option value="1工作日">1工作日</option>
	  <option value="2工作日">2工作日</option>
	  <option value="3工作日">3工作日</option>
    </select></td>
    <td align="right">抵达现场时限 </td>
    <td><select name="arriveTime">
      <option selected="selected">无</option>
      <option value="1工时">1工时</option>
      <option value="2工时">2工时</option>
	  <option value="3工时">3工时</option>
	  <option value="4工时">4工时</option>
	  <option value="5工时">5工时</option>
	  <option value="6工时">6工时</option>
	  <option value="1工作日">1工作日</option>
	  <option value="2工作日">2工作日</option>
	  <option value="3工作日">3工作日</option>
    </select></td>
    <td align="right">服务解决时限 </td>
    <td><select name="serviceTime">
      <option selected="selected">无</option>
      <option value="1工时">1工时</option>
      <option value="2工时">2工时</option>
	  <option value="3工时">3工时</option>
	  <option value="4工时">4工时</option>
	  <option value="5工时">5工时</option>
	  <option value="6工时">6工时</option>
	  <option value="1工作日">1工作日</option>
	  <option value="2工作日">2工作日</option>
	  <option value="3工作日">3工作日</option>
    </select></td>
  </tr>
  <tr>
    <td align="right">事务备注</td>
    <td colspan="5"><textarea name="tdremarks" cols="100" rows="4">${td.tdremarks }</textarea></td>
  </tr>
  <tr>
    <td colspan="6" align="center"><label>
      <input type="submit" class="btn" value="提 交" />
      &nbsp;&nbsp;
      <input type="reset" class="btn" value="重 置" />
	  &nbsp;&nbsp;
      <input type="button" class="btn" onmouseover="changebg(this,'1')" onmouseout="changebg(this,'1')" value="返 回" onclick="javascript:history.go(-1);"/>
    </label></td>
  </tr>
</table>
</form>
</body>
</html>