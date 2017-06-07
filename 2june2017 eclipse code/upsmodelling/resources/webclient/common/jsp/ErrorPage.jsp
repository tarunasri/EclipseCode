<%-- $Id: ErrorPage.jsp,v 1.2 2007/09/14 10:25:02 gnanasekar Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<html>
<head>
   <title>Error page</title>
</head>

<body>
<table width="400" border="0" align="center" cellpadding="6" cellspacing="0">
  <tbody><tr> 
    <td width="370"><img src="/webclient/common/images/trans..gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td><table width="388" border="0" cellpadding="0" cellspacing="0" class="NobotBorder">
        <tbody><tr> 
          <td width="53" align="left" valign="top"><img src="/webclient/common/images/error_icon.gif" width="43" height="43"></td>
          <td width="335" align="left" valign="middle"><span class="boldText"><fmt:message key='webclient.common.error.description'/></span><br> 
            <span class="text">
                                <c:out value="${ActionException}"/>
            </span> <br> <br> <a href="javascript:history.go(-1)" class="errorText"><fmt:message key='webclient.common.error.click'/></a><span class="boldText"><fmt:message key='webclient.common.error.goback'/></span> </td>
        </tr>
      </tbody></table></td>
  </tr>
</tbody></table>
</body>
</html>
