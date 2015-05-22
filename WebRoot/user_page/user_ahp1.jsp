<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %> 
<%@ page import="com.wky.dbUtils.*"%>
<%@ page import="java.util.List;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>user_ahp</title>
    
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
  	String weightBar = (String)session.getAttribute("sessionWeightBar");
  	String weightPie = (String)session.getAttribute("sessionWeightPie");
  	String productRiskBar = (String)session.getAttribute("sessionProductRiskBar");
  %>
  <body>
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
                    <h2><i class="fa fa-bug"></i> 层次分析(AHP)</h2>
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
                       
                        <div class="col-md-6 mb30" style="width:100%">
                          <h5 class="subtitle mb5">月饼中各个检测指标权重系数比重</h5>
                          <p class="mb15">利用层次分析算法（AHP）计算出一批月饼中各个检测指标权重系数各种所占比重,比重越大说明该检测项目对样品合格的影响程度越高。</p>
                          <div id="weightPie" style="width: 100%; height: 300px"></div>
                        </div><!-- col-md-6 -->
                    </div><!-- row -->
                    <div class="row">
                    	 <div class="col-md-6 mb30" style="width:100%">
                            <h5 class="subtitle mb5">月饼中各个检测指标权重系数</h5>
                            <p class="mb15">利用层次分析算法（AHP）计算出一批月饼中各个检测指标权重系数，系数值越大说明该检测项目对样品合格的影响程度越高。</p>
                            <div id="weightBar" style="width: 100%; height: 300px"></div>
                        </div><!-- col-md-6 -->
                    </div>
                    
                   
                   
                <div class="row">
            	 <div class="col-md-6 mb30" style="width:100%">
                    <h5 class="subtitle mb5">所有样品的风险值</h5>
                    <p class="mb15">柱体表示每一个样品的风险值，风险值越高说明该检测样品出现问题可能性越大，需要进行关注。蓝色线是通过国家标准计算出来的风险值。</p>
                    <div id="productRiskBar" style="width: 100%; height: 300px"></div>
                </div><!-- col-md-6 -->
            </div>
                        
                      
                        
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
	 	DrawWeightPie(ec);
	 	DrawProductRiskBar(ec);
	 }
);
function DrawWeightBar(ec) {
    // 基于准备好的dom，初始化echarts图表
    var myChart = ec.init(document.getElementById('weightBar')); 
   	var option = <%=weightBar%>;
   	//alert(option);
	myChart.setOption(option); 
};
function DrawWeightPie(ec) {
    // 基于准备好的dom，初始化echarts图表
    var myChart = ec.init(document.getElementById('weightPie')); 
   	var option = <%=weightPie%>;
   	alert(option);
	myChart.setOption(option); 
};
function DrawProductRiskBar(ec) {
    // 基于准备好的dom，初始化echarts图表
    var myChart = ec.init(document.getElementById('productRiskBar')); 
   	var option = <%=productRiskBar%>;
	myChart.setOption(option); 
};
</script>
  </body>
</html>
