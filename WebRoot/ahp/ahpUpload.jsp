<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上传AHP数据</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head>
  
  <body>
   		<form action="AHPUploadHandleServlet" enctype="multipart/form-data" method="post">
		         上传数据类型：<select name="category">
					    <option value="dairy" selected="selected">奶制品</option>
					    <option value="wine">酒类</option>
					    <option value="other" >其他</option>							  
					 </select>
		         上传文件：<input type="file" name="file1"><br/>
		  	<input type="submit" value="上传数据">
		</form>
  </body>
</html>
