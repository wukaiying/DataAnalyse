<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%!String exceptionMsgForInner(Throwable e){
        String ls_ErrMsg = e.getLocalizedMessage();
        if (ls_ErrMsg == null) ls_ErrMsg = "";
        ls_ErrMsg += "\r\n";
        Throwable eCause = e.getCause();
        if (eCause == null){
            for (int ii = 0;ii < e.getStackTrace().length;ii++){
                ls_ErrMsg += e.getStackTrace()[ii].toString() + "\r\n";
            }
        } else{
            ls_ErrMsg += exceptionMsgForInner(eCause);
        }
        return ls_ErrMsg.trim();
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>异常信息</title>
<style type="text/css">
body{ font-size:12px; color:#4d4b4b;}
</style>
<SCRIPT LANGUAGE="JavaScript">
<!--
function dokeydown(){
 if (event.ctrlKey && event.shiftKey && event.keyCode==68){
    var obj=document.getElementById("divexception");
    if (obj.style.display.toLowerCase()=="none"){
        obj.style.display="block";
    }else{
        obj.style.display="none";
    }
    return false;
 }
}
window.document.attachEvent('onkeydown', dokeydown);
//-->
</SCRIPT>
</head>
<body>
<br><br><br><br><br><br>
<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
    <tr>
        <td colspan="2" valign="top" bgcolor="#D6E2F2" class="style01 tdpadding">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td height="25" class="img01 titlefalse">异常信息</td>
            </tr>
            <tr>
                <td height="119" bgcolor="#FFFFFF" class="style01">
                <table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="20%" height="24" class="title01" align="center">
                              系统异常，请联系管理员。
                        </td>
                    </tr>
                    
                </table>
                </td>
            </tr>
            <tr><td>
                    <div align=center style="display:none;height:60%" id=divexception>
                     <TEXTAREA NAME="" ROWS="8" COLS="100">
                      <%
                           Exception ex = (Exception) request.getAttribute("javax.servlet.error.exception");
                         out.println(exceptionMsgForInner(ex));             
                      %>
                      </TEXTAREA>
                    <div>
            </td></tr>
        </table>
        </td>
    </tr>
</table>

</body>
</html>
