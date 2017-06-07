<%-- $Id: feedbackThanks.jsp,v 1.1.2.1 2003/12/10 18:13:11 sivakumarv Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Thanks for your feedback</title>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<body class="popupBg">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="38" class="tabsBg">
<table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr> 
            <td width="40" height="0" nowrap>&nbsp;<img src="/webclient/common/images/mail.gif"" width="28" height="14" align="absmiddle"></td>
            <td height="0" nowrap class="whiteText">Instant Feedback</td>
          </tr>
        </table>
           </td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td align="left" valign="top"> 
      <TABLE width="100%" border=0 cellPadding=4 cellspacing="0">
        <TBODY>
          <TR> 
            <TD align="center" height="200" vAlign=middle noWrap class=header1> Thanks for your comments </TD>
          </TR>
          <TR class="propertyLeftBg"> 
            <TD align="center" vAlign=top noWrap class=text> 
              <table width="10%" border="0" cellpadding="3" cellspacing="0">
                <tr> 
                  <td width="66%" align="right"> <input name="Back" type="button" class="button" id="Back3" value="Back" onClick="javascript:window.history.back()"></td>
                  <td width="1%" align="left" valign="top"><img src="/webclient/common/images/trans.gif" width="15" height="1"></td>
                  <td width="30%" align="right"> <input name="Close" type="button" class="button" id="Close4" value="Close" onClick="javascript:window.close()"></td>
                </tr>
              </table></TD>
          </TR>
        </TBODY>
      </TABLE> </td>
  </tr>
</table>
</body>

