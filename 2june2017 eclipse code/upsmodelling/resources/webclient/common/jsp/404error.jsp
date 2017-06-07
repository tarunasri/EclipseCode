<%-- $Id: 404error.jsp,v 1.2 2010/10/29 13:47:02 swaminathap Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
	<title><fmt:message key='WebNMS Version x.x'/> - <fmt:message key='webclient.common.errorpage.notice'/></title>
<%@ include file = "/webclient/common/jspf/commonIncludes.jspf"%>
</head>

<body >
<table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
	  <td height="30" align="left" class="header2Bg"><span class="header2"> &nbsp;  <fmt:message key='webclient.common.errorpage.pageNotFound'/>
      </span></td>
  </tr>
  <tr> 
    <td align="left"> <table width="100%" border="0" cellspacing="1" cellpadding="2">
        <tr>
          <td> <p align="left" class="text"><br>
		  <fmt:message key='webclient.common.errorpage.msg'><fmt:param><a href="/mainLayout.do" target="_top"><fmt:message key='webclient.common.errorpage.homepage'/></a></fmt:param></fmt:message>.</p>
            </td>
        </tr>
      </table>
      
    </td>
  </tr>
  <tr> 
    <td align="left">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" class="header2Bg"><img src="../images/trans.gif" width="1" height="1"></td>
  </tr>
</table>
</body>
</html>
