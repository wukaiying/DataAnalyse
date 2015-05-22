<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title></title>
      <script type="text/javascript" src="<%=path %>/js/esl.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/force.js"></script>
	  <script type="text/javascript" src="<%=path %>/js/chord.js"></script>
  	  <script type="text/javascript" src="<%=path %>/js/config.js"></script>
  	  <script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
  	  <link rel="stylesheet" href="<%=path %>/css/SelectCard.css" type="text/css"></link>
  </head>
   <%
   	ElemPlaceAnalyse elemPlaceAnalyse = new ElemPlaceAnalyse();
    List<DairyBean> listAflatoxinGuizhou = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("贵阳市");
    StringBuffer ep_AflatoxinGuizhou_name = new StringBuffer();
   	StringBuffer ep_AflatoxinGuizhou_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinGuizhou){
	   	ep_AflatoxinGuizhou_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinGuizhou_value.append(l.getAflatoxinRe()+",");
   	}
    	//System.out.println(ep_AflatoxinTongren_name);
		//System.out.println(ep_AflatoxinTongren_value);
	//铜仁市
	List<DairyBean> listAflatoxinTongren = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("铜仁市");
    StringBuffer ep_AflatoxinTongren_name = new StringBuffer();
   	StringBuffer ep_AflatoxinTongren_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinTongren){
	   	ep_AflatoxinTongren_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinTongren_value.append(l.getAflatoxinRe()+",");
   	}
    //System.out.println(ep_AflatoxinTongren_name);
	//System.out.println(ep_AflatoxinTongren_value);
	//毕节市
	List<DairyBean> listAflatoxinBijie = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("毕节市");
    StringBuffer ep_AflatoxinBijie_name = new StringBuffer();
   	StringBuffer ep_AflatoxinBijie_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinBijie){
	   	ep_AflatoxinBijie_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinBijie_value.append(l.getAflatoxinRe()+",");
   	}
    //System.out.println(ep_AflatoxinBijie_name);
	//System.out.println(ep_AflatoxinBijie_value);
	//黔南自治州
	List<DairyBean> listAflatoxinQiannan = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("黔南自治州");
    StringBuffer ep_AflatoxinQiannan_name = new StringBuffer();
   	StringBuffer ep_AflatoxinQiannan_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinQiannan){
	   	ep_AflatoxinQiannan_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinQiannan_value.append(l.getAflatoxinRe()+",");
   	}
    //System.out.println(ep_AflatoxinQiannan_name);
	//System.out.println(ep_AflatoxinQiannan_value);
	//安顺市
	List<DairyBean> listAflatoxinAnshun = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("黔南自治州");
    StringBuffer ep_AflatoxinAnshun_name = new StringBuffer();
   	StringBuffer ep_AflatoxinAnshun_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinAnshun){
	   	ep_AflatoxinAnshun_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinAnshun_value.append(l.getAflatoxinRe()+",");
   	}
    //System.out.println(ep_AflatoxinAnshun_name);
	//System.out.println(ep_AflatoxinAnshun_value);
	//遵义市
	List<DairyBean> listAflatoxinZunyi = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("遵义");
    StringBuffer ep_AflatoxinZunyi_name = new StringBuffer();
   	StringBuffer ep_AflatoxinZunyi_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinZunyi){
	   	ep_AflatoxinZunyi_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinZunyi_value.append(l.getAflatoxinRe()+",");
   	}
    //System.out.println(ep_AflatoxinZunyi_name);
	//System.out.println(ep_AflatoxinZunyi_value);
	//黔东南自治区
	List<DairyBean> listAflatoxinQiandongnan = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("遵义");
    StringBuffer ep_AflatoxinQiandongnan_name = new StringBuffer();
   	StringBuffer ep_AflatoxinQiandongnan_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinQiandongnan){
	   	ep_AflatoxinQiandongnan_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinQiandongnan_value.append(l.getAflatoxinRe()+",");
   	}
    //System.out.println(ep_AflatoxinQiandongnan_name);
	//System.out.println(ep_AflatoxinQiandongnan_value);
     %>
  <body>
  <h2 align="center">数据分析</h2>
     <div id="tabs">
        <ul class="tabs_header">
            <li>黄曲霉素（柱形图）</li>
            <li>黄曲霉素（折线图）</li>
            <li></li>
        </ul>
        <div class="tabs_content" id="main1" style="height:300px">
        </div>
        <div class="tabs_content" id="main2" style="height:300px;width:800px">
        </div>
        <div class="tabs_content" id="main3" style="height:600px;width:600px">
            
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
     <script type="text/javascript">
    var x_AflatoxinGuizhou_data = "<%=ep_AflatoxinGuizhou_name.toString()%>";
    var y_AflatoxinGuizhou_data = "<%=ep_AflatoxinGuizhou_value.toString()%>";
    var x_AflatoxinTongren_data = "<%=ep_AflatoxinTongren_name.toString()%>";
    var y_AflatoxinTongren_data = "<%=ep_AflatoxinTongren_value.toString()%>";
    var x_AflatoxinBijie_data = "<%=ep_AflatoxinBijie_name.toString()%>";
    var y_AflatoxinBijie_data = "<%=ep_AflatoxinBijie_value.toString()%>";
    var x_AflatoxinQiannan_data = "<%=ep_AflatoxinQiannan_name.toString()%>";
    var y_AflatoxinQiannan_data = "<%=ep_AflatoxinQiannan_value.toString()%>";
    var x_AflatoxinAnshun_data = "<%=ep_AflatoxinAnshun_name.toString()%>";
    var y_AflatoxinAnshun_data = "<%=ep_AflatoxinAnshun_value.toString()%>";
    var x_AflatoxinZunyi_data = "<%=ep_AflatoxinZunyi_name.toString()%>";
    var y_AflatoxinZunyi_data = "<%=ep_AflatoxinZunyi_value.toString()%>";
    var x_AflatoxinQiandongnan_data = "<%=ep_AflatoxinQiandongnan_name.toString()%>";
    var y_AflatoxinQiandongnan_data = "<%=ep_AflatoxinQiandongnan_value.toString()%>";
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
                FunDrawAflatoxin(ec);
                FunDrawAflatoxin2(ec);
            }
        
         function FunDrawAflatoxin(ec) {
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
                        data:['贵阳市','铜仁市','毕节市','黔南自治州','安顺市','遵义市']
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
                            data : x_AflatoxinGuizhou_data.split(",")
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
                            "name":"贵阳市",
                            "type":"bar",
                            "data":y_AflatoxinGuizhou_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                        },
                        {
                        	"name":"铜仁市",
                            "type":"bar",
                            "data":y_AflatoxinTongren_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"毕节市",
                            "type":"bar",
                            "data":y_AflatoxinBijie_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                         {
                        	"name":"黔南自治州",
                            "type":"bar",
                            "data":y_AflatoxinQiannan_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"安顺市",
                            "type":"bar",
                            "data":y_AflatoxinAnshun_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"遵义市",
                            "type":"bar",
                            "data":y_AflatoxinZunyi_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"黔东南自治州",
                            "type":"bar",
                            "data":y_AflatoxinQiandongnan_data.split(","),
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
            
            
              function FunDrawAflatoxin2(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main2'),'dark'); 
                
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
                        data:['贵阳市','铜仁市','毕节市','黔南自治州','安顺市','遵义市']
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
                            data : x_AflatoxinGuizhou_data.split(",")
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
                            "name":"贵阳市",
                            "type":"line",
                            "data":y_AflatoxinGuizhou_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                        },
                        {
                        	"name":"铜仁市",
                            "type":"line",
                            "data":y_AflatoxinTongren_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"毕节市",
                            "type":"line",
                            "data":y_AflatoxinBijie_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                         {
                        	"name":"黔南自治州",
                            "type":"line",
                            "data":y_AflatoxinQiannan_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"安顺市",
                            "type":"line",
                            "data":y_AflatoxinAnshun_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"遵义市",
                            "type":"line",
                            "data":y_AflatoxinZunyi_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"黔东南自治州",
                            "type":"line",
                            "data":y_AflatoxinQiandongnan_data.split(","),
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
