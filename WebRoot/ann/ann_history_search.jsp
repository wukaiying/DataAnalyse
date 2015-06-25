<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>神经网络历史查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="user_images/favicon.png" type="image/png">
    <link href="user_css/style.default.css" rel="stylesheet">
    <link href="user_css/morris.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery.dataTables.css" type="text/css"></link>
	<script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery-ui.css" type="text/css"></link>
    <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/dataTables.jqueryui.css" type="text/css"></link>
	<script type="text/javascript">
	  	$(document).ready(function() {
    		$('#mytable').DataTable({
    			//"scrollY":        400,
		        //"scrollCollapse": true,
		        //"jQueryUI":       true
		        "oLanguage": {
					"sLengthMenu": "每页显示 _MENU_ 条记录",
					"sZeroRecords": "抱歉， 没有找到",
					"sInfo": "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
					"sInfoEmpty": "没有数据",
					"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
				"oPaginate": {
					"sFirst": "首页",
					"sPrevious": "前一页",
					"sNext": "后一页",
					"sLast": "尾页"
				},
				"sZeroRecords": "没有找到",
				//"sProcessing": "<img src='./loading.gif' />"
				},
				
    		});
    		
		} );
	  </script>

  </head>
  
  <body>
    <div class="mainpanel" style="width: 100%;">
  	 <div class="pageheader">
         <h2><i class="fa fa-bug"></i>神经网络历史查询</h2>
                    
     </div>
     <div>
     	<form action="AnnHistorySearchServlet" method="post">
					<div align="center">
						<div>
							<input name="start_time" type="text" id="key" value="输入起始日期" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
					       
					       <input name="end_time" type="text" id="key" value="输入结束日期" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
										
						</div>
						
						<input type="submit" value="查找" />
					</div>
			</form>
     </div>    
     <div class="contentpanel">
		<div class="row">
			
			<table id="mytable" class="display" cellspacing="0" width="100%" align="center">
				<thead>
					<tr>
						<th>编号</th>
						<th>时间</th>
						<th>数据类别</th>
						<th>训练误差</th>
						<th>迭代次数</th>
						<th>查看详细</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="entry" items="${annList }">
						<tr>
							<td><c:out value="${entry.id}" /></td>
							<td><c:out value="${entry.time}" /></td>
							<td><c:out value="${entry.dataType}" /></td>
							<td><c:out value="${entry.trainError}" /></td>
							<td><c:out value="${entry.epoch}" /></td>
							<td><a href="AnnDetailsServlet?id=${entry.id }">查看详细</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>	
	</div> <!-- end contentpanel -->
	</div><!-- endmainpanel -->
  </body>
</html>
