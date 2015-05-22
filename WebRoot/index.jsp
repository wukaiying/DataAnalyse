<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <link rel="stylesheet" href="css/index.css" type="text/css" media="screen" />

 <script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/tendina.min.js"></script>
 <script type="text/javascript" src="js/common.js"></script>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		function userCheck(){
			var userSession =  "${sessionScope.status}";
			if(userSession=="0"){
				document.getElementById("yuqing").style.display="none";
			}
		}
	</script>
  </head>
  <body onload="userCheck()">
  	  <!--顶部-->
    <div class="layout_top_header">
            <div style="float: left"><span style="font-size: 16px;line-height: 45px;padding-left: 20px;color: #8d8d8d">食品信息分析系统</h1></span></div>
            <div id="ad_setting" class="ad_setting">
                <a class="ad_setting_a" href="javascript:; ">
                    <i class="icon-user glyph-icon" style="font-size: 20px"></i>
                    <span>欢迎${user.name }</span>
                    <i class="icon-chevron-down glyph-icon"></i>
                </a>
                <ul class="dropdown-menu-uu" style="display: none" id="ad_setting_ul">
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-user glyph-icon"></i> 个人中心 </a> </li>
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-cog glyph-icon"></i> 设置 </a> </li>
                    <li class="ad_setting_ul_li"> <a href="javascript:;"><i class="icon-signout glyph-icon"></i> <span class="font-bold">退出</span> </a> </li>
                </ul>
            </div>
    </div>
    <!--顶部结束-->
    <!--菜单-->
    <div class="layout_left_menu">
        <ul id="menu">
            <li class="childUlLi" id="shouye">
               <a href="Main.jsp"  target="menuFrame"><i class="glyph-icon icon-home"></i>首页</a>
                <ul>
                    <!--  <li><a href="TagCloud.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>网络信息热点</a></li>-->
                    <!--  <li><a href="ShowAll/ShowAllByHotWordNew.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>热词分析</a></li>-->
                    <li><a href="Main.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>总体展示</a></li>
                </ul>
            </li>
            <li class="childUlLi" id="tongji">
                <a href="user.html"  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>统计分析</a>
                <ul>
                    <li><a href="ShowAll/show_databyelme.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>按元素</a></li>
                    <li><a href="ShowAll/show_databyplace&elem.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>按元素位置</a></li>
                    <!--  <li><a href="JCloudNew/ShowWeibo.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>热词分析</a></li>-->
                    <li><a href="ShowAll/show_databyplace.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>按地理位置</a></li>
                    
                </ul>
            </li>
             <li class="childUlLi" id="yuqing">
                <a href="user.html"  target="menuFrame"> <i class="glyph-icon icon-reorder"></i>模型分析</a>
                <ul>
                    <li class="childUlLi">
                    	<a href="user.html"  target="menuFrame"> <i class="glyph-icon icon-chevron-right"></i>关联规则</a>
                    	<ul>
                    		<li><a href="Apriori/AprioriUpload.jsp" target="menuFrame"><i class=""></i>导入数据</a></li>
                    		<li><a href="Apriori/ShowApriori.jsp" target="menuFrame"><i class=""></i>关联分析</a></li>
                    	</ul>
                    </li>
                    <li class="childUlLi">
                    	<a href="user.html"  target="menuFrame"> <i class="glyph-icon icon-chevron-right"></i>层次分析</a>
                    	<ul>
                    		<li><a href="ahp/ahpUpload.jsp" target="menuFrame"><i class=""></i>导入数据</a></li>
                    		<li><a href="ahp/show_ahp.jsp" target="menuFrame"><i class=""></i>层次分析</a></li>
                    	</ul>
                    </li>
                    <li class="childUlLi" >
                    	<a href="user.html"  target="menuFrame"> <i class="glyph-icon icon-chevron-right"></i>神经网络</a>
                    	<ul>
                    		<li><a href="ann/annUpload.jsp" target="menuFrame"><i class=" "></i>导入训练及泛化数据</a></li>
                    		<li><a href="ann/import_ann_forcast.jsp" target="menuFrame"><i class=" "></i>导入预测数据并预测</a></li>                
                    	</ul>
                    </li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="#"> <i class="glyph-icon  icon-location-arrow"></i>模型分析(用户)</a>
                <ul>
                    <li><a href="user_page/user_apriori.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>指标约减（关联规则）</a></li>
                    <li><a href="user_page/user_ahp1.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>风险评估（AHP）</a></li>
                    <li><a href="user_page/user_ann.jsp" target="menuFrame"><i class="glyph-icon icon-chevron-right"></i>风险预测（神经网络）</a></li>
                </ul>
            </li>
            <li class="childUlLi">
                <a href="role.html" target="menuFrame"> <i class="glyph-icon icon-reorder"></i>设置</a>
                <ul>
                    <li><a href="#"><i class="glyph-icon icon-chevron-right"></i>修改密码</a></li>
                    <li><a href="#"><i class="glyph-icon icon-chevron-right"></i>帮助</a></li>
                </ul>
            </li>
            
        </ul>
    </div>
    <!--菜单-->
    <div id="layout_right_content" class="layout_right_content">

        <div class="route_bg">
            <a href="#">主页</a><i class="glyph-icon icon-chevron-right"></i>
            <a href="#">菜单管理</a>
        </div>
        <div class="mian_content">
            <div id="page_content">
                <iframe id="menuFrame" name="menuFrame" src="main.html" style="overflow:visible;"
                        scrolling="yes" frameborder="no" width="100%" height="100%"></iframe>
            </div>
        </div>
    </div>
    <div class="layout_footer">
        <p>Copyright © 2014 - 北京化工大学</p>
    </div>
  </body>
</html>
