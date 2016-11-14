<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link rel="stylesheet" type="text/css" href="styles/login.css" />
</head>
<body>
    <form:form action="/login" method="post" modelAttribute="mbSysuser">
    <div class="LoginBottomBg">
        <div class="LoginTopBg">
            <div class="LoginBox">
                <div class="LoginTop">
                    &nbsp;
                </div>
                <div class="LogoImg">
                    &nbsp;
                </div>
                <table class="LoginTb" border="0">
                	<tr align="right">
                		<td>
                			${message }
                		</td>
                	</tr>
                    <tr>
                    	
                        <td class="LoginTbLeft">
                            用户名:
                              <input name="username" type="text" style="width:100px; height:22px;">
                      </td>
                        <td rowspan="3" class="LoginTbRight">
							<input type="image" src="images/BtnLogin.gif" value="submit"
									name="Image1" border="0" id="Image1">
					  </td>
                    </tr>
                    <tr>
                        <td class="LoginTbLeft">
                        </td>
                    </tr>
                    <tr>
                      <td class="LoginTbLeft">
                            密&#12288;码:
                            <input type="password" name="userpwd" style="width:100px; height:22px;">
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    </form:form>
</body>
</html>