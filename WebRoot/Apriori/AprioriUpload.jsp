<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传关联规则数据</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    	<form name="form" action="AprioriUploadHandleServlet" enctype="multipart/form-data" method="post" >
		         上传用户：<input id ="name" type="text" name="username"/><br/>
		         上传文件：<input id="fileupload"  name="file1" type="file"/><br/>
		   <input type="submit" name ="check" value="上传数据" />
		</form>
  </body>
</html>
