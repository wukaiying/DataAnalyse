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
    
    <title>ShowAll</title>
     <script type="text/javascript" src="<%=path %>/js/esl.js"></script>
	 <script type="text/javascript" src="<%=path %>/js/echarts.js"></script>
	 <script type="text/javascript" src="<%=path %>/js/force.js"></script>
	 <script type="text/javascript" src="<%=path %>/js/chord.js"></script>
	 <script type="text/javascript" src="<%=path %>/js/config.js"></script>
	 <script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
	  <link rel="stylesheet" href="<%=path %>/css/div.css" type="text/css"></link>
	 <link rel="stylesheet" href="<%=path %>/css/SelectCard.css" type="text/css"></link>
 	 <link rel="stylesheet" href="<%=path %>/css/showall_table.css" type="text/css"></link>
 	 <link rel="stylesheet" href="<%=path %>/css/showall_table2.css" type="text/css"></link>
 	 <script type="text/javascript">
		 $(function() {
				/* For zebra striping */
		        $("table tr:nth-child(odd)").addClass("odd-row");
				/* For cell text alignment */
				$("table td:first-child, table th:first-child").addClass("first");
				/* For removing the last border */
				$("table td:last-child, table th:last-child").addClass("last");
		});
	</script>
 	</head>
  
  <body>
  <p><h4></h4></p> 
	<form action="ShowAllServlet" method="post">
	<div align="center">
		<input name="dairyname" type="text" id="key" value="要查询的样品名称" size="30"  align="center"
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
 
 <br>
 <p><h4></h4></p>
	<table  id="mytable" width="600px" align="center">
		<tr><th>编号</th><th>注册编号</th><th>样品名称</th><th>所属市</th><th>被检测地点</th><th>是否合格</th><th>生产日期</th></tr>
	<c:forEach items="${requestScope.listDairyBean}" var="dairybean">
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
	</table>
	<div>
	  <div align="center">
		<c:choose>
			<c:when test="${page.hasPrePage}">
				<a href="ShowAllServlet?currentPage=1">首页</a> | 
		<a href="ShowAllServlet?currentPage=${page.currentPage -1 }">上一页</a>
			</c:when>
			<c:otherwise>
				首页 | 上一页
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${page.hasNextPage}">
				<a href="ShowAllServlet?currentPage=${page.currentPage + 1 }">下一页</a> | 
		<a href="ShowAllServlet?currentPage=${page.totalPage }">尾页</a>
			</c:when>
			<c:otherwise>
				下一页 | 尾页
			</c:otherwise>
		</c:choose>
		当前为第${page.currentPage}页,共${page.totalPage}页
	  </div>
	</div>

	<%
		//Protein
		String name=request.getParameter("dairyname");
		String city = request.getParameter("selectcity");
		ShowAllElemAnalyse showAllElemAnalyse = new ShowAllElemAnalyse();
		List<DairyBean> listProtein = showAllElemAnalyse.getProteinAnalyse(city, name);
		StringBuffer sa_Protein_name = new StringBuffer();
		StringBuffer sa_Protein_value = new StringBuffer();
		for(DairyBean l:listProtein){
			sa_Protein_name.append(l.getSimpleName()+"("+l.getDairyID()+")"+",");
			sa_Protein_value.append(l.getProteinRe()+",");
		}
		System.out.println("sa_Protein_name"+sa_Protein_name);
		System.out.println("sa_Protein_value"+sa_Protein_value);
	 %>
	 
	 <%
	 	//AflatoxinRe
		List<DairyBean> listAflatoxin = showAllElemAnalyse.getAflatoxinAnalyse(city, name);
		StringBuffer sa_Aflatoxin_name = new StringBuffer();
		StringBuffer sa_Aflatoxin_value = new StringBuffer();
		for(DairyBean l:listAflatoxin){
			sa_Aflatoxin_name.append(l.getSimpleName()+"("+l.getDairyID()+")"+",");
			sa_Aflatoxin_value.append(l.getAflatoxinRe()+",");
		}
		System.out.println("sa_Aflatoxin_name"+sa_Aflatoxin_name);
		System.out.println("sa_Aflatoxin_value"+sa_Aflatoxin_value);
	 %>
 <br>
 <p><h4></h4></p>
	<div id="tabs">
	    <ul class="tabs_header">
	        <li>蛋白质含量</li>
	        <li>黄曲霉素</li>
	        <li>网络评论</li>
	    </ul>
	    <div class="tabs_content1" id="main1" style="height:500px">
	      
	    </div>
	    <div class="tabs_content2" id="main2" style="height:500px;width:800px">

	     </div>
	    <div class="tabs_content3" id="main3" style="height:500px">
	        <table id="mytable">
	        	<tr><th>编号</th><th>关键字</th><th>内容</th><th>发表时间</th></tr>
	        	<tr>
	        		<td class="alt">1</td>
	        		<td class="alt">纯牛奶</td>
	        		<td class="alt">纯牛奶真好喝！</td>
	        		<td class="alt">2014-12-24</td>
	        	</tr>
	        	<tr>
	        		<td class="alt">2</td>
	        		<td class="alt">纯牛奶</td>
	        		<td class="alt">纯牛奶真好喝！</td>
	        		<td class="alt">2014-12-24</td>
	        	</tr>
	        	<tr>
	        		<td>3</td>
	        		<td>纯牛奶</td>
	        		<td>蒙牛的纯牛奶来自内蒙的</td>
	        		<td>2014-12-24</td>
	        	</tr>
	        	<tr>
	        		<td>4</td>
	        		<td>纯牛奶</td>
	        		<td>纯牛奶真好喝！</td>
	        		<td>2014-12-24</td>
	        	</tr>
	        </table>
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
     var x_Protein_data = "<%=sa_Protein_name.toString()%>";
     var y_Protein_data = "<%=sa_Protein_value.toString()%>";
     var x_Aflatoxin_data = "<%=sa_Aflatoxin_name.toString()%>";
     var y_Aflatoxin_data = "<%=sa_Aflatoxin_value.toString()%>";
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
                    	width:'500px',
                    	height:'300px'
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
  </body>
</html>
