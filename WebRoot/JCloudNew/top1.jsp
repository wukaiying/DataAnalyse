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

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">   
    <title>top1
    </title>
    <script type="text/javascript" src="<%=path%>/js/jquery-1.4.4.min.js"></script>
	 <link rel="stylesheet" href="<%=path%>/css/table.css" type="text/css"></link>
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
  	  <div><h1 align="center">热词新闻查询</h1></div>
  	  <div align="center">
  	  <form action="./JCloudNew/top1.jsp" method="post">
	  	 <input name="hotword" type="text" id="key" value="要查询的元素" size="30"  align="center" 
          onmouseover=this.focus();this.select();   
          onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
          
          <input type="submit" value="点击查看" />
	  </form>
	   </div>
	  <!-- 显示表格 -->
	  	<table border="1" spacing="2" width="800" id="mytable" style="font-size:10px" >
		  <tr>
				<td class="row">新闻编号</td>
				<td class="row">新闻标题</td>
				<td class="row">来源地址</td>
				<td class="row">关键字</td>
		 </tr>
	<%!
		Connection conn3 = DBConnection.getConnection();
		public static final int PAGESIZE = 8;
		int pageCount;
		int curPage = 1;
	%>
	<%
		request.setCharacterEncoding("utf-8"); 
		String hotword = request.getParameter("hotword");
		System.out.println("hotword:"+hotword);
		//一页放5个
		String user = null;
		String pass = null;
		PreparedStatement ps3 = null;
		ResultSet t_rs = null;
		try{
			String tableSQL = "select news.newsid,news.title,news.URL,foodclasses.FoodClassName from newsfoodclass,news,foodclasses where news.NewsID=newsfoodclass.NewsID and foodclasses.FoodClassID=newsfoodclass.FoodClassID and FoodClassName like '%"+hotword+"%'";
			System.out.println("tableSQL:"+tableSQL);
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
				int id = t_rs.getInt(1);
				String title = t_rs.getString(2).toString();
				String url = t_rs.getString(3);
				String keyname = t_rs.getString(4);
				
				count++;
				%>
			<tr>
				<td class="row"><%=id%></td>
				<td class="row"><%=title%></td>
				<td class="row"><a href="<%=url %>"><%=url %></a></td>
				<td class="row"><%=keyname%></td>
			</tr>
				<%
			}while(t_rs.next());
		}
		catch(Exception e){	
			e.printStackTrace();
		}finally{
			DBConnection.close(t_rs);
			DBConnection.close(ps3);
			
		}
	%>
	</table>
	<div align= "center" style="font-size:20px">
	<a href = "./JCloudNew/top1.jsp?curPage=1" >首页</a>
	<a href = "./JCloudNew/top1.jsp?curPage=<%=curPage-1%>" >上一页</a>
	<a href = "./JCloudNew/top1.jsp?curPage=<%=curPage+1%>" >下一页</a>
	<a href = "./JCloudNew/top1.jsp?curPage=<%=pageCount%>" >尾页</a>
	第<%=curPage%>页/共<%=pageCount%>页
	</div>
  </body>
</html>
