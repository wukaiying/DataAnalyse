<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>历史查询</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
  <body>
  	<div class="mainpanel" style="width: 100%;">
	  	 <div class="pageheader">
	            <h2><i class="fa fa-bug"></i>神经网络训练</h2>
	            <div class="breadcrumb-wrapper">
	                <span class="label">You are here:</span>
	                <ol class="breadcrumb">
	                    <li><a href="index.html">Bracket</a></li>
	                    <li><a href="bug-tracker.html">Bug Tracker</a></li>
	                    <li class="active">Summary</li>
	                </ol>
	            </div>
	              <form action="HistorySearchServlet" method="post">
					<div align="center">
						<div>
							<input name="start_time" type="text" id="key" value="输入起始日期" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
					       
					       <input name="end_time" type="text" id="key" value="输入结束日期" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
																   
						   <select name="dropdownlist">
							    <option value="apriori" selected="selected">关联规则</option>
							    <option value="ahp">层次分析</option>
							    <option value="ann" >神经网络</option>							  
						   </select>
						</div>
						
						<input type="submit" value="查找" />
					</div>
				</form>
				 
	      </div>
          <div class="contentpanel">
          	  <div class="row">                       
                  <div class="col-md-6 mb30" style="width:100%;height:30%">
                    <h2 class="subtitle mb5">关于神经网络</h2>
                    <p class="mb15">利用已有的历史数据，预测未来的输出结果</p>
                    <p class="mb15">导入训练，泛化，预测数据，训练后得到训练误差，泛化误差，迭代次数。可以预测出下一批样品各个检测指标未来的风险值。并与标准值做对比。</p>
                    <p class="mb15">用户可以保存训练好的网络，下次同类型数据可以选择不训练而直接进行预测。</p>
                    <div id="weightBar" style="width: 100%; height: 300px"></div>
                  </div><!-- col-md-6 -->
              </div><!-- row -->	 	 
              
              <c:forEach items="${requestScope.listAHP}" var="ahp">
					<dd>
					  <div align="right">发布人ID：${ahp.weightData} 
					  		发布时间：${ahp.riskData}</div>
					</dd>
			 </c:forEach> 		
		</div> <!-- end contentpanel -->
	</div><!-- endmainpanel -->
  </body>
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
	 	DrawWeightBar(ec);
	 	//DrawWeightPie(ec);
	 	//DrawProductRiskBar(ec);
	 }
);
function DrawWeightBar(ec) {
    // 基于准备好的dom，初始化echarts图表
    var myChart = ec.init(document.getElementById('weightBar')); 
   	var option = "${requestScope.listAHP}";
   	//alert(option);
	myChart.setOption(option); 
};

</script>
</html>
