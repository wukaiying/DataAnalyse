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
    
    <title>关联规则</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery.dataTables.css" type="text/css"></link>
    <script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery-ui.css" type="text/css"></link>
    <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/dataTables.jqueryui.css" type="text/css"></link>
	<link rel="shortcut icon" href="user_images/favicon.png" type="image/png">
    <link href="user_css/style.default.css" rel="stylesheet">
    <link href="user_css/morris.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/js/esl.js"></script>
	<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>

	<script type="text/javascript">
	  	$(document).ready(function() {
    		$('#aprioritable').DataTable({
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
				}
    		});
    		
		} );
	  </script>
  </head>
  
  <body>
    	<div class="mainpanel" style="width: 100%;">              
                <div class="pageheader">
                    <h2><i class="fa fa-bug"></i>关联规则分析</h2>
                    <div class="breadcrumb-wrapper">
                        <span class="label">You are here:</span>
                        <ol class="breadcrumb">
                            <li><a href="index.html">Bracket</a></li>
                            <li><a href="bug-tracker.html">Bug Tracker</a></li>
                            <li class="active">Summary</li>
                        </ol>
                    </div>
                </div>

                <div class="contentpanel">
                    
                    <div class="row">
                        <div class="col-md-6 mb30" style="width: 100%;">
                            <h5 class="subtitle mb5">主要功能</h5>
                            <p class="mb15">Apriori算法：使用候选项集找频繁项集
Apriori算法是一种最有影响的挖掘布尔关联规则频繁项集的算法。其核心是基于两阶段频集思想的递推算法。该关联规则在分类上属于单维、单层、布尔关联规则。在这里，所有支持度大于最小支持度的项集称为频繁项集，简称频集。
该算法的基本思想是：首先找出所有的频集，这些项集出现的频繁性至少和预定义的最小支持度一样。然后由频集产生强关联规则，这些规则必须满足最小支持度和最小可信度。然后使用第1步找到的频集产生期望的规则，产生只包含集合的项的所有规则，其中每一条规则的右部只有一项，这里采用的是中规则的定义。一旦这些规则被生成，那么只有那些大于用户给定的最小可信度的规则才被留下来。为了生成所有频集，使用了递推的方法。
可能产生大量的候选集,以及可能需要重复扫描数据库，是Apriori算法的两大缺点。</p>
                            <p class="mb15">先将检测指标按五标度划分法分成优，良，中，差，危险，即数据预处理。</p>
                            <p class="mb15">然后导入数据，输入置信度，支持度，得到关联规则。</p>
                            <div id="" style="width: 100%; height: 300px"></div>
                        </div><!-- col-md-6 -->
                    </div><!-- row -->
                    
                   
                   
                    <div class="row" >
                        <div class="col-md-6" style="width: 100%;">
                            
                            <div class="panel panel-dark panel-alt">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="" class="panel-close">&times;</a>
                                        <a href="" class="minimize">&minus;</a>
                                    </div><!-- panel-btns -->
                                    <h5 class="panel-title">所得关联规则</h5>
                                </div><!-- panel-heading -->
                                <div class="panel-body panel-table">
                                    <div class="table-responsive" >
                                   		  <table id="aprioritable"  cellspacing="0" width="100%" align="center">
			                                    <thead>
			                                        <tr>
			                                            <th>关联规则</th>
			                                            <th>置信度</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
													<c:forEach var="entry" items="${sessionScope.sessionRelationRulesMap }">
														<tr>
															<td><c:out value="${entry.key}" /></td>
															<td><c:out value="${entry.value}" /></td>
														</tr>
													</c:forEach>
												</tbody>
			                                </table>
                                    </div><!-- table-responsive -->
                                </div><!-- panel-body -->
                            </div><!-- panel -->
                            
                        </div><!-- col-md-6 -->
                   
                                             
                        
                    </div><!-- row -->                                     
                    
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
                                <p>以上为所有在置信度为1的情况下得到的关联规则。例如第四条规则‘亚硝酸盐优;大肠菌群良;->菌落总数中;’说明
                       如果指标亚硝酸盐检测结果为优秀，大肠杆菌检测结果为良好，可以得到菌落总数的检测结果为中等。</p>
                            </div><!-- table-responsive -->
                        </div><!-- panel-body -->
                    </div><!-- panel -->
                    
                </div><!-- contentpanel -->

    	 </div><!-- mainpanel -->
  </body>
</html>
