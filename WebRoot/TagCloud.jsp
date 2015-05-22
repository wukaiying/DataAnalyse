<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>JQuery Cloud</title>
  	<link rel="stylesheet" href="<%=path %>/css/jqcloud.css" type="text/css"></link>
    <script type="text/javascript" src="<%=path %>/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="<%=path %>/js/jqcloud-1.0.4.js"></script>
    </head>
    <script type="text/javascript">
      /*!
       * Create an array of word objects, each representing a word in the cloud
       */
      var word_array = [
          {text: "食品", weight: 499,link:"<%=path%>/JCloudNew/ShowWeibo.jsp"},
          {text: "糖", weight: 400, link: "<%=path%>/JCloudNew/ShowWeibo.jsp"},
          {text: "淀粉", weight: 349, html: {title: "I can haz any html attribute"}},
          {text: "酸奶", weight: 341},
          {text: "粉丝", weight: 240},
          {text: "白酒", weight: 239},
          {text: "大米", weight: 132},
          {text: "蜂蜜", weight: 131},
          {text: "红枣", weight: 130},
          {text: "豆腐", weight: 130},
          {text: "啤酒", weight: 89},
          {text: "奶粉", weight: 79},
          {text: "豆浆", weight: 69},
          {text: "乳制品", weight: 59},
          {text: "巧克力", weight: 49},
          {text: "酱油", weight: 39},
          {text: "奶粉", weight: 29},
          // ...as many words as you want
      ];
 
      $(function() {
        // When DOM is ready, select the container element and call the jQCloud method, passing the array of words as the first argument.
        $("#example").jQCloud(word_array);
      });
    </script>
  <body>
  	 <div id="example" style="width: 1000px; height: 350px;">食品热词云图</div>
  </body>
</html>
