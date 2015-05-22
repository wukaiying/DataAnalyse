<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> 
<%@ page import="com.wky.dbUtils.*"%>
<%@ page import="java.util.List"%>
<%@ page import ="java.io.File"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>user_ann</title>
    
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
  <%
  	//String rmse = (String)session.getAttribute("sessionRmse");
  	//String epoch = (String)session.getAttribute("sessionEpoch");
  	String annBar = (String)session.getAttribute("sessionAnnBar");
   %>
 <body>
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
    var myChart = ec.init(document.getElementById('annBar')); 
   	var option = <%=annBar%>;
   	//alert(option);
	myChart.setOption(option); 
};
</script>
  	<div class="mainpanel" style="width: 100%;">
        <div class="headerbar">
             <a class="menutoggle"><i class="fa fa-bars"></i></a>

             <form class="searchform" action="index.html" method="post">
                 <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
             </form>

             <div class="header-right">
                 <ul class="headermenu">
                     <li>
                         <div class="btn-group">
                             <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                                 <i class="glyphicon glyphicon-user"></i>
                                 <span class="badge">2</span>
                             </button>
                             <div class="dropdown-menu dropdown-menu-head pull-right">
                                 <h5 class="title">2 Newly Registered Users</h5>
                                 <ul class="dropdown-list user-list">
                                     <li class="new">
                                         <div class="thumb"><a href=""><img src="images/photos/user1.png" alt="" /></a></div>
                                         <div class="desc">
                                             <h5><a href="">Draniem Daamul (@draniem)</a> <span class="badge badge-success">new</span></h5>
                                         </div>
                                     </li>
                                     <li class="new">
                                         <div class="thumb"><a href=""><img src="images/photos/user2.png" alt="" /></a></div>
                                         <div class="desc">
                                             <h5><a href="">Zaham Sindilmaca (@zaham)</a> <span class="badge badge-success">new</span></h5>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="thumb"><a href=""><img src="images/photos/user3.png" alt="" /></a></div>
                                         <div class="desc">
                                             <h5><a href="">Weno Carasbong (@wenocar)</a></h5>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="thumb"><a href=""><img src="images/photos/user4.png" alt="" /></a></div>
                                         <div class="desc">
                                             <h5><a href="">Nusja Nawancali (@nusja)</a></h5>
                                         </div>
                                     </li>
                                     <li>
                                         <div class="thumb"><a href=""><img src="images/photos/user5.png" alt="" /></a></div>
                                         <div class="desc">
                                             <h5><a href="">Lane Kitmari (@lane_kitmare)</a></h5>
                                         </div>
                                     </li>
                                     <li class="new"><a href="">See All Users</a></li>
                                 </ul>
                             </div>
                         </div>
                     </li>
                     <li>
                         <div class="btn-group">
                             <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                                 <i class="glyphicon glyphicon-envelope"></i>
                                 <span class="badge">1</span>
                             </button>
                             <div class="dropdown-menu dropdown-menu-head pull-right">
                                 <h5 class="title">You Have 1 New Message</h5>
                                 <ul class="dropdown-list gen-list">
                                     <li class="new">
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user1.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Draniem Daamul <span class="badge badge-success">new</span></span>
                                                 <span class="msg">Lorem ipsum dolor sit amet...</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user2.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Nusja Nawancali</span>
                                                 <span class="msg">Lorem ipsum dolor sit amet...</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user3.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Weno Carasbong</span>
                                                 <span class="msg">Lorem ipsum dolor sit amet...</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user4.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Zaham Sindilmaca</span>
                                                 <span class="msg">Lorem ipsum dolor sit amet...</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li>
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user5.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Veno Leongal</span>
                                                 <span class="msg">Lorem ipsum dolor sit amet...</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li class="new"><a href="">Read All Messages</a></li>
                                 </ul>
                             </div>
                         </div>
                     </li>
                     <li>
                         <div class="btn-group">
                             <button class="btn btn-default dropdown-toggle tp-icon" data-toggle="dropdown">
                                 <i class="glyphicon glyphicon-globe"></i>
                                 <span class="badge">5</span>
                             </button>
                             <div class="dropdown-menu dropdown-menu-head pull-right">
                                 <h5 class="title">You Have 5 New Notifications</h5>
                                 <ul class="dropdown-list gen-list">
                                     <li class="new">
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user4.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Zaham Sindilmaca <span class="badge badge-success">new</span></span>
                                                 <span class="msg">is now following you</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li class="new">
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user5.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Weno Carasbong <span class="badge badge-success">new</span></span>
                                                 <span class="msg">is now following you</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li class="new">
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user3.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Veno Leongal <span class="badge badge-success">new</span></span>
                                                 <span class="msg">likes your recent status</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li class="new">
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user3.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Nusja Nawancali <span class="badge badge-success">new</span></span>
                                                 <span class="msg">downloaded your work</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li class="new">
                                         <a href="">
                                             <span class="thumb"><img src="images/photos/user3.png" alt="" /></span>
                                             <span class="desc">
                                                 <span class="name">Nusja Nawancali <span class="badge badge-success">new</span></span>
                                                 <span class="msg">send you 2 messages</span>
                                             </span>
                                         </a>
                                     </li>
                                     <li class="new"><a href="">See All Notifications</a></li>
                                 </ul>
                             </div>
                         </div>
                     </li>
                     <li>
                         <div class="btn-group">
                             <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                 <img src="images/photos/loggeduser.png" alt="" />
                                 John Doe
                                 <span class="caret"></span>
                             </button>
                             <ul class="dropdown-menu dropdown-menu-usermenu pull-right">
                                 <li><a href="profile.html"><i class="glyphicon glyphicon-user"></i> My Profile</a></li>
                                 <li><a href="#"><i class="glyphicon glyphicon-cog"></i> Account Settings</a></li>
                                 <li><a href="#"><i class="glyphicon glyphicon-question-sign"></i> Help</a></li>
                                 <li><a href="signin.html"><i class="glyphicon glyphicon-log-out"></i> Log Out</a></li>
                             </ul>
                         </div>
                     </li>
                     <li>
                         <button id="chatview" class="btn btn-default tp-icon chat-icon">
                             <i class="glyphicon glyphicon-comment"></i>
                         </button>
                     </li>
                 </ul>
             </div><!-- header-right -->
         </div><!-- headerbar -->

         <div class="pageheader">
             <h2><i class="fa fa-bug"></i> 神经网络模型</h2>
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
                      <h5 class="subtitle mb5">神经网络预测矿泉水中各种指标含量</h5>
                      <p class="mb15">1.筛选了38组矿泉水检测数据，其检测指标包括大肠菌群，菌落总数，大肠菌群，铅，铜，砷，乙酰甲胺磷，六六六，杀螟硫磷，氯氰菊酯，滴滴涕。把检测指标按照其属性特征分为三类，分别是致病菌（大肠菌群，菌落总数，大肠菌群），重金属（铅，铜，砷），化学污染物（乙酰甲胺磷，六六六，杀螟硫磷，氯氰菊酯，滴滴涕）。</p>
                      <p class="mb15">2.将每一大类中的各个检测指标归一化求和后作为神经网络输出，则得到三个输出。</p>
                      <p class="mb15">3.同理将各个指标的标准数据进行归一化求和即得到标准输出。</p>
                      <p class="mb15">4.建立BP神经网络，利用上面得到的数据进行训练，训练网络。</p>
                      <p class="mb15">5.抽取8个新样本输入训练好的网络中得到输出，并与标准值进行比较。</p>
                      <div id="" style="width: 100%; height: 300px"></div>
                  </div><!-- col-md-6 -->
              </div><!-- row -->
              <div class="row">
					<table id="mytable" class="display" cellspacing="0" width="100%" align="center">					
						<tbody>
			
							<tr>
								<td> 训练误差：${sessionScope.sessionRmse}</td>																								
								<td>迭代次数：${sessionScope.sessionEpoch}</td>
							</tr>
						</tbody>
					</table>
			  </div>	 
			  <br>              	              	              
              <div class="row" >
                  <div class="col-md-6" style="width: 100%;">
                      
                      <div class="panel panel-dark panel-alt">
                          <div class="panel-heading">
                              <div class="panel-btns">
                                  <a href="" class="panel-close">&times;</a>
                                  <a href="" class="minimize">&minus;</a>
                              </div><!-- panel-btns -->
                              <h5 class="panel-title">各种月饼风险值</h5>
                          </div><!-- panel-heading -->
                          <div class="panel-body panel-table">
                              <div class="table-responsive" >
                             		 <div id="annBar" style="width: 100%; height: 400px"></div>
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
                          <p>所有样品的风险值都在20%以内，按五标度划分的画，都处于优秀状态。</p>
                      </div><!-- table-responsive -->
                  </div><!-- panel-body -->
              </div><!-- panel -->	               
          </div><!-- contentpanel -->
          </div><!-- mainpanel -->
  </body>
</html>
