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
    
    <title>关联规则模型</title>
    
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
				}
    		});
    		
		} );
	  </script>
  </head>
  
  <body>
  <div class="mainpanel" style="width: 100%;">
  	 <div class="pageheader">
                    <h2><i class="fa fa-bug"></i> 指标约减(关联规则)</h2>
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
	 	 	 <div>${message }</div>
		  	 <form action="ShowAprioriServlet" method="post" name="form">
				<div align="center">
					<div>
						<input name="support" type="text" id="key" value="输入支持度" size="30"  align="center"
				       onmouseover=this.focus();this.select();   
				       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
				       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />

						<input name="confidence" type="text" id="key" value="输入置信度" size="30"  align="center"
				       onmouseover=this.focus();this.select();   
				       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
				       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
					   <input type="hidden" name="fileFullPath" value="${fileFullPath }">
					   <input type="hidden" name="method" value="apriori_admin">
					   <input type="submit" value="获取规则" />
					</div>
				</div>
			 </form>
			  <div class="row">                       
                  <div class="col-md-6 mb30" style="width:100%">
                    <h2 class="subtitle mb5">关于关联规则</h2>
                    <p class="mb15">数据关联是数据库中存在的一类重要的可被发现的知识。若两个或多个变量的取值之间存在某种规律性，就称为关联。关联规则挖掘发现大量数据中项集之间有趣的关联或相关联系。</p>
                    <p class="mb15">先将检测指标按五标度划分法分成优，良，中，差，危险，即数据预处理。</p>
                    <p class="mb15">然后导入数据，输入置信度，支持度，得到关联规则。</p>
                    <p class="mb15">这里利用关联规则是为了发现一批检测样品中，各个检测指标之间的内在联系，给未来检测人员进行指标检测时提供一些指导性建议。</p>
                    <div id="weightpie" style="width: 100%; height: 300px"></div>
                  </div><!-- col-md-6 -->
              </div><!-- row -->		
	<%
		System.out.println("test");
		//String message = (String)request.getAttribute("message");
		Map<String,Double> relationRulesMap = (Map<String,Double>)request.getAttribute("relationRulesMap");
		if(relationRulesMap==null){
			System.out.println("null");
			return;
		}
		Set<String> rrKeySet=relationRulesMap.keySet();
		for(String key:rrKeySet){
			System.out.println(key+":"+relationRulesMap.get(key));
		}
	 %>
		<div class="row">
			
			<table id="mytable" class="display" cellspacing="0" width="100%" align="center">
				<thead>
					<tr>
						<th>关联规则</th>
						<th>置信度</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="entry" items="${relationRulesMap }">
						<tr>
							<td><c:out value="${entry.key}" /></td>
							<td><c:out value="${entry.value}" /></td>
						</tr>
					</c:forEach>
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
	</div> <!-- end contentpanel -->
	</div><!-- endmainpanel -->
  </body>
</html>
