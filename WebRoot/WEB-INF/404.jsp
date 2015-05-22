<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>异常信息</title>
<style type="text/css">
body{ font-size:12px; color:#4d4b4b;}
</style>
</head>
<body>
<br><br><br><br><br><br>
<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td colspan="2" valign="top" bgcolor="#D6E2F2" class="style01 tdpadding">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="25" class="img01 titlefalse">请求链接错误</td>
            </tr>
            <tr>
                <td height="119" bgcolor="#FFFFFF" class="style01">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="20%" height="24" class="title01" align="center">
                              您访问的页面不存在。
                        </td>
                    </tr>
                    
                </table>
                </td>
            </tr>
        </table>
        </td>
    </tr>
</table>

</body>
</html>
