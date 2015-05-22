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
    
    <title>My JSP 'Login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <link rel="stylesheet" href="css/login.css" type="text/css"></link>
  <script language="javascript">
  	function checkLogin(){
  		var name;
  		var password = document.login-form.password.value;
  		if(name==""||password==""){
  			alert("用户名或密码不能为空！");
  			name="";
  			password="";
  			doucument.name.focus();
  		}
  	}
  </script>
  </head>
  
  <body>
  	<form id="login-form" action="LoginServlet" method="post">
  	<font color="red">${requestScope.error }</font>
	  <fieldset>
	  <legend>登录</legend>
	  <label for="name">用户编号</label>
	  <input type="text" id="id" name="id"/>
	  <div class="clear"></div>
	  <label for="password">密码</label>
	  <input type="password" id="password" name="password"/>
	  <div class="clear"></div>
     <label for="status" style="padding: 0;">用户类型</label>
	  <select name="status" id="status">
	  	<option value="1" selected>管理员</option>
	  	<option value="0">普通用户</option>
	  </select>
	   <div class="clear"></div>
	  <input type="submit" style="margin: -20px 0 0 287px;" class="button" name="commit" value="Log in"/>
	  <div class="clear"></div>
	  <label><a href="UserAdd.jsp" style="padding: 0;">点击注册</a></div></label>
	  </fieldset>
	</form>
  </body>
</html>
