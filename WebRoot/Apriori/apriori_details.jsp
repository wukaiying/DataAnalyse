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
    
    <title>关联规则详细信息</title>
    
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
		       // "bProcessing": true,
		        //"sAjaxSource": 'http://localhost/DataAnalyse/AprioriDetailServlet?id=7',
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
  ${aprioriData }
  		<div class="mainpanel" style="width: 100%;">
        <div class="pageheader">
            <h2><i class="fa fa-bug"></i> 神经网络历史详细</h2>
        </div>

        <div class="contentpanel">                    
           <div class="row">
			
			<table id="mytable" class="display" cellspacing="0" width="100%" align="center">
				<thead>
					<tr>
						<th>关联规则</th>
						
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>${aprioriData }</th>
						
					</tr>
				</tbody>
			</table>
		</div>
		  <div class="panel panel-dark panel-alt">
               <div class="panel-heading">
                   <div class="panel-btns">
                       <a href="" class="panel-close">&times;</a>
                       <a href="" class="minimize">&minus;</a>
                   </div><!-- panel-btns -->
                   <h5 class="panel-title">结论</h5>
               </div>
               <div class="panel-body panel-table">
                   <div class="table-responsive">
                       <h4><p>以上为所有在置信度为1的情况下得到的关联规则。例如第四条规则‘亚硝酸盐优;大肠菌群良;->菌落总数中;’说明
                       如果指标亚硝酸盐检测结果为优秀，大肠杆菌检测结果为良好，可以得到菌落总数的检测结果为中等。
                       </p></h4>
                       <p></p>
                   </div><!-- table-responsive -->
               </div><!-- panel-body -->
           </div><!-- panel -->
        </div><!-- contentpanel -->

     </div><!-- mainpanel -->
  </body>
</html>
