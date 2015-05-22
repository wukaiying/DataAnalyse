<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.wky.dbUtils.*" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<% 
StringBuffer all_num = new StringBuffer();
StringBuffer ru_num = new StringBuffer();
StringBuffer baby_num = new StringBuffer();
//DBUtils dbUtils = new DBUtils();
Connection conn = DBConnection.getConnection();
String sql = "select count(*) from dataanalyse.dairy";
//ResultSet rs = dbUtils.select(sql);
PreparedStatement ps = null;
ResultSet rs = null;
try{
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			all_num.append(rs.getString(1));
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs);
		DBConnection.close(ps);
		DBConnection.close(conn);
	}
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
	  <table cellspacing="50" align="left" border="0" height="600px">
		<tr>
		<td width="100px" height="100px">
			<div>
				<span style="font-size:40px; color:green;" id="battles"><B><%=all_num.toString() %></B></span><br/>
				<small >&nbsp;总样本数</small>
			</div>
		</td>
		<td  width="100px" height="100px">
			<div>
				<span style="font-size:40px; color:blue;" id="winrate"><B>100%</B></span><br/>
				<small>&nbsp;合格品率</small>
			</div>
		</td>
		</tr>
		<tr>
			<td  width="100px" height="100px">
				<div> 
					<span style="font-size:40px; color:green;" id="battles"><B>328</B></span><br/>
					<small>&nbsp;乳制品数</small>
				</div>
			</td>
			<td>
			<div>
				<span style="font-size:40px; color:blue;" id="winrate"><B>100%</B></span><br/>
				<small>&nbsp;合格率</small>
			</div>
			</td>
		</tr>
		<tr>
			<td  width="100px" height="100px">
				<div>
					<span style="font-size:40px; color:green;" id="battles"><B>200</B></span><br/>
					<small>&nbsp;婴幼儿乳制品</small>
				</div>
			</td>
			<td>
			<div>
				<span style="font-size:40px; color:blue;" id="winrate"><B>100%</B></span><br/>
				<small>&nbsp;合格率率</small>
			</div>
			</td>
		</tr>
	</table>
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
    var array_data1 = "";
    var show_data1 ="";
    var array_piedata="";
    
        // 路径配置
        require.config({
            paths:{ 
                'echarts' : 'http://echarts.baidu.com/build/echarts',
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
				        data:["乳制品数","婴幼儿乳制品数"],
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
				    series : [
				        {
				            name:'',
				            type:'pie',
				            radius : '55%',
				            center: ['50%', '60%'],
				            data:[
					                {value:328, name:'乳制品数'},
					                {value:200, name:'婴幼儿乳制品数'},
           						 ] 
				        }
				    ]
				};
				 myChart.setOption(option);      
            }
    </script>
  </body>
</html>
