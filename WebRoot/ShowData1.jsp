<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'ShowData1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="../js/selectcustomer.js"></script></head>
  
  <body>
  	   <form name="form">
   		 请选择：
 		<select name="customers" onchange="showCustomer(document.form.customers.options[document.form.customers.selectedIndex].text)">
  		  <option value="CrRe">CrRe</option>
   		  <option value="3052">3055</option>
  		  <option value="3052">3051</option>
 		</select>
 	 </form>
	  <p>
	  <div id="txtHint"><b>Customer info will be listed here.</b></div>
	  </p>
  </body>
</html>
