<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<base href="<%=basePath%>">
    <title>My JSP 'PlaceAnalse.jsp' starting page</title>
	<script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
	<script type="text/javascript" src="<%=path %>/js/esl.js"></script>
    <link rel="stylesheet" href="<%=path %>/csstab/tab.css" type="text/css"></link>
    <script type="text/javascript" src="<%=path %>/js/tab.js"></script>
  </head>
  
   <body>
   <form action="PlaceAnalyseServlet" method="post">
	   	<div align="center">
	  	 <input name="place" type="text" id="key" value="要查询的地点" size="30"  align="center"
	          onmouseover=this.focus();this.select();   
	          onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
	          onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
	          
	     <input type="submit" value="点击查看" />
	     </div>
    </form>
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
    
     <div id="warp"> 
	    <div class="domtab doprevnext"> 
	        <ul class="domtabs"> 
	            <li><a href="#tab1">铬</a></li> 
	            <li><a href="#tab2">黄曲霉素</a></li> 
	            <li><a href="#tab3">蛋白质</a></li> 
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
	   </div>
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
                            max:'1',
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
                        data:['实际','标准1','标准2']
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
                        	"name":"标准1",
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
                        
                         {
                        	"name":"标准2",
                            "type":"line",
                            "data":(function (){
                            	var d = [];
                            	var len=35;
                            	var value=2.9-0;
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
