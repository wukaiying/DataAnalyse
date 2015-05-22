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
    
    <title>My JSP 'ShowAllByHotWordNew.jsp' starting page</title>
	  <script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
	  <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery.dataTables.css" type="text/css"></link>
	  <script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.js"></script>
	  <script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.dataTables.min.js"></script>
	  <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery-ui.css" type="text/css"></link>
      <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/dataTables.jqueryui.css" type="text/css"></link>
	  <script type="text/javascript" src="<%=path %>/js/tab.js"></script>
	  <link rel="stylesheet" href="<%=path %>/csstab/tab.css" type="text/css"></link>
  	  <script type="text/javascript" src="./js/esl.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/force.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/chord.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/config.js"></script>
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
	
	<!--datatables js -->
	
    <div id="warp"> 
	    <div class="domtab doprevnext"> 
	        <ul class="domtabs"> 
	            <li><a href="#tab1">蛋白质</a></li> 
	            <li><a href="#tab2">黄曲霉素</a></li> 
	            <li><a href="#tab3">铬</a></li> 
	            <li><a href="#tab4">网络评论</a></li> 
	        </ul> 
	       
	        <!-- TAB 1 --> 
	        <div> 
	            <h2><a name="tab1" id="tab1"></a></h2> 
	            <div id="main2" style="width:700px;height:400px">
	            </div>
	           
	        </div> 
	        <!-- TAB 2 --> 
	        <div> 
	            <h2><a name="tab2" id="tab2"></a></h2> 
	            <div id="main1" style="width:700px;height:400px">
	            </div>
	           
	        </div> 
	        <!-- TAB 3 --> 
	        <div> 
	            <h2><a name="tab3" id="tab3"></a></h2> 
	            <div id="main3" style="width:700px;height:400px">
	            </div>
	        </div> 
	        <!-- TAB 4 --> 
	        <div> 
	            <h2><a name="tab4" id="tab4"></a></h2> 
	             <script type="text/javascript">
				  	$(document).ready(function() {
			    		$('#weibotable').dataTable({
			    			//"scrollY":        400,
					        //"scrollCollapse": true,
					        //"jQueryUI":       true
					        "aLengthMenu": [[5, 15, 20, -1], [5, 15, 20, "All"]],
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
							
							}
			    		});
			    		
					} );
				  </script>
	            <table id="weibotable" class="display" cellspacing="0" width="100%" align="center">
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
	            </table>
	        </div> 
	    </div> 
	</div> 
	
	 <!-- echarts 图表显示 -->
    <%
    	StringBuffer sab_Protein_name = (StringBuffer)request.getAttribute("Protein_name");
    	StringBuffer sab_Protein_value = (StringBuffer)request.getAttribute("Protein_value");
    	StringBuffer sab_Aflatoxin_name = (StringBuffer)request.getAttribute("Aflatoxin_name");
    	StringBuffer sab_Aflatoxin_value = (StringBuffer)request.getAttribute("Aflatoxin_value");
    	//test
    	StringBuffer sab_Protein_name1 = (StringBuffer)request.getAttribute("Protein_name");
    	StringBuffer sab_Protein_value1 = (StringBuffer)request.getAttribute("Protein_value");
     %>
      <script type="text/javascript">
	     var x_Protein_data = "<%=sab_Protein_name%>";
	     var y_Protein_data = "<%=sab_Protein_value%>";
	     var x_Aflatoxin_data = "<%=sab_Aflatoxin_name%>";
	     var y_Aflatoxin_data = "<%=sab_Aflatoxin_value%>";
	     
	     //test
	     var x_Protein_data1 = "<%=sab_Protein_name1%>";
	     var y_Protein_data1 = "<%=sab_Protein_value1%>";
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
	                FunDrawProtein1(ec);
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
	                    	x:'100px',
	                    	y:'100px',
	                    	width:'600px',
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
	                    	x:'100px',
	                    	y:'100px',
	                    	width:'600px',
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
            
        //tst 
	         function FunDrawProtein1(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main3'),'dark'); 
	                
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
	                    	x:'100px',
	                    	y:'100px',
	                    	width:'600px',
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
	                            data : x_Protein_data1.split(","),
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
	                            "data":y_Protein_data1.split(","),
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
    
	  
	  <!--echarts 饼图 -->
	  <%
	 		StringBuffer sw_value = (StringBuffer)request.getAttribute("Piearray");
	 		String sw_keyword = request.getParameter("keyname");
	 		StringBuffer sw_name = new StringBuffer();
			sw_name.append("正面"+",");
			sw_name.append("负面"+",");
			sw_name.append("中立"+",");
	 		System.out.println(sw_value);
	  %>
	  <script type="text/javascript">
	  		var array_name = "<%=sw_name%>";
   		    var array_value ="<%=sw_value%>";
    		var keyword = "<%=sw_keyword%>";
    		alert(array_value);
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
				            radius : '50%',
				            center: ['60%', '50%'],
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
	  <!-- datatables -->
	  <!-- 表格显示 -->
    <script type="text/javascript">
	  	$(document).ready(function() {
    		$('#jiancetable').DataTable({
    			//"scrollY":        400,
		        //"scrollCollapse": true,
		        //"jQueryUI":       true
		        "aLengthMenu": [[5, 15, 20, -1], [5, 15, 20, "All"]],
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
	  <div >
		 <table id="jiancetable">
		 	<thead>
		 		<tr>
		 			<th>编号</th><th>注册编号</th><th>样品名称</th><th>所属市</th><th>被检测地点</th><th>是否合格</th><th>生产日期</th>
		 		</tr>
		 	</thead>
		 	<tbody>
		 		<c:forEach items="${requestScope.listDairyBean }" var="dairybean">
		 			<tr>
				 		<td><c:out value="${dairybean.dairyID}"></c:out></td>
						<td><c:out value="${dairybean.registNum}"></c:out></td>
						<td><c:out value="${dairybean.simpleName}"></c:out></td>
						<td class="alt"><c:out value="${dairybean.detectPlace}"></c:out></td>
						<td class="alt"><c:out value="${dairybean.detectedPlace}"></c:out></td>
						<td class="alt"><c:out value="${dairybean.finalJudge}"></c:out></td>
						<td class="alt"><c:out value="${dairybean.productionDate}"></c:out></td>
		 			</tr>
		 		</c:forEach>
		 	</tbody>
		 </table>
	 </div>
  </body>
</html>
