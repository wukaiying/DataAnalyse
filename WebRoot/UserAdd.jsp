<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>UserAdd</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="css/login.css" type="text/css"></link>
  </head>
  
  <body>
    <form id="login-form" action="AddUserServlet" method="post">
   <font color="red">${requestScope.error }</font>
	  <fieldset>
	  <legend>用户注册</legend>
	  <label for="login">用户名</label>
	  <input type="text" id="name" name="name"/>
	  <div class="clear"></div>
	  <label for="password">密码</label>
	  <input type="password" id="password" name="password"/>
	  <label for="password1">确认密码</label>
	  <input type="password" id="password1" name="password1"/>
	  <div class="clear"></div>
	  <input type="hidden" id="isAdmin" name="isAdmin" value="0"/>
	  <br />
	  <input type="submit" style="margin: -20px 0 0 287px;" class="button" name="commit" value="点击注册"/>
	  </fieldset>
	</form>
  </body>
</html>
