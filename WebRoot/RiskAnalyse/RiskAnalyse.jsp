<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.*"%>
<%@page import="com.wky.riskanalyse.*" %>
<%@page import="com.wky.dbUtils.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title></title>
  </head>
  <%
  		String place = request.getParameter("place");
  		String material = request.getParameter("material");
  		String risknum = request.getParameter("risknum");
  		
  		RiskAnalyse riskAnalyse = new RiskAnalyse();
  		List<DairyBean> list = riskAnalyse.getRiskAnalyse("铜仁市", "CrRe");
  		List<DairyBean> risklist = riskAnalyse.getHighRisk(list, 0.1);
  		for(DairyBean l:risklist){
  			System.out.println("------------------------------");
  			System.out.print(l.getCrRe()+" "+"---------------------");
  		}	
  		
   %>

  <body>
  	<form action="RiskAnalyse.jsp">
  		<input name="place" type="text" id="place" value="要查询的地点" size="30"  align="center"
          onmouseover=this.focus();this.select();   
          onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
         <input name="material" type="text" id="place" value="要查询的物质" size="30"  align="center"
         onmouseover=this.focus();this.select();   
         onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
         onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
        <input name="risknum" type="text" id="risknum" value="风险系数" size="30"  align="center"
          onmouseover=this.focus();this.select();   
          onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
          <input type="submit" value="点击查看" />
  	</form>
  	
  </body>
</html>
