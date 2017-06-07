<%-- $Id: shutDown.jsp,v 1.2 2007/09/14 10:11:06 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.shutdown.title'/></title>
</head>

<body>

<form action="/admin/ShutDownServer.do">

<c:choose>
<c:when test="${!empty message}">
    
    <p align="center"><span class="responseText"><c:out value="${message}"/></span></p>
    
</c:when>
<c:otherwise>

        <table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td><h1><fmt:message key='webclient.admin.systemadmin.shutdown.title'><fmt:param><fmt:message key="WebNMS"/></fmt:param></fmt:message></h1></td>
        </tr>
        </table>
    

        <table align="center" class="messageStyle" width="60%" border="0" cellspacing="0" cellpadding="6">
        <tr> 
                <td align="center" valign="top" class="text"><fmt:message key='webclient.admin.systemadmin.shutdown.confirmation'/></td>
        </tr>
        <tr> 
                <td align="center"> 
                <input name="confirm" type="submit" class="button" value="<fmt:message key='webclient.admin.systemadmin.conformation.yes'/>" > 
                <input name="confirm" type="button" class="button" value="<fmt:message key='webclient.admin.systemadmin.conformation.no'/>" onClick="javascript:history.back()"> 
                </td>
        </tr>
        </table>
    
  <!--table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
        <td width="10" rowspan="3" valign="top">&nbsp;</td>
        <td height="30" valign="bottom"><span class="header1"><fmt:message key='webclient.admin.systemadmin.shutdown.title'><fmt:param><fmt:message key="WebNMS"/></fmt:param></fmt:message></span></td>
    </tr>
    <tr> 
      <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
    <tr> 
      <td align="center" class="text">&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td align="center" valign="top" class="text"><fmt:message key='webclient.admin.systemadmin.shutdown.confirmation'/></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td height="20">&nbsp; </td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td align="center"> 
          <input name="confirm" type="submit" class="button" value="<fmt:message key='webclient.admin.systemadmin.shutdown.confirmation.yes'/>"> 
          <input name="confirm" type="button" class="button" value="<fmt:message key='webclient.admin.systemadmin.shutdown.confirmation.no'/>" onClick="javascript:history.back()"> 
      </td>
    </tr>
  </table-->
</c:otherwise>
</c:choose>

</form>

</body>

</html>
