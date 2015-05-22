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
    <base href="<%=basePath%>">   
    <title></title>
	  <script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
	  <link rel="stylesheet" href="<%=path %>/css/SelectCard.css" type="text/css"></link>
	  <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery.dataTables.css" type="text/css"></link>
	  <script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.js"></script>
	  <script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.dataTables.min.js"></script>
	  <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery-ui.css" type="text/css"></link>
      <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/dataTables.jqueryui.css" type="text/css"></link>
	  <script type="text/javascript" src="./js/esl.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/force.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/chord.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/config.js"></script>
 	  <script type="text/javascript" src="../js/tab.js"></script>
  </head>
  
  <body>
  	<div style="margin-bottom:10px; margin-top:10px;">
	  	<form action="ShowAllByHotWordServlet" method="post">
			<div align="center">
				<input name="dairyname" type="text" id="key" value="样品名称" size="30"  align="center"
			       onmouseover=this.focus();this.select();   
			       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
			       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
				<select name="selectcity">
				 <option value="贵阳市" selected>贵阳市</option> 
				 <option value="铜仁市">铜仁市</option> 
				 <option value="遵义市">遵义市</option> 
				</select>         
				<input type="submit" value="点击查看" />
			</div>
		</form>
	</div>
  	<div id="tabs" style="width:100%;">
	    <ul class="tabs_header" >
	        <li>蛋白质含量</li>
	        <li>黄曲霉素</li>
	        <li>网络评论</li>
	    </ul>
	    <div class="tabs_content1" id="main1"style="width:100%; height:500px;align:center">
	    </div>
	    <div class="tabs_content2"  id="main2" style="width:100%;height:300px">
					
	     </div>
	    <div class="tabs_content3" id="main3" >
	    </div>
	</div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#tabs").tabs();
        });
    </script>
    <script type="text/javascript">
        
        (function ($) {
            $.fn.tabs = function () {
                var content = this.find("div");
                var list = this.find("ul.tabs_header").find("li");
                content.hide();
                content.eq(0).show();
                list.eq(0).addClass("active");
                list.each(function (i) {
                    $(this).bind({
                        click: function () {
                            list.removeClass("active");
                            content.hide();
                            content.eq(i).css("display", "");
                            $(this).addClass("active");
                        },
                        mousemove: function () {
                            $(this).addClass("hover");
                        },
                        mouseout: function () {
                            $(this).removeClass("hover");
                        }
                    });
                });
            }
        })(jQuery);
		
    </script>
    <!-- echarts 图表显示 -->
    <%
    	StringBuffer sab_Protein_name = (StringBuffer)request.getAttribute("Protein_name");
    	StringBuffer sab_Protein_value = (StringBuffer)request.getAttribute("Protein_value");
    	StringBuffer sab_Aflatoxin_name = (StringBuffer)request.getAttribute("Aflatoxin_name");
    	StringBuffer sab_Aflatoxin_value = (StringBuffer)request.getAttribute("Aflatoxin_value");
     %>
      <script type="text/javascript">
	     var x_Protein_data = "<%=sab_Protein_name%>";
	     var y_Protein_data = "<%=sab_Protein_value%>";
	     var x_Aflatoxin_data = "<%=sab_Aflatoxin_name%>";
	     var y_Aflatoxin_data = "<%=sab_Aflatoxin_value%>";
	       // 路径配置
	        require.config({
	            paths:{ 
	                'echarts' : '../js/echarts',
	                'echarts/chart/bar' : '../js/echarts',
	                'echarts/chart/line': '../js/echarts',
	                'echarts/chart/pie': '../js/echarts'
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
	                FunDrawProtein(ec);
	                FunDrawAflatoxin(ec);
	            }
	        
	         function FunDrawProtein(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main1'),'dark'); 
	                
	                var option = {
	                     title: {
					        text: '元素含量',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['蛋白质含量']
	                    },
	                    grid:{
	                    	
	                    },
	                    toolbox: {
					        show : false,
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
	                            data : x_Protein_data.split(","),
	                       		axisLabel: { rotate: 60, }, 
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            max:'5',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"蛋白质含量",
	                            "type":"bar",
	                            "data":y_Protein_data.split(","),
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        
	                    ]
	                };
	        
	                // 为echarts对象加载数据 
	                myChart.setOption(option); 
	            }   
	            
	             function FunDrawAflatoxin(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main2'),'dark'); 
	                
	                var option = {
	                     title: {
					        text: '元素含量',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['黄曲霉素含量']
	                    },
	                    grid:{
	                    	width:'500px',
	                    	heght:'300px'
	                    },
	                    toolbox: {
					        show : false,
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
	                            data : x_Aflatoxin_data.split(","),
	                       		axisLabel: { rotate: 60, }, 
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            max:'0.5',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"黄曲霉素含量",
	                            "type":"bar",
	                            "data":y_Aflatoxin_data.split(","),
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        
	                    ]
	                };
	        
	                // 为echarts对象加载数据 
	                myChart.setOption(option); 
	            }   
            
                    
  </script>
    <!-- 表格显示 -->
    <script type="text/javascript">
	  	$(document).ready(function() {
    		$('#dairytable').DataTable({
    			//"scrollY":        400,
		        //"scrollCollapse": true,
		        //"jQueryUI":       true
    		});
    		
		} );
	  </script>
	 <table id="dairytable" align="center">
	 	<thead>
	 		<tr>
	 			<th>编号</th><th>注册编号</th><th>样品名称</th><th>所属市</th><th>被检测地点</th><th>是否合格</th><th>生产日期</th>
	 		</tr>
	 	</thead>
	 	<tbody>
	 		<c:forEach items="${requestScope.listDairyBean }" var="dairybean">
	 			<tr>
			 		<td class="alt"><c:out value="${dairybean.dairyID}"></c:out></td>
					<td class="alt"><c:out value="${dairybean.registNum}"></c:out></td>
					<td class="alt"><c:out value="${dairybean.simpleName}"></c:out></td>
					<td class="alt"><c:out value="${dairybean.detectPlace}"></c:out></td>
					<td class="alt"><c:out value="${dairybean.detectedPlace}"></c:out></td>
					<td class="alt"><c:out value="${dairybean.finalJudge}"></c:out></td>
					<td class="alt"><c:out value="${dairybean.productionDate}"></c:out></td>
	 			</tr>
	 		</c:forEach>
	 	</tbody>
	 </table>
  </body>
</html>
