<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<%@ page import="dataanalyse.bean.*" %>
<%@page import="com.wky.dbUtils.*" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.*"%>
<%@page import="dbImpl.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	//ajax实现无刷新显示
    String q=(String)request.getParameter("q");
    System.out.println(q);
    String people_input = request.getParameter("key");
	StringBuffer sd_name = new StringBuffer();
	StringBuffer sd_value = new StringBuffer();
	Connection conn = DBConnection.getConnection();
	String sql = "select dairy.DairyID,dairy.SimpleName,"+people_input+" from Dairy  where "+people_input+" REGEXP '[0-9]' ORDER BY  "+people_input+"  DESC limit 0,10";
	System.out.println(sql+"++++++++++");
	//ResultSet rs = dbUtils.select(sql);
	PreparedStatement ps = null;
	ResultSet rs = null;
	try{
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
		sd_name.append(rs.getString(2)+",");
		sd_value.append(rs.getString(3)+",");
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs);
		DBConnection.close(ps);
		DBConnection.close(conn);
	}
	System.out.println(sd_name);
	System.out.println(sd_value);
 %>
 
 <%
	StringBuffer sd_name1 = new StringBuffer();
	StringBuffer sd_value1 = new StringBuffer();
    Connection conn1 = DBConnection.getConnection();
	String sql1 = "select dairy.DairyID,dairy.SimpleName,"+people_input+" from Dairy  where "+people_input+" REGEXP '[0-9]'";
	System.out.println(sql1+"++++++++++");
	PreparedStatement ps1 = null;
	ResultSet rs1 = null;
	try{
		ps1 = conn1.prepareStatement(sql1);
		rs1=ps1.executeQuery();
		while(rs1.next()){
		sd_name1.append(rs1.getString(2)+",");
		sd_value1.append(rs1.getString(3)+",");
	}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs1);
		DBConnection.close(ps1);
		DBConnection.close(conn1);
	}
	System.out.println(sd_name1);
	System.out.println(sd_value1);
 %>
  <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>数据展示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="js/selectcustomer.js"></script></head>
  <script type="text/javascript" src="js/esl.js"></script>
  <body>
	  <div>
	  <form action="ShowData.jsp">
	  	 <input name="key" type="text" id="key" value="要查询的元素" size="30"  align="center"
          onmouseover=this.focus();this.select();   
          onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
          
          <input type="submit" value="点击查看" />
	  </div>
	  </form>

  	  <div id="main" style="height:300px"></div>
  	  <div id="main1" style="height:300px"></div>
  	<script type="text/javascript">
    var x_data = "<%=sd_name.toString()%>";
    var y_data ="<%=sd_value.toString()%>";
    
    var x_data1 = "<%=sd_name1.toString()%>";
    var y_data1 ="<%=sd_value1.toString()%>";
    
        // 路径配置
        require.config({
            paths:{ 
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
                'echarts/chart/line',
                'echarts/chart/pie'
            ],
           DrawCharts
        );
        
         function DrawCharts(ec) {
                FunDraw1(ec);
                FunDraw2(ec);
            }
        
         function FunDraw1(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
                     title: {
				        text: '铬含量top10',
				        subtext: '',
				        x:'left'
				    },
                    tooltip: {
                        show: true
                    },
                    legend: {
                        data:['']
                    },
                    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
                    xAxis : [
                        {
                            type : 'category',
                            data : x_data.split(",")
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            max:'1',
                            min:'0'
                        }
                    ],
                    series : [
                        {
                            "name":"含量",
                            "type":"bar",
                            "data":y_data.split(",")
                        }
                    ]
                };
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
            
             function FunDraw2(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main1')); 
                
                var option = {
                     title: {
				        text: '铬含量变化图',
				        subtext: '',
				        x:'left'
				    },
                    tooltip: {
                        show: true
                    },
                    legend: {
                        data:['']
                    },
                    toolbox: {
				        show : true,
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
                    xAxis : [
                        {
                            type : 'category',
                            data : x_data1.split(",")
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            max:'1',
                            min:'0'
                        }
                    ],
                    series : [
                        {
                            "name":"含量",
                            "type":"line",
                            "data":y_data1.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'}
					                	]
           								 },
				           " data" :[0.5,0.5,0.5,0.5,0.5,0.5,0.5,0.5,],
                        }
                    ]
                };
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
            
    </script>
    <h1><%=sd_name %></h1>
  </body>
</html>
