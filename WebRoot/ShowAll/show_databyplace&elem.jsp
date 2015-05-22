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
 <%
 	//黄曲霉素
   	ElemPlaceAnalyse elemPlaceAnalyse = new ElemPlaceAnalyse();
    List<DairyBean> listAflatoxinGuizhou = elemPlaceAnalyse.getAflatoxinPlaceAnalyse("贵阳市");
    StringBuffer ep_AflatoxinGuizhou_name = new StringBuffer();
   	StringBuffer ep_AflatoxinGuizhou_value = new StringBuffer();
   	for(DairyBean l:listAflatoxinGuizhou){
	   	ep_AflatoxinGuizhou_name.append(l.getSimpleName()+",");
	   	ep_AflatoxinGuizhou_value.append(l.getAflatoxinRe()+",");
   	}
    	System.out.println(ep_AflatoxinGuizhou_name);
		System.out.println(ep_AflatoxinGuizhou_value);
		System.out.println("贵州结束");
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
	
	//铬
   	
    List<DairyBean> listCrGuizhou = elemPlaceAnalyse.getCrPlaceAnalyse("贵阳市");
    StringBuffer ep_CrGuizhou_name = new StringBuffer();
   	StringBuffer ep_CrGuizhou_value = new StringBuffer();
   	for(DairyBean l:listCrGuizhou){
	   	ep_CrGuizhou_name.append(l.getSimpleName()+",");
	   	ep_CrGuizhou_value.append(l.getCrRe()+",");
   	}
    	//System.out.println(ep_AflatoxinTongren_name);
		//System.out.println(ep_AflatoxinTongren_value);
	//铜仁市
	List<DairyBean> listCrTongren = elemPlaceAnalyse.getCrPlaceAnalyse("铜仁市");
    StringBuffer ep_CrTongren_name = new StringBuffer();
   	StringBuffer ep_CrTongren_value = new StringBuffer();
   	for(DairyBean l:listCrTongren){
	   	ep_CrTongren_name.append(l.getSimpleName()+",");
	   	ep_CrTongren_value.append(l.getCrRe()+",");
   	}
    //System.out.println(ep_AflatoxinTongren_name);
	//System.out.println(ep_AflatoxinTongren_value);
	//毕节市
	List<DairyBean> listCrBijie = elemPlaceAnalyse.getCrPlaceAnalyse("毕节市");
    StringBuffer ep_CrBijie_name = new StringBuffer();
   	StringBuffer ep_CrBijie_value = new StringBuffer();
   	for(DairyBean l:listCrBijie){
	   	ep_CrBijie_name.append(l.getSimpleName()+",");
	   	ep_CrBijie_value.append(l.getCrRe()+",");
   	}
    //System.out.println(ep_AflatoxinBijie_name);
	//System.out.println(ep_AflatoxinBijie_value);
	//黔南自治州
	List<DairyBean> listCrQiannan = elemPlaceAnalyse.getCrPlaceAnalyse("黔南自治州");
    StringBuffer ep_CrQiannan_name = new StringBuffer();
   	StringBuffer ep_CrQiannan_value = new StringBuffer();
   	for(DairyBean l:listCrQiannan){
	   	ep_CrQiannan_name.append(l.getSimpleName()+",");
	   	ep_CrQiannan_value.append(l.getCrRe()+",");
   	}
    //System.out.println(ep_AflatoxinQiannan_name);
	//System.out.println(ep_AflatoxinQiannan_value);
	//安顺市
	List<DairyBean> listCrAnshun = elemPlaceAnalyse.getCrPlaceAnalyse("黔南自治州");
    StringBuffer ep_CrAnshun_name = new StringBuffer();
   	StringBuffer ep_CrAnshun_value = new StringBuffer();
   	for(DairyBean l:listCrAnshun){
	   	ep_CrAnshun_name.append(l.getSimpleName()+",");
	   	ep_CrAnshun_value.append(l.getCrRe()+",");
   	}
    //System.out.println(ep_AflatoxinAnshun_name);
	//System.out.println(ep_AflatoxinAnshun_value);
	//遵义市
	List<DairyBean> listCrZunyi = elemPlaceAnalyse.getCrPlaceAnalyse("遵义");
    StringBuffer ep_CrZunyi_name = new StringBuffer();
   	StringBuffer ep_CrZunyi_value = new StringBuffer();
   	for(DairyBean l:listCrZunyi){
	   	ep_CrZunyi_name.append(l.getSimpleName()+",");
	   	ep_CrZunyi_value.append(l.getCrRe()+",");
   	}
    //System.out.println(ep_AflatoxinZunyi_name);
	//System.out.println(ep_AflatoxinZunyi_value);
	//黔东南自治区
	List<DairyBean> listCrQiandongnan = elemPlaceAnalyse.getCrPlaceAnalyse("遵义");
    StringBuffer ep_CrQiandongnan_name = new StringBuffer();
   	StringBuffer ep_CrQiandongnan_value = new StringBuffer();
   	for(DairyBean l:listCrQiandongnan){
	   	ep_CrQiandongnan_name.append(l.getSimpleName()+",");
	   	ep_CrQiandongnan_value.append(l.getCrRe()+",");
   	}
    //System.out.println(ep_AflatoxinQiandongnan_name);
	//System.out.println(ep_AflatoxinQiandongnan_value);
	
	/**
	*蛋白质Protein
	*/
   
    List<DairyBean> listProteinGuizhou = elemPlaceAnalyse.getProteinPlaceAnalyse("贵阳市");
    StringBuffer ep_ProteinGuizhou_name = new StringBuffer();
   	StringBuffer ep_ProteinGuizhou_value = new StringBuffer();
   	for(DairyBean l:listProteinGuizhou){
	   	ep_ProteinGuizhou_name.append(l.getSimpleName()+",");
	   	ep_ProteinGuizhou_value.append(l.getProteinRe()+",");
   	}
    	//System.out.println(ep_AflatoxinTongren_name);
		//System.out.println(ep_AflatoxinTongren_value);
	//铜仁市
	List<DairyBean> listProteinTongren = elemPlaceAnalyse.getProteinPlaceAnalyse("铜仁市");
    StringBuffer ep_ProteinTongren_name = new StringBuffer();
   	StringBuffer ep_ProteinTongren_value = new StringBuffer();
   	for(DairyBean l:listProteinTongren){
	   	ep_ProteinTongren_name.append(l.getSimpleName()+",");
	   	ep_ProteinTongren_value.append(l.getProteinRe()+",");
   	}
    //System.out.println(ep_AflatoxinTongren_name);
	//System.out.println(ep_AflatoxinTongren_value);
	//毕节市
	List<DairyBean> listProteinBijie = elemPlaceAnalyse.getProteinPlaceAnalyse("毕节市");
    StringBuffer ep_ProteinBijie_name = new StringBuffer();
   	StringBuffer ep_ProteinBijie_value = new StringBuffer();
   	for(DairyBean l:listProteinBijie){
	   	ep_ProteinBijie_name.append(l.getSimpleName()+",");
	   	ep_ProteinBijie_value.append(l.getProteinRe()+",");
   	}
    //System.out.println(ep_AflatoxinBijie_name);
	//System.out.println(ep_AflatoxinBijie_value);
	//黔南自治州
	List<DairyBean> listProteinQiannan = elemPlaceAnalyse.getProteinPlaceAnalyse("黔南自治州");
    StringBuffer ep_ProteinQiannan_name = new StringBuffer();
   	StringBuffer ep_ProteinQiannan_value = new StringBuffer();
   	for(DairyBean l:listProteinQiannan){
	   	ep_ProteinQiannan_name.append(l.getSimpleName()+",");
	   	ep_ProteinQiannan_value.append(l.getProteinRe()+",");
   	}
    //System.out.println(ep_AflatoxinQiannan_name);
	//System.out.println(ep_AflatoxinQiannan_value);
	//安顺市
	List<DairyBean> listProteinAnshun = elemPlaceAnalyse.getProteinPlaceAnalyse("黔南自治州");
    StringBuffer ep_ProteinAnshun_name = new StringBuffer();
   	StringBuffer ep_ProteinAnshun_value = new StringBuffer();
   	for(DairyBean l:listProteinAnshun){
	   	ep_ProteinAnshun_name.append(l.getSimpleName()+",");
	   	ep_ProteinAnshun_value.append(l.getProteinRe()+",");
   	}
    //System.out.println(ep_AflatoxinAnshun_name);
	//System.out.println(ep_AflatoxinAnshun_value);
	//遵义市
	List<DairyBean> listProteinZunyi = elemPlaceAnalyse.getProteinPlaceAnalyse("遵义");
    StringBuffer ep_ProteinZunyi_name = new StringBuffer();
   	StringBuffer ep_ProteinZunyi_value = new StringBuffer();
   	for(DairyBean l:listProteinZunyi){
	   	ep_ProteinZunyi_name.append(l.getSimpleName()+",");
	   	ep_ProteinZunyi_value.append(l.getProteinRe()+",");
   	}
    //System.out.println(ep_AflatoxinZunyi_name);
	//System.out.println(ep_AflatoxinZunyi_value);
	//黔东南自治区
	List<DairyBean> listProteinQiandongnan = elemPlaceAnalyse.getProteinPlaceAnalyse("遵义");
    StringBuffer ep_ProteinQiandongnan_name = new StringBuffer();
   	StringBuffer ep_ProteinQiandongnan_value = new StringBuffer();
   	for(DairyBean l:listProteinQiandongnan){
	   	ep_ProteinQiandongnan_name.append(l.getSimpleName()+",");
	   	ep_ProteinQiandongnan_value.append(l.getProteinRe()+",");
   	}
    //System.out.println(ep_AflatoxinQiandongnan_name);
	//System.out.println(ep_AflatoxinQiandongnan_value);
     %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>检测指标地理位置</title>
    
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

                    <form class="searchform" action="PlaceAnalyseServlet" method="post">
                        <input type="text" class="form-control" name="keyword" placeholder="输入地点查询各个地区详细。。。" />
                        <input type="submit" class ="form_control" value="查询详细" />
                    </form>
                            
                </div><!-- headerbar -->

                <div class="pageheader">
                    <h2><i class="fa fa-bug"></i>检测指标及其产地趋势分析</h2>
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
                            <p class="mb15">对比各个地区中某种检测指标含量变化，并与国家标准做对比。如果某种检测指标出现问题，可以快速判断出来是那个地方。</p>                
                            <div id="" style="width: 100%; height: 300px"></div>
                        </div><!-- col-md-6 -->
                    </div><!-- row -->
                                                                       
                        
                        <div class="col-md-6" style="width: 100%;">
                            
                            <div class="panel panel-dark panel-alt">
                                <div class="panel-heading">
                                    <div class="panel-btns">
                                        <a href="" class="panel-close">&times;</a>
                                        <a href="" class="minimize">&minus;</a>
                                    </div><!-- panel-btns -->
                                    <h5 class="panel-title">黄曲霉素变化趋势</h5>
                                </div><!-- panel-heading -->
                                <div class="panel-body panel-table">
                                    <div class="table-responsive" >
                                   		 <div id="AflatoxinLine" style="width: 100%; height: 400px"></div>
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
                                    <h5 class="panel-title">铬变化趋势</h5>
                                </div><!-- panel-heading -->
                                <div class="panel-body panel-table">
                                    <div class="table-responsive" >
                                   		 <div id="CrLine" style="width: 100%; height: 400px"></div>
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
                                    <h5 class="panel-title">蛋白质变化趋势</h5>
                                </div><!-- panel-heading -->
                                <div class="panel-body panel-table">
                                    <div class="table-responsive" >
                                   		 <div id="ProteinLine" style="width: 100%; height: 400px"></div>
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
                            	<strong>
	                                <p>对黄曲霉素这一检测指标而言可以各个地区奶制品中黄曲霉素含量都低于国家标准，都合格。但是贵阳市，铜仁市，和毕节市的黄曲霉素含量较大，离国家标准较近。可以得出黄曲霉素在上面三个地区中是比较危险的一个指标。</p>
	                            	<p>同理，对于蛋白质这个检测项目，可以看出所有地区奶制品中蛋白质含量均高于国家标准，都合格。但是前三种奶制品，玉米酸奶，红酸奶，果肉酸奶蛋白质含量较低，而其他产品相对而较高，可以判断要么这几种奶制品就是蛋白质含量较低，要么就是生产过程出现了问题。</p>
                            	</strong>
                            </div><!-- table-responsive -->
                        </div><!-- panel-body -->
                    </div><!-- panel -->
                    
                </div><!-- contentpanel -->

    	 </div><!-- mainpanel -->
  </body>
   <script type="text/javascript">
   
   //黄曲霉素
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
    
    //铬
    var x_CrGuizhou_data = "<%=ep_CrGuizhou_name.toString()%>";
    var y_CrGuizhou_data = "<%=ep_CrGuizhou_value.toString()%>";
    var x_CrTongren_data = "<%=ep_CrTongren_name.toString()%>";
    var y_CrTongren_data = "<%=ep_CrTongren_value.toString()%>";
    var x_CrBijie_data = "<%=ep_CrBijie_name.toString()%>";
    var y_CrBijie_data = "<%=ep_CrBijie_value.toString()%>";
    var x_CrQiannan_data = "<%=ep_CrQiannan_name.toString()%>";
    var y_CrQiannan_data = "<%=ep_CrQiannan_value.toString()%>";
    var x_CrAnshun_data = "<%=ep_CrAnshun_name.toString()%>";
    var y_CrAnshun_data = "<%=ep_CrAnshun_value.toString()%>";
    var x_CrZunyi_data = "<%=ep_CrZunyi_name.toString()%>";
    var y_CrZunyi_data = "<%=ep_CrZunyi_value.toString()%>";
    var x_CrQiandongnan_data = "<%=ep_CrQiandongnan_name.toString()%>";
    var y_CrQiandongnan_data = "<%=ep_CrQiandongnan_value.toString()%>";
    
    //蛋白质
    var x_ProteinGuizhou_data = "<%=ep_ProteinGuizhou_name.toString()%>";
    var y_ProteinGuizhou_data = "<%=ep_ProteinGuizhou_value.toString()%>";
    var x_ProteinTongren_data = "<%=ep_ProteinTongren_name.toString()%>";
    var y_ProteinTongren_data = "<%=ep_ProteinTongren_value.toString()%>";
    var x_ProteinBijie_data = "<%=ep_ProteinBijie_name.toString()%>";
    var y_ProteinBijie_data = "<%=ep_ProteinBijie_value.toString()%>";
    var x_ProteinQiannan_data = "<%=ep_ProteinQiannan_name.toString()%>";
    var y_ProteinQiannan_data = "<%=ep_ProteinQiannan_value.toString()%>";
    var x_ProteinAnshun_data = "<%=ep_ProteinAnshun_name.toString()%>";
    var y_ProteinAnshun_data = "<%=ep_ProteinAnshun_value.toString()%>";
    var x_ProteinZunyi_data = "<%=ep_ProteinZunyi_name.toString()%>";
    var y_ProteinZunyi_data = "<%=ep_ProteinZunyi_value.toString()%>";
    var x_ProteinQiandongnan_data = "<%=ep_ProteinQiandongnan_name.toString()%>";
    var y_ProteinQiandongnan_data = "<%=ep_ProteinQiandongnan_value.toString()%>";
    
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
                //FunDrawAflatoxin(ec);
                FunDrawAflatoxin2(ec);
                FunDrawCrLine(ec);
                FunDrawProteinLine(ec);
            }
        
         function FunDrawAflatoxin(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('AflatoxinBar'),'dark'); 
                
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
                            data : x_AflatoxinGuizhou_data.split(","),
                            axisLabel: { rotate: 60, }, 
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            axisLabel : {
                						formatter: '{value} mg/kg'
           							},
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
                var myChart = ec.init(document.getElementById('AflatoxinLine'),'dark'); 
                
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
                        data:['贵阳市','铜仁市','毕节市','黔南自治州','安顺市','遵义市','黄曲霉素国家标准']
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
                            data : x_AflatoxinGuizhou_data.split(","),
                            axisLabel: { rotate: 60, }, 
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            axisLabel : {
                						formatter: '{value} mg/kg'
           							},
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
                        {
                        	"name":"黄曲霉素国家标准",
                        	"lineStyle":{
							    color: '#666',
							    width: 3,
							    type: 'dashed'
							},  
                            "type":"line",                    
                            "data":(function (){
	                            	var d = [];
	                            	var len=20;
	                            	var value=0.5-0;
	                            	while(len--){
	                            		d.push([value]);
	                            	}
	                            	return d;
	                            })(),
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
            
            //铬
              function FunDrawCrLine(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('CrLine'),'dark'); 
                
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
                            data : x_CrGuizhou_data.split(","),
                            axisLabel: { rotate: 60, }, 
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            axisLabel : {
                						formatter: '{value} mg/kg'
           							},
                            max:'1',
                            min:'0'
                        }
                    ],
                    series : [
                        {
                            "name":"贵阳市",
                            "type":"line",
                            "data":y_CrGuizhou_data.split(","),
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
                            "data":y_CrTongren_data.split(","),
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
                            "data":y_CrBijie_data.split(","),
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
                            "data":y_CrQiannan_data.split(","),
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
                            "data":y_CrAnshun_data.split(","),
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
                            "data":y_CrZunyi_data.split(","),
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
                            "data":y_CrQiandongnan_data.split(","),
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
            //蛋白质
             function FunDrawProteinLine(ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('ProteinLine'),'dark'); 
                
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
                        data:['贵阳市','铜仁市','毕节市','黔南自治州','安顺市','遵义市','蛋白质国家标准']
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
                            data : x_ProteinTongren_data.split(","),
                            axisLabel: { rotate: 60, }, 
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value',
                            axisLabel : {
                						formatter: '{value} g/100g'
           							},
                            max:'5',
                            min:'0'
                        }
                    ],
                    series : [
                        {
                            "name":"贵阳市",
                            "type":"line",
                            "data":y_ProteinGuizhou_data.split(","),
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
                            "data":y_ProteinTongren_data.split(","),
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
                            "data":y_ProteinBijie_data.split(","),
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
                            "data":y_ProteinQiannan_data.split(","),
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
                            "data":y_ProteinAnshun_data.split(","),
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
                            "data":y_ProteinZunyi_data.split(","),
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
                            "data":y_ProteinQiandongnan_data.split(","),
                             "markPoint" : {
					                data : [
						                    {type : 'max', name: '最大值'},
						                    {type : 'min', name: '最小值'},
					                	  ]
           						},
                            
                        },
                        {
                        	"name":"蛋白质国家标准",
                        	"lineStyle":{
							    color: '#666',
							    width: 3,
							    type: 'dashed'
							},  
                            "type":"line",                    
                            "data":(function (){
	                            	var d = [];
	                            	var len=20;
	                            	var value=2.3-0;
	                            	while(len--){
	                            		d.push([value]);
	                            	}
	                            	return d;
	                            })(),
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
</html>
