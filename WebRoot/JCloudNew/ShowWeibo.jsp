<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
    <base href="<%=basePath%>">   
	   <title>My JSP 'ShowWeibo.jsp' starting page</title>
	  <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery.dataTables.css" type="text/css"></link>
	  <script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.js"></script>
	  <script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.dataTables.min.js"></script>
	  <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery-ui.css" type="text/css"></link>
      <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/dataTables.jqueryui.css" type="text/css"></link>
	  <script type="text/javascript" src="./js/esl.js"></script>
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
				"sZeroRecords": "没有检索到数据",
				//"sProcessing": "<img src='./loading.gif' />"
				}
    		});
    		
		} );
	  </script>
 </head>
  
  <body>
      <div><h3 align="center">热词查询</h1></div>
  	  <div align="center">
  	  <form action="ShowWeiboServlet" method="post">
	  	 <input name="keyword" type="text" id="key" value="热词关键字" size="30"  align="center" 
          onmouseover=this.focus();this.select();   
          onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
         <select name="item">
			 <option value="weibo" selected>微博</option> 
			 <option value="xinwen">新闻</option> 
		 </select>         
          <input type="submit" value="点击查看" />
	  </form>
	   </div>
	   <br>
	<table id="mytable" class="display" cellspacing="0" width="100%" align="center">
	<c:choose>
		<c:when test="${requestScope.weibolist!=null}">
		<thead>
			<tr><div id="echartspie" style="height:300px"></div></tr>
			<tr>
				<th>微博编号</th>
				<th>发布人</th>
				<th>关键字</th>
				<th>微博内容</th>
				<th>采集时间</th>
			</tr>
		</thead>
		
		<tbody>	
			<c:forEach items="${requestScope.weibolist}" var="weibobean">
				<tr>
					<td class="alt"><c:out value="${weibobean.fk_weiboId}"></c:out></td>
					<td class="alt"><c:out value="${weibobean.userId}"></c:out></td>
					<td class="alt"><c:out value="${weibobean.keyWord}"></c:out></td>
					<td class="alt"><c:out value="${weibobean.content}"></c:out></td>
					<td class="alt"><c:out value="${weibobean.collectAt}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
		</c:when>
	
		<c:otherwise>
			<thead>
				<tr>
					<th>新闻编号</th>
					<th>新闻标题</th>
					<th>来源地址</th>
					<th>关键字</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>新闻编号</th>
					<th>新闻标题</th>
					<th>来源地址</th>
					<th>关键字</th>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach items="${requestScope.xinwenlist}" var="xinwenbean">
					<tr>
						<td class="alt"><c:out value="${xinwenbean.newsID}"></c:out></td>
						<td class="alt"><c:out value="${xinwenbean.title}"></c:out></td>
						<td class="alt"><a href="<c:out value="${xinwenbean.url}"></c:out>"><c:out value="${xinwenbean.url}"></c:out></a></td>
						<td class="alt"><c:out value="${xinwenbean.foodClassName}"></c:out></td>
					</tr>
				</c:forEach>
			</tbody>
		</c:otherwise>
	</c:choose>
	</table>
	 <%
	 		StringBuffer sw_value = (StringBuffer)request.getAttribute("Piearray");
	 		String sw_keyword = request.getParameter("keyword");
	 		StringBuffer sw_name = new StringBuffer();
			sw_name.append("正面"+",");
			sw_name.append("负面"+",");
			sw_name.append("中立"+",");
	 		System.out.println(sw_value);
	  %>
	  <script type="text/javascript">
	  		var array_name = "<%=sw_name.toString()%>";
   		    var array_value ="<%=sw_value%>";
    		var keyword = "<%=sw_keyword%>"
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
                var myChart = ec.init(document.getElementById('echartspie')); 
				var option = {
				    title : {
				        //text: keyword,
				        text:'',
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
				           name:'',
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
