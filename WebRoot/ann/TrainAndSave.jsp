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
    <title>训练保存神经网络</title>
    
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
  ${requestScope.message }	
  <body> 
	<a href="download.jsp">下载user.doc</a>				
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
	              <form action="Artificial_Neural_Networks_Servlet" method="post">
					<div align="center">
						<div>
							<input name="shuru_num" type="text" id="key" value="输入层节点数" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
						
							<input name="shuchu_num" type="text" id="key" value="输出层节点数" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
						
							<input name="xunlian_num" type="text" id="key" value="训练样本数目" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />
						
							<input name="fanhua_num" type="text" id="key" value="泛化样本数目" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />     
					      
					       <input name="yuce_num" type="text" id="key" value="预测样本数目" size="30"  align="center"
					       onmouseover=this.focus();this.select();   
					       onclick="if(value==defaultValue){value='';this.style.color='#000'}"   
					       onBlur="if(!value){value=defaultValue;this.style.color='#999'}" style="color:#999" />      
						   <input type="hidden" name="fileFullPath" value="${fileFullPath }">
						   <input type="hidden" name="filePath" value="${filePath }">					   
						   <select name="dropdownlist">
							    <option value="product" selected="selected">按样本</option>
							    <option value="month">按月导入</option>
							    <option value="year" >按年导入</option>
							    <option value="other">其他</option>
						   </select>
						</div>
						
						<input type="submit" value="开始训练" />
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
                    <div id="weightpie" style="width: 100%; height: 300px"></div>
                  </div><!-- col-md-6 -->
              </div><!-- row -->	 	 

	 	 	  
			 <div class="row">
					
					<table id="mytable" class="display" cellspacing="0" width="100%" align="center">					
						<tbody>
	
							<tr>
								<td> 训练误差：${rmse}</td>																	
								<td>泛化误差：${validationerror}</td>
								<td>迭代次数：${epoch}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
			   <div>
					
					<div  id="main2" style="height:500px"></div>
	           </div>
	 <%
	 	//获取annBar
	 	String annBar = (String)request.getAttribute("annBar");
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
    var myChart = ec.init(document.getElementById('main2')); 
   	var option = <%=annBar%>;
   	//alert(option);
	myChart.setOption(option); 
};
</script>
	 		<div class="btn-demo">
                <a class="btn btn-default-alt" href="<%=path %>/ann/downloadfile.jsp">想保存训练好的网络到本地？</a>
              </div>
		</div> <!-- end contentpanel -->
	</div><!-- endmainpanel -->
  </body>
</html>
