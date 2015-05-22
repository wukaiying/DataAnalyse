<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ahp</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="./js/esl.js"></script>
	<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
	<%
		//指标数目 '过氧化值','菌类总数','霉菌计数','铅','酸价','唐酸钠'
	  	StringBuffer zhibiaoName = new StringBuffer();
	  	zhibiaoName.append("过氧化值"+",").append("菌类总数"+",").append("霉菌计数"+",").append("铅"+",").append("酸价"+",").append("唐酸钠"+",");
  		Object weightJson = request.getAttribute("weightJson");
  		Object  productWeightJson = request.getAttribute("productWeightJson");
  		Object weightJsonBiaozhun = request.getAttribute("weightJsonBiaozhun");
  		Object  productWeightJsonBiaozhun = request.getAttribute("productWeightJsonBiaozhun");
   	%>
	<script type="text/javascript">
	     
	     var weight = "<%=weightJson%>";
	     var arr_my = eval(weight);
	     var productWeight = "<%=productWeightJson%>";
	     var arrProductWeight = eval(productWeight);
	      var weightBiaozhun = "<%=weightJsonBiaozhun%>";
	      var arrWeightBiaozhun = eval(weightBiaozhun);
	      var productWeightbiaozhun = "<%=productWeightJsonBiaozhun%>";
	      var arrProductWeightBiaozhun = eval(productWeightbiaozhun);
	      
	      
	     //alert(arr_my);
	    
	    
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
	                FunDraw1(ec);
	            }
	        
	         function FunDraw(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main1'),'dark'); 
	                
	                var option = {
	                     title: {
					        text: '一批月饼中各指标权重',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['指标权重','标准指标权重'],
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
	                            data : ['过氧化值','菌类总数','霉菌计数','铅','酸价','唐酸钠'],
	                       		axisLabel: { rotate: 60, }, 
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            max:'1',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"指标权重",
	                            "type":"line",
	                            "data":arr_my,
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"标准指标权重",
	                            "type":"line",
	                            "data":arrWeightBiaozhun,
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
	             function FunDraw1(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main2'),'dark'); 
	                
	                var option = {
	                     title: {
					        text: '各类月饼风险值',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['月饼风险值','风险标准线'],
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
	                            data : ['滇式五仁月饼','广式叉烧月饼','滇式云腿月饼','冬蓉凤梨味月饼','广式伍仁月饼','雲腿月饼','苹果味月饼','云腿月饼','云腿白饼','荔枝味水果月饼','广式黄金月饼','云腿白饼月饼','五仁味豆蓉广式月饼','云腿月饼','翡翠月饼','云腿月饼','侨香村潮式月饼','昆冠集团叉烧月饼','火腿月饼','火腿月饼'],
	                       		axisLabel: { rotate: 60, }, 
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            max:'300',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"月饼风险值",
	                            "type":"line",
	                            "data":arrProductWeight,
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                            "name":"风险标准线",
	                            "type":"line",
	                            "data":arrProductWeightBiaozhun,
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
  </head>
${requestScope.message }	
  <body>
  <form id="form" action="ShowAHPServlet" method="post">
   <input type="submit" value="开始训练" />
  </form>
  <div  id="main1" style="height:500px"></div>
  <div id="main2" style="height:500px"></div>
  </body>
</html>
