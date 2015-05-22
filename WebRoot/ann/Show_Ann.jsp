<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <script type="text/javascript" src="./js/esl.js"></script>
	<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
    <title>神经网络管理员</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  ${requestScope.message }	
  <body>
    <form action="Artificial_Neural_Networks_Servlet" method="post">
		<div align="center">
			<div>
				<input name="shuru_num" type="text" id="key" value="输入层节点数" size="30"  align="center"
		       onmouseover=this.focus();this.select();   
		       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
		       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
			</div>
			<div>
				<input name="shuchu_num" type="text" id="key" value="输出层节点数" size="30"  align="center"
		       onmouseover=this.focus();this.select();   
		       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
		       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
			</div>
			<div>
				<input name="xunlian_num" type="text" id="key" value="训练样本数目" size="30"  align="center"
		       onmouseover=this.focus();this.select();   
		       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
		       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
			</div>
			<div>
				<input name="fanhua_num" type="text" id="key" value="预测样本数目" size="30"  align="center"
		       onmouseover=this.focus();this.select();   
		       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
		       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />       
			</div>
			
			<input type="submit" value="开始训练" />
		</div>
	</form>
	<div>
		<div  id="main1" style="height:500px"></div>
		<div  id="main2" style="height:500px"></div>
	</div>
	<%
		Object outPutJson = request.getAttribute("outPutJson");
		Object annForcastResultJson = request.getAttribute("annForcastResultJson");//预测数据
		Object annForcastMapJson = request.getAttribute("annForcastMapJson");  //预测数据json格式
		//System.out.println("json:"+json);
	 %>
	  <script type="text/javascript">
	     var arr = "<%=outPutJson%>";
	     var arr_my = eval(arr);
	     alert(arr_my[0]); 
	     
	     var annForcastArr = "<%=annForcastResultJson%>"; 
	     var annForcast_my = eval(annForcastArr);
	     alert(annForcast_my[0]);
	     
	     var annForcastMapArr = "<%=annForcastMapJson%>";
	     alert(annForcastMapArr);
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
	                FunDraw(ec);
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
