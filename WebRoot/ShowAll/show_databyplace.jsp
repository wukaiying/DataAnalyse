<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> 
<%@ page import="dataanalyse.bean.*" %>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.*"%>
<%@page import="dbImpl.*" %>
<%@page import="com.wky.dbUtils.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 <%
  	//物质AflatoxinRe
  	List<DairyBean> axlist = (List<DairyBean>)request.getAttribute("axlist");
   	StringBuffer pa_AflatoxinRe_name = new StringBuffer();
   	StringBuffer pa_AflatoxinRe_value = new StringBuffer();
   	if(axlist==null){
   	}else{
	   	for(DairyBean l:axlist){
		   	pa_AflatoxinRe_name.append(l.getSimpleName()+",");
		   	pa_AflatoxinRe_value.append(l.getAflatoxinRe()+",");
	   	}
   	}
   %>
   <%
   	//CrRe
   	List<DairyBean> crlist = (List<DairyBean>)request.getAttribute("crlist");
   	StringBuffer pa_CrRe_name = new StringBuffer();
   	StringBuffer pa_CrRe_value = new StringBuffer();
   	if(crlist==null){
   	}else{
	   	for(DairyBean l:crlist){
		   	pa_CrRe_name.append(l.getSimpleName()+",");
		   	pa_CrRe_value.append(l.getCrRe()+",");
	   	}
   	}
   	//System.out.println(pa_CrRe_name+"CrRe");
	//System.out.println(pa_CrRe_value);
    %>
    <%
    //ProteinRe
    List<DairyBean> prlist = (List<DairyBean>)request.getAttribute("prlist");
    StringBuffer pa_Protein_name = new StringBuffer();
   	StringBuffer pa_Protein_value = new StringBuffer();
   	if(prlist==null){                     //非空判断
   	}else{
	   	for(DairyBean l:prlist){
		   	pa_Protein_name.append(l.getSimpleName()+",");
		   	pa_Protein_value.append(l.getProteinRe()+",");
	   	}
	    	System.out.println(pa_Protein_name);
			System.out.println(pa_Protein_value);
		}
     %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>按地理位置进行分析</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="user_images/favicon.png" type="image/png">
    <link href="user_css/style.default.css" rel="stylesheet">
    <link href="user_css/morris.css" rel="stylesheet">
    <script type="text/javascript" src="<%=path %>/js/esl.js"></script>
	<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
    <script src="user_js/jquery-1.11.1.min.js"></script>
    <script src="user_js/jquery-migrate-1.2.1.min.js"></script>
    <script src="user_js/bootstrap.min.js"></script>
    <script src="user_js/modernizr.min.js"></script>
    <script src="user_js/jquery.sparkline.min.js"></script>
    <script src="user_js/toggles.min.js"></script>
    <script src="user_js/retina.min.js"></script>
    <script src="user_js/jquery.cookies.js"></script>
    <script src="user_js/morris.min.js"></script>
    <script src="user_js/chosen.jquery.min.js"></script>
    <script src="user_js/custom.js"></script>

  </head>
  
  <body>
   		<div class="mainpanel" style="width: 100%;">

                <div class="headerbar">

                    <a class="menutoggle"><i class="fa fa-bars"></i></a>

                    <form class="searchform" action="PlaceAnalyseServlet" method="post">
                        <input type="text" class="form-control" name="keyword" placeholder="输入地点。。。" />
                        <input type="submit" class ="form_control" value="点击查看" />
                    </form>
                            
                </div><!-- headerbar -->

                <div class="pageheader">
                    <h2><i class="fa fa-bug"></i>同一地理位置奶制品检测指标变化</h2>
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
                            <p class="mb15">1.统计出某种检测指标在奶制品中含量最高的前10个。</p>
                            <p class="mb15">2.统计出某个检测指标在整个奶制品中的变化趋势，并与国家标准做对比。</p>
                            <div id="" style="width: 100%; height: 300px"></div>
                        </div><!-- col-md-6 -->
                    </div><!-- row -->
                    
                    <!-- 选项卡开始 -->
                   	
                   	<div class="row">
                   	<!-- 另一个选项卡 -->
                   	<div class="col-md-6" style="width: 100%;">
          
			          <h5 class="subtitle">Basic Accordion</h5>
			          <p>Get base styles and flexible support for collapsible components like accordions and navigation.</p>
			          <br />
			          
			          <div class="panel-group panel-group-dark" id="accordion">
			            <div class="panel panel-default">
			              <div class="panel-heading">
			                <h4 class="panel-title">
			                  <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
			                	    黄曲霉素
			                  </a>
			                </h4>
			              </div>
			              <div id="collapseOne" class="panel-collapse collapse in">
			                <div class="panel-body">
			                  <div id="main1" style="width: 100%; height: 400px"></div>
			                </div>
			              </div>
			            </div>
			            <div class="panel panel-default">
			              <div class="panel-heading">
			                <h4 class="panel-title">
			                  <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseTwo">
			                    	铬
			                  </a>
			                </h4>
			              </div>
			              <div id="collapseTwo" class="panel-collapse collapse">
			                <div class="panel-body" >
			                  <div id="main2" style="width: 1100%; height: 400px"></div>
			                </div>
			              </div>
			            </div>
			            <div class="panel panel-default">
			              <div class="panel-heading">
			                <h4 class="panel-title">
			                  <a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseThree">
			                    	蛋白质
			                  </a>
			                </h4>
			              </div>
			              <div id="collapseThree" class="panel-collapse collapse">
			                <div class="panel-body" >
			                  <div id="main3" style="width: 1100%; height: 400px"></div>
			                </div>
			              </div>
			            </div>
			          </div>
			          
			        </div>                   	                   	                   	                
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
                                <!-- test -->
                            </div><!-- table-responsive -->
                        </div><!-- panel-body -->
                    </div><!-- panel -->
                    
                </div><!-- contentpanel -->

    	 </div><!-- mainpanel -->
    	 
    	 <script type="text/javascript">
	    var x_AflatoxinRe_data = "<%=pa_AflatoxinRe_name%>";
	    var y_AflatoxinRe_data ="<%=pa_AflatoxinRe_value%>";
	    var x_CrRe_data = "<%=pa_CrRe_name%>";
	    var y_CrRe_data = "<%=pa_CrRe_value%>";
	    var x_Protein_data = "<%=pa_Protein_name%>";
	    var y_Protein_data = "<%=pa_Protein_value%>";
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
	                FunDraw1(ec);
	                FunDrawCrRe(ec);
	                FunDrawProtein(ec);
	            }
	        
	         function FunDraw1(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main1'),'dark'); 
	                
	                var option = {
	                     title: {
					        text: '黄曲霉素',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['实际','标准']
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
	                    xAxis : [
	                        {
	                            type : 'category',
	                            data : x_AflatoxinRe_data.split(",")
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            axisLabel : {
                						formatter: '{value} mg/kg'
           							},
	                            max:'1',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"实际",
	                            "type":"line",
	                            "data":y_AflatoxinRe_data.split(","),
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                        	"name":"标准",
	                            "type":"line",
	                            "data":(function (){
	                            	var d = [];
	                            	var len=35;
	                            	var value=0.5-0;
	                            	while(len--){
	                            		d.push([value]);
	                            	}
	                            	return d;
	                            })(),
	                            
	                            
	                        }
	                    ]
	                };
	        
	                // 为echarts对象加载数据 
	                myChart.setOption(option); 
	            }
	            
	              function FunDrawCrRe(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main2')); 
	                
	                var option = {
	                     title: {
					        text: '铬',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['实际','标准']
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
	                    xAxis : [
	                        {
	                            type : 'category',
	                            data : x_CrRe_data.split(",")
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            axisLabel : {
                						formatter: '{value} mg/kg'
           							},
	                            max:'26',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"实际",
	                            "type":"line",
	                            "data":y_CrRe_data.split(","),
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                        	"name":"标准",
	                            "type":"line",
	                            "data":(function (){
	                            	var d = [];
	                            	var len=35;
	                            	var value=25-0;
	                            	while(len--){
	                            		d.push([value]);
	                            	}
	                            	return d;
	                            })(),
	                            
	                            
	                        }
	                    ]
	                };
	        
	                // 为echarts对象加载数据 
	                myChart.setOption(option); 
	            }
	            
	               function FunDrawProtein(ec) {
	                // 基于准备好的dom，初始化echarts图表
	                var myChart = ec.init(document.getElementById('main3')); 
	                
	                var option = {
	                     title: {
					        text: '蛋白质',
					        subtext: '',
					        x:'left'
					    },
	                    tooltip: {
	                        show: true
	                    },
	                    legend: {
	                        data:['实际','国家标准']
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
	                    xAxis : [
	                        {
	                            type : 'category',
	                            data : x_Protein_data.split(",")
	                        }
	                    ],
	                    yAxis : [
	                        {
	                            type : 'value',
	                            axisLabel : {
                						formatter: '{value} g/100g'
           							},
	                            max:'5',
	                            min:'0'
	                        }
	                    ],
	                    series : [
	                        {
	                            "name":"实际",
	                            "type":"line",
	                            "data":y_Protein_data.split(","),
	                             "markPoint" : {
						                data : [
							                    {type : 'max', name: '最大值'},
							                    {type : 'min', name: '最小值'},
						                	  ]
	           						},
	                        },
	                        {
	                        	"name":"国家标准",
	                            "type":"line",
	                            "data":(function (){
	                            	var d = [];
	                            	var len=35;
	                            	var value=2.3-0;
	                            	while(len--){
	                            		d.push([value]);
	                            	}
	                            	return d;
	                            })(),
	                               
	                        },
	                        
	                        
	                    ]
	                };
	        
	                // 为echarts对象加载数据 
	                myChart.setOption(option); 
	            }
            
    </script>
  </body>
</html>
