<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> 
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.wky.dairyDao.*" %>
<%@page import="com.wky.dairyDaoImpl.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
  <%
  		String keyword = request.getParameter("keyword");
  		if(keyword==null||"".equals(keyword)){
  			keyword = "CrRe";
  		}
  		DairyDaoImpl dairyDaoImpl = new DairyDaoImpl();
  		List<StringBuffer> list = new ArrayList<StringBuffer>();
  		list = dairyDaoImpl.findDairyByElemTop10(keyword);
  		StringBuffer sdName = list.get(0);
  		StringBuffer sdValue = list.get(1);
  		
  		//elem
  		List<StringBuffer> list1 = new ArrayList<StringBuffer>();
  		list1 = dairyDaoImpl.findDairyByElem(keyword);
  		StringBuffer sdNameAll = list1.get(0);
  		StringBuffer sdValueAll = list1.get(1);
   %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>通过检测指标进行展示</title>
    
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
  </head>
  <body>
    	<div class="mainpanel" style="width: 100%;">

                <div class="headerbar">

                    <a class="menutoggle"><i class="fa fa-bars"></i></a>

                    <form class="searchform" action="<%=path %>/ShowAll/show_databyelme.jsp" method="post">
                        <input type="text" class="form-control" name="keyword" placeholder="在此搜索..." />
                        <input type="submit" class ="form_control" value="点击查看" />
                    </form>
                            
                </div><!-- headerbar -->

                <div class="pageheader">
                    <h2><i class="fa fa-bug"></i>检测指标变化趋势</h2>
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
                    
                   
                   
                    <div class="row" >
                        <div class="col-md-6" style="width: 100%;">
                            
                            <div class="panel panel-dark panel-alt">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="" class="panel-close">&times;</a>
                                        <a href="" class="minimize">&minus;</a>
                                    </div><!-- panel-btns -->
                                    <h5 class="panel-title">元素含量最高的前10个</h5>
                                </div><!-- panel-heading -->
                                <div class="panel-body panel-table">
                                    <div class="table-responsive" >
                                   		 <div id="elem-top10" style="width: 100%; height: 400px"></div>
                                    </div><!-- table-responsive -->
                                </div><!-- panel-body -->
                            </div><!-- panel -->
                            
                        </div><!-- col-md-6 -->
                        
                        <div class="col-md-6" style="width: 100%;">
                            
                            <div class="panel panel-dark panel-alt">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="" class="panel-close">&times;</a>
                                        <a href="" class="minimize">&minus;</a>
                                    </div><!-- panel-btns -->
                                    <h5 class="panel-title">所有检测样品中元素变化趋势</h5>
                                </div><!-- panel-heading -->
                                <div class="panel-body panel-table">
                                    <div class="table-responsive" >
                                   		 <div id="elem-all" style="width: 100%; height: 400px"></div>
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
                                <p>得到了检测指标实际含量最高的10个样本，他们所处的危险等级最高</p>
                                <p>由于所有检测指标都远远低于标准指标，对于 这一批样本而言此指标合格</p>
                            </div><!-- table-responsive -->
                        </div><!-- panel-body -->
                    </div><!-- panel -->
                    
                </div><!-- contentpanel -->

    	 </div><!-- mainpanel -->
    	 <script type="text/javascript">
    	 	var keyword = "<%=keyword%>";
    	 	if(keyword=="CrRe"){
    	 		var keywordre = "铬";
    	 		var danwei = "mg/kg";
    	 	}else if(keyword=="ProteinRe"){
    	 		keywordre = "蛋白质";
    	 		danwei = "g/100g";
    	 	}else if(keyword=="AflatoxinRe"){
    	 		keywordre = "黄曲霉素";
    	 		danwei = "mg/kg";
    	 	}
		    var x_data = "<%=sdName.toString()%>";
		    var y_data ="<%=sdValue.toString()%>";
		    var x_dataall = "<%=sdNameAll.toString()%>";
		    var y_dataall ="<%=sdValueAll.toString()%>";
		   
		    
		        // 路径配置
		        require.config({
		            paths:{ 
		                'echarts' : '.js/echarts',
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
		                FunDraw2(ec);
		            }
		        
		         function FunDraw1(ec) {
		                // 基于准备好的dom，初始化echarts图表
		                var myChart = ec.init(document.getElementById('elem-top10')); 
		                
		                var option = {
		                     title: {
						        text: keywordre+'含量top10(单位：'+danwei+')',
						        subtext: '',
						        x:'left'
						    },
		                    tooltip: {
		                        show: true
		                    },
		                    legend: {
		                        data:['']
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
		                            data : x_data.split(","),
		                            axisLabel: { 
		                            	rotate: 60
		                             }, 
		                        }
		                    ],
		                    yAxis : [
		                        {
		                            type : 'value',
		                            axisLabel : {
                						formatter: '{value} '
           							},
		                            max:'5',
		                            min:'0'
		                        }
		                    ],
		                    series : [
		                        {
		                            "name":"含量",
		                            "type":"bar",
		                            "data":y_data.split(",")
		                        }
		                    ]
		                };
		        
		                // 为echarts对象加载数据 
		                myChart.setOption(option); 
		            }
		            
		             function FunDraw2(ec) {
		                // 基于准备好的dom，初始化echarts图表
		                var myChart = ec.init(document.getElementById('elem-all')); 
		                
		                var option = {
		                     title: {
						        text: keywordre+'含量变化趋势图(单位：'+danwei+')',
						        subtext: '',
						        x:'left'
						    },
		                    tooltip: {
		                        show: true
		                    },
		                    legend: {
		                        data:['']
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
		                            data : x_dataall.split(","),
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
		                            "name":"含量",
		                            "type":"line",
		                            "data":y_dataall.split(","),
		                             "markPoint" : {
							                data : [
								                    {type : 'max', name: '最大值'},
								                    {type : 'min', name: '最小值'}
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
