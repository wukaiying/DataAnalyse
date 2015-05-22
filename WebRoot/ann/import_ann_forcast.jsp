<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>导入已保存神经网络进行预测</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="./js/esl.js"></script>
	<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
    <link rel="shortcut icon" href="user_images/favicon.png" type="image/png">
    <link href="user_css/style.default.css" rel="stylesheet">
    <link href="user_css/morris.css" rel="stylesheet">
	<link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery.dataTables.css" type="text/css"></link>
	<script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.js"></script>
	<script type="text/javascript" src="<%=path %>/jsdatatable/media/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/jquery-ui.css" type="text/css"></link>
    <link rel="stylesheet" href="<%=path %>/jsdatatable/media/css/dataTables.jqueryui.css" type="text/css"></link>

  </head>
  <%
  	Object annForcastResultJson = request.getAttribute("annForcastResultJson");//预测数据
   %>
  <body>
     <div class="mainpanel" style="width: 100%;">
	  	 <div class="pageheader">
	            <h2><i class="fa fa-bug"></i>导入神经网络并预测</h2>
	            <div class="breadcrumb-wrapper">
	                <span class="label">You are here:</span>
	                <ol class="breadcrumb">
	                    <li><a href="index.html">Bracket</a></li>
	                    <li><a href="bug-tracker.html">Bug Tracker</a></li>
	                    <li class="active">Summary</li>
	                </ol>
	            </div>
	            <form action="ImportAnnForcastServlet" method="post" enctype="multipart/form-data">	           	
		                                                     导入网络模型(.snet格式)：<input type="file" name="ann_model"><br/>   
			                                         导入预测数据：<input type="file" name="forcast_data"> <br/>                  													
						 <input type="submit" value="开始训练" />						                                      			
				</form>
				 
	      </div>
	       <div class="contentpanel">
          	  <div class="row">                       
                  <div class="col-md-6 mb30" style="width:100%;height:30%">
                    <h2 class="subtitle mb5">关于神经网络</h2>
                    <p class="mb15">利用已有的历史数据，预测未来的输出结果</p>
                    <p class="mb15">用户分别导入已经保存好的神经网络模型，和预测数据，不用重新训练神经网络，可直接进行风险预测。</p>
                    <div id="main2" style="width: 100%; height: 400px"></div>
                  </div><!-- col-md-6 -->
              </div><!-- row -->
           </div>
	</div><!-- endmainpanel -->
	<script type="text/javascript">
	    
	     
	     var annForcastArr = "<%=annForcastResultJson%>"; 
	     var annForcast_my = eval(annForcastArr);
	     alert(annForcast_my[0]);
	     
	   // alert(row);
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
	                //FunDraw(ec);
	                FunDrawAnnForcast(ec)
	            }
	        
	         function FunDraw(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main1'),'dark'); 
	                
	                var option = {
	                     title: {
					        text: '8个样本输出',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['样本1','样本2','样本3','样本4','样本5','样本6','样本7','样本8','标准线']
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
					    calculable : true,
    					grid: {y: 70, y2:30, x2:20},
	                    xAxis : [
	                        {
	                            type : 'category',
	                            data : ['重金属','致病菌','化学污染'],
	                       		axisLabel: { rotate: 60, }, 
	                        },
	                        {
					            type : 'category',
					            axisLine: {show:false},
					            axisTick: {show:false},
					            axisLabel: {show:false},
					            splitArea: {show:false},
					            splitLine: {show:false},
					            data : ['重金属','致病菌','化学污染']
					        },
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            axisLabel:{formatter:'{value} '},
	                            max:'5.5',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"样本1",
	                            "type":"bar",
	                            "itemStyle": {normal: {color:'rgba(193,35,43,1)', label:{show:true}}},
	                            "data":arr_my[0],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"样本2",
	                            "type":"bar",
	                            "data":arr_my[1],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"样本3",
	                            "type":"bar",
	                            "data":arr_my[2],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"样本4",
	                            "type":"bar",
	                            "data":arr_my[3],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"样本5",
	                            "type":"bar",
	                            "data":arr_my[4],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"样本6",
	                            "type":"bar",
	                            "data":arr_my[5],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"样本7",
	                            "type":"bar",
	                            "data":arr_my[6],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"样本8",
	                            "type":"bar",
	                            "data":arr_my[7],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"标准线",
	                            "type":"bar",
	                            "xAxisIndex":1,
	                            "itemStyle": {normal: {color:'rgba(252,206,16,0.5)', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'+'):'';}}}},
	                            "data":[3.0,3.03,5.15],
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
	            
	         function FunDrawAnnForcast(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main2'),'dark'); 
	                
	                var option = {
	                     title: {
					        text: '8个月中测试样本输出',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['1月','2月','3月','4月','5月','6月','7月','8月','标准线']
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
					    calculable : true,
    					grid: {y: 70, y2:30, x2:20},
	                    xAxis : [
	                        {
	                            type : 'category',
	                            data : ['重金属','致病菌','化学污染'],
	                       		axisLabel: { rotate: 60, }, 
	                        },
	                        {
					            type : 'category',
					            axisLine: {show:false},
					            axisTick: {show:false},
					            axisLabel: {show:false},
					            splitArea: {show:false},
					            splitLine: {show:false},
					            data : ['重金属','致病菌','化学污染']
					        },
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            axisLabel:{formatter:'{value} ms'},
	                            max:'5.5',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"1月",
	                            "type":"bar",
	                             "itemStyle": {normal: {color:'rgba(193,35,43,1)', label:{show:true}}},
	                            "data":annForcast_my[0],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"2月",
	                            "type":"bar",
	                            "data":annForcast_my[1],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"3月",
	                            "type":"bar",
	                            "data":annForcast_my[2],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"4月",
	                            "type":"bar",
	                            "data":annForcast_my[3],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"5月",
	                            "type":"bar",
	                            "data":annForcast_my[4],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"6月",
	                            "type":"bar",
	                            "data":annForcast_my[5],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"7月",
	                            "type":"bar",
	                            "data":annForcast_my[6],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"8月",
	                            "type":"bar",
	                            "data":annForcast_my[7],
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"标准线",
	                            "type":"bar",
	                            "xAxisIndex":1,
	                            "itemStyle": {normal: {color:'rgba(252,206,16,0.5)', label:{show:true,formatter:function(p){return p.value > 0 ? (p.value +'+'):'';}}}},
	                            "data":[3.0,3.03,5.15],
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
  </body>
</html>
