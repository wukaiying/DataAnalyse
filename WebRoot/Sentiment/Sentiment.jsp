<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	StringBuffer st_name = new StringBuffer();
	st_name.append("正面"+",");
	st_name.append("负面"+",");
	st_name.append("中立"+",");
	StringBuffer st_good = new StringBuffer();
	
	Connection conn = DBConnection.getConnection();
	String sql = "select count(*) from sentiment where id>=0 and id<=2000 and Label=1; ";
	PreparedStatement ps = null;
	ResultSet rs = null;
	try{
		ps = conn.prepareStatement(sql);
		rs=ps.executeQuery();
		while(rs.next()){
			st_good.append(rs.getString(1)+",");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs);
		DBConnection.close(ps);
		DBConnection.close(conn);
	}
	
 %>
 <%
	Connection conn1 = DBConnection.getConnection();
	String sql1 = "select count(*) from sentiment where id>=0 and id<=2000 and Label=-1; ";
	PreparedStatement ps1 = null;
	ResultSet rs1 = null;
	try{
		ps1 = conn1.prepareStatement(sql1);
		rs1=ps1.executeQuery();
    while(rs1.next()){
		st_good.append(rs1.getString(1)+",");
	}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs1);
		DBConnection.close(ps1);
		DBConnection.close(conn1);
	}
 %>
 <%
	Connection conn2 = DBConnection.getConnection();
	String sql2 = "select count(*) from sentiment where id>=0 and id<=2000 and Label=0; ";
	PreparedStatement ps2 = null;
	ResultSet rs2 = null;
	try{
	ps2 = conn2.prepareStatement(sql2);
	rs2=ps2.executeQuery();
	while(rs2.next()){
		st_good.append(rs2.getString(1)+",");
	}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs2);
		DBConnection.close(ps2);
		DBConnection.close(conn2);
	}
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Sentiment.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 <script type="text/javascript" src="<%=path%>/js/jquery-1.4.4.min.js"></script>
 <link rel="stylesheet" href="<%=path%>/css/table.css" type="text/css"></link>
 <script type="text/javascript" src="./js/esl.js"></script>
 <script type="text/javascript">
 $(function() {
		/* For zebra striping */
        $("table tr:nth-child(odd)").addClass("odd-row");
		/* For cell text alignment */
		$("table td:first-child, table th:first-child").addClass("first");
		/* For removing the last border */
		$("table td:last-child, table th:last-child").addClass("last");
});
</script>

 </head>

  <body>
  <div><h1 align="center">数据情感分析</h1></div>
  <div id="main1" style="height:350px;">武开英</div>
  <!-- 显示表格 -->
  	<table border="1" spacing="2" width="800" id="mytable" style="font-size:10px" >
	  <tr>
			<td class="row">编号</td>
			<td class="row">微博内容</td>
			<td class="row">判定</td>
	 </tr>
<%!
	Connection conn3 = DBConnection.getConnection();
	public static final int PAGESIZE = 10;
	int pageCount;
	int curPage = 1;
%>
<%
	//一页放5个
	String user = null;
	String pass = null;
	PreparedStatement ps3 = null;
	ResultSet t_rs = null;
	try{
		String tableSQL = "select id,Content,Label from sentiment";
		
		ps3 = conn3.prepareStatement(tableSQL);
	    t_rs=ps3.executeQuery();
		t_rs.last();
		int size = t_rs.getRow();
		pageCount = (size%PAGESIZE==0)?(size/PAGESIZE):(size/PAGESIZE+1);
		String tmp = request.getParameter("curPage");
		if(tmp==null){
			tmp="1";
		}
		curPage = Integer.parseInt(tmp);
		if(curPage>=pageCount) curPage = pageCount;
		boolean flag = t_rs.absolute((curPage-1)*PAGESIZE+1);
		int count = 0;
		do{
			if(count>=PAGESIZE){
			break;}
			int id = Integer.parseInt(t_rs.getString(1));
			String Content = t_rs.getString(2).toString();
			int Label = Integer.parseInt(t_rs.getString(3));
			System.out.println(id+" "+Content+" "+Label);
			count++;
			%>
		<tr>
			<td class="row"><%=id%></td>
			<td class="row"><%=Content%></td>
			<td class="row"><%=Label%></td>
		</tr>
			<%
		}while(t_rs.next());
	}
	catch(Exception e){	
		e.printStackTrace();
	}finally{
		DBConnection.close(t_rs);
		DBConnection.close(ps3);
		DBConnection.close(conn3);
	}
%>
</table>
<div align= "center" style="font-size:20px">
<a href = "./Sentiment/Sentiment.jsp?curPage=1" >首页</a>
<a href = "./Sentiment/Sentiment.jsp?curPage=<%=curPage-1%>" >上一页</a>
<a href = "./Sentiment/Sentiment.jsp?curPage=<%=curPage+1%>" >下一页</a>
<a href = "./Sentiment/Sentiment.jsp?curPage=<%=pageCount%>" >尾页</a>
第<%=curPage%>页/共<%=pageCount%>页
</div>
  <script type="text/javascript">
  	var array_name = "<%=st_name.toString()%>";
    var array_value ="<%=st_good.toString()%>";
    
        // 路径配置
        require.config({
            paths:{ 
                'echarts' : './js/echarts',
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
                FunDraw3(ec);
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
				        data:["正面","负面","中立"],           //这个一定要自己输入，学会调适程序
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
				           name:'访问来源',
				            type:'pie',
				            radius : '100%',
				            center: ['50%', '60%'],
				            data:(function(){
                                var res = [];
                                var len = -1;
                                while (len++<10) {
                                res.push({
                                name: array_name.split(",")[len],
                                value:array_value.split(",")[len]
                                
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
