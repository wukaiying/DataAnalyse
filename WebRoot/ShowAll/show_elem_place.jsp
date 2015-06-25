<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> 
<%@ page import="dataanalyse.bean.*" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.*"%>
<%@page import="dbImpl.*" %>
<%@page import="com.wky.dbUtils.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>元素地理位置联动查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="user_images/favicon.png" type="image/png">
    <link href="user_css/style.default.css" rel="stylesheet">
    <link href="user_css/morris.css" rel="stylesheet">
	<script type="text/javascript" src="./js/esl.js"></script>

  </head>
  <body>
  	<div class="mainpanel" style="width: 100%;">
  	 <div class="pageheader">
         <h2><i class="fa fa-bug"></i>元素地理位置联动查询</h2>
                    
     </div>
    	 <div>
     		<form action="ShowElemPlaceServlet" method="post">
					<div align="center">
						<div>
							<input name="elem_name" type="text" id="key" value="元素名称" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
					       
						    <select name="dropdownlist">
							    <option value="贵阳市" selected="selected">贵阳市</option>
							    <option value="铜仁市">铜仁市</option>
							    <option value="year" >六盘水市</option>
							    <option value="other">其他</option>
						   </select>		 
										
						</div>
						
						<input type="submit" value="查找" />
					</div>
				</form>
    	 </div>    
          <div class="contentpanel">
			 <div class="row">               
                <div class="col-md-6 mb30" style="width:100%">
                  <h5 class="subtitle mb5">元素地理位置联动查询</h5>
                  <p class="mb15">通过分析不同产地同一类样品各种指标变化趋势。得出不同产地生产同一类产品的质量好坏。输入元素名称和地点，查看某元素在某地点的含量变化。</p>
                  <div id="elemPlaceBar" style="width: 100%; height: 300px"></div>
                </div><!-- col-md-6 -->
            </div><!-- row -->
		</div> <!-- end contentpanel -->
	</div><!-- endmainpanel -->
  </body>
  <%	
  	String elemPlaceBar = (String)request.getAttribute("elemPlaceBar");
  	String place = (String)request.getAttribute("place");
   %>
  <script type="text/javascript">
      // 路径配置
        require.config({
            paths: {
                'echarts' : '.js/echarts',
                'echarts/chart/bar' : './js/echarts',
                'echarts/chart/line': './js/echarts',
                'echarts/chart/pie': './js/echarts'
            }
        });
        
	  // 使用
	  require(
	      [
	          'echarts',
	          'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
	          'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
	          'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
	          
	      ],
	 function (ec){
		DrawElemPlaceBar(ec);
	 }
);
function DrawElemPlaceBar(ec) {
    // 基于准备好的dom，初始化echarts图表
    var myChart = ec.init(document.getElementById('elemPlaceBar')); 
   	var option = <%=elemPlaceBar%>;
   	//alert(option);
	myChart.setOption(option); 
};
</script>
</html>
