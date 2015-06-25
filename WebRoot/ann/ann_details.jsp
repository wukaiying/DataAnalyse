<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>神经网络详细信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="shortcut icon" href="user_images/favicon.png" type="image/png">
    <link href="user_css/style.default.css" rel="stylesheet">
    <link href="user_css/morris.css" rel="stylesheet">
	<script type="text/javascript" src="./js/esl.js"></script>

  </head>
  <body>
  		<div class="mainpanel" style="width: 100%;">
        <div class="pageheader">
            <h2><i class="fa fa-bug"></i> 神经网络历史详细</h2>
        </div>

        <div class="contentpanel">                    
            <div class="row">               
                <div class="col-md-6 mb30" style="width:100%">
                  <h5 class="subtitle mb5">月饼中各个检测指标权重系数比重</h5>
                  <p class="mb15">利用层次分析算法（AHP）计算出一批月饼中各个检测指标权重系数各种所占比重,比重越大说明该检测项目对样品合格的影响程度越高。</p>
                  <div id="annOptionBar" style="width: 100%; height: 300px"></div>
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
                    	<p>1.利用AHP分析指标权重可以看出酸价权重最高，可以推断出酸价对这一批月饼的影响最大，可以着重对酸价进行检测。</p>
                    	<p>2.利用 指标权重计算出所有月饼的风险值，可以看出广式五仁月饼风险值最高，十分接近标准线，建议对该月饼着重检测。</p>
                    </div><!-- table-responsive -->
                </div><!-- panel-body -->
            </div><!-- panel -->
        </div><!-- contentpanel -->

     </div><!-- mainpanel -->
  </body>
   <%
	 	//获取annBar
	 	String annOptionBar = (String)request.getAttribute("annOptionBar");
	%>
  <script type="text/javascript">
      // 路径配置
        require.config({
            paths: {
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
	          'echarts/chart/line', // 使用柱状图就加载bar模块，按需加载
	          'echarts/chart/pie', // 使用柱状图就加载bar模块，按需加载
	          
	      ],
	 function (ec){
	 	DrawAnnBar(ec);
	 }
);
function DrawAnnBar(ec) {
    // 基于准备好的dom，初始化echarts图表
    var myChart = ec.init(document.getElementById('annOptionBar')); 
   	var option = <%=annOptionBar%>;
   	//alert(option);
	myChart.setOption(option); 
};
</script>
</html>
