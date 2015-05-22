<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.wky.dbUtils.DBUtils" %>
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
	StringBuffer st_name = new StringBuffer();
	st_name.append("正面"+",");
	st_name.append("负面"+",");
	st_name.append("中立"+",");
	StringBuffer st_good = new StringBuffer();
	DBUtils dbUtils = new DBUtils();
	String sql = "select count(*) from sentiment where id>=0 and id<=2000 and Label=1; ";
	ResultSet rs = dbUtils.select(sql);
	while(rs.next()){
		st_good.append(rs.getString(1)+",");
	}
	
 %>
 <%
	DBUtils dbUtils1 = new DBUtils();
	String sql1 = "select count(*) from sentiment where id>=0 and id<=2000 and Label=-1; ";
	ResultSet rs1 = dbUtils1.select(sql1);
	while(rs1.next()){
		st_good.append(rs1.getString(1)+",");
	}
 %>
 <%
	DBUtils dbUtils2 = new DBUtils();
	String sql2 = "select count(*) from sentiment where id>=0 and id<=2000 and Label=0; ";
	ResultSet rs2 = dbUtils2.select(sql2);
	while(rs2.next()){
		st_good.append(rs2.getString(1)+",");
	}
	System.out.println(st_name);
	System.out.println(st_good);
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Main.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript" src="js/esl.js"></script>
  <body>
	<table width="600px">
		<tr>
			<td>
				<div id="main" style="height:300px">武开英</div>
			</td>
		</tr>
		<tr>
			<td>
				<div id="main1" style="height:300px">武开英</div>
			</td>
		</tr>
	</table>
 <script type="text/javascript">
 	var array_name = "<%=st_name.toString()%>";
    var array_value ="<%=st_good.toString()%>";
    
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
                FunDraw3(ec);
            }
        
         function FunDraw1(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                
                var option = {
                     title: {
				        text: '',
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
                            data : ["总样本数","乳制品数","婴幼儿乳制品数"],
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : [
                        {
                            "name":"",
                            "type":"bar",
                            "data":["528","328","200"],
                        }
                    ]
                };
        
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
            
             function FunDraw3(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main1')); 
				var option = {
				    title : {
				        text: '',
				        subtext: '',
				        x:'center'
				    },
				    tooltip : {
				        trigger: 'item',
				        formatter: "{a} <br/>{b} : {c} ({d}%)"
				    },
				    legend: {
				        orient : 'vertical',
				        x : 'left',
				        data:["正面","负面","中立"],
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
				    calculable : true,
				    series :  [
				        {
				           name:'访问来源',
				            type:'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
				            data:(function(){
                                var res = [];
                                var len = -1;
                                while (len++<10) {
                                res.push({
                                value:array_value.split(",")[len],
                                name: array_name.split(",")[len],
                                
                                });
                                }
                                return res;
                                })()    
				        }
				    ]
				};
				 myChart.setOption(option);      
            }
    </script>
  
  </body>
</html>
