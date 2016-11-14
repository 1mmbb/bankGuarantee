<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<!-- HTTP 1.1 -->
<meta http-equiv="Cache-Control" content="no-store" />
<!-- HTTP 1.0 -->
<meta http-equiv="Pragma" content="no-cache" />
<!-- Prevents caching at the Proxy Server -->
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="icon" href="./images/favicon.ico" />
<link rel="stylesheet" type="text/css" href="./css/ext-all.css" />
<script type="text/javascript" src="./js/ext/ext-base.js"></script>
<script type="text/javascript" src="./js/ext/ext-all.js"></script>
<script type="text/javascript" src="./js/ext/ext-lang-zh_CN.js"></script>
<script type="text/javascript">
	Ext.BLANK_IMAGE_URL = 'img/s.gif';
</script>
<link href="./styles/messages.css" rel="stylesheet" type="text/css">
<title>需求保障管理系统</title>
<link rel="stylesheet" type="text/css" href="./styles/style.css" />
<script language="javascript" src="./js/Clock.js"></script>
<!-- ----------------------------------- -->
<base href="<%=basePath%>">
<base target="main" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>jslib/bootstrap/css/bootstrap.css">
<script src="<%=basePath%>jslib/jquery-1.7.2.min.js"
	type="text/javascript"></script>
<body>
	<div id="loading-mask" style=""></div>
	<div id="loading">
		<div class="loading-indicator"></div>
		<div id="north">
			<span>
				<div height="90" class="api-title"
					style="background: url('images/top_bg.jpg') repeat-x; height: 90px">

					<img src="images/top.gif">
				</div>
				<div height="20"
					style="background: url('images/menu_bg.jpg') repeat-x; height: 20px; font-size: 10pt;">
					<div
						style="float: left; margin: 0 0 0 10px; font: normal 12px tahoma, arial, sans-serif; color: #ffffff;">
						<label id="nowDateTime">&nbsp;</label>
					</div>
					<div
						style="float: right; margin: 0 5px 0 0; font: normal 12px tahoma, arial, sans-serif; color: #ffffff;">
						[欢迎]&nbsp;&nbsp;&nbsp;${us.username} &nbsp;&nbsp;
						<a href="#" onClick="window.top.location.href = '/quit';">【退出】</a>
					</div>
				</div>
			</span>
		</div>
		
		<div id="west">
			<div id="west-panel" class="x-panel x-border-panel"
				style="width: 200px; left: 0px; top: 110px;">
				<div id="ext-gen7" class="x-panel-header x-unselectable"
					style="-moz-user-select: none;">
					<span id="ext-gen15" class="x-panel-header-text">需求保障管理系统</span>
				</div>

				<div class="sidebar-nav">
					<c:forEach items="${funlist}" var="top">
						<c:if test="${top.funpid=='-1'}">
							<!-- 改过的 -->
							<!--	<a href="#error-menu${top.funid}" class="nav-header collapsed"
							data-toggle="collapse"><i class="icon-briefcase"></i>${top.funname}<i
							class="icon-chevron-up"></i> </a>  -->

							<div id="ext-gen95"
								class="x-panel-header x-panel-header-noborder x-unselectable x-accordion-hd"
								style="-moz-user-select: none; cursor: pointer;">
								<span id="ext-gen104" class="x-panel-header-text"> <a
									href="#error-menu${top.funid}" class="nav-header collapsed"
									data-toggle="collapse"><i class="icon-briefcase"></i>${top.funname}<i
										class="icon-chevron-up"></i> </a>
								</span>
							</div>

							<ul id="error-menu${top.funid}" class="nav nav-list collapse">
								<c:forEach items="${funlist}" var="child">
									<c:if test="${child.funpid==top.funid}">
										<li>

											<div class="x-tree-node-el x-tree-node-leaf x-unselectable "
												ext:tree-node-id="ProblemManage" unselectable="on">

												<img class="x-tree-node-icon x-tree-node-inline-icon"
													src="img/user.gif" unselectable="on"> <a
													class="x-tree-node-anchor" hidefocus="on"
													href="<%=basePath%>${child.funurl}" tabindex="1"> <span
													unselectable="on">${child.funname} </span>
												</a>
											</div>
										</li>
									</c:if>
								</c:forEach>
							</ul>
						</c:if>
					</c:forEach>
				</div>
			</div>

			<div id="ext-comp-1001" class="x-tab-panel x-border-panel"
				style="left: 205px; top: 110px; width: 1161px;">
				<div id="ext-gen22" class="x-tab-panel-header x-unselectable"
					style="-moz-user-select: none; width: 1159px;"></div>
		 		<div id="ext-gen24" class="x-tab-panel-body x-tab-panel-body-top" style="height: 500px;">

					<iframe name="main" height="100%" width="100%" scrolling="auto" frameborder="0" src=""> </iframe>
			 	</div>
				
				
			</div>

			<div id="loading-mask" style=""></div>
			<div id="west-panel-xsplit"
				class="x-layout-split x-layout-split-west x-splitbar-h"
				style="left: 200px; top: 110px">  </div>

		</div>
		<script type="text/javascript">
			var clock = new Clock();
			clock.display(document.getElementById("nowDateTime"));
		</script>
		<script src="<%=basePath%>jslib/bootstrap/js/bootstrap.js"></script>
</body>
</html>