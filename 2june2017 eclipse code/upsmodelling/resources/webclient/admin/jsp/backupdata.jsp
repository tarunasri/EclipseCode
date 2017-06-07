<%-- $Id: backupdata.jsp,v 1.2 2007/09/14 09:48:05 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.services.backup.treename'/></title>
</head>

<body>

<form action="/admin/BackupProcess.do">
<input type="hidden" name="toPerform" value="backUp" >
<c:choose>
<c:when test="${!empty message}">
    
    <p align="center"><span class="responseText"><c:out value="${message}"/></span></p>
    
</c:when>
<c:otherwise>

        <table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td><h1><fmt:message key='webclient.admin.systemadmin.services.backup.treename'/></h1></td>
        </tr>
        </table>
    

        <table align="center" class="messageStyle" width="60%" border="0" cellspacing="0" cellpadding="6">
        <tr> 
                <td align="center" valign="top" class="text"><fmt:message key='webclient.admin.systemadmin.backup.text'><fmt:param><fmt:message key="WebNMS"/></fmt:param></fmt:message></td>
        </tr>
        <tr> 
                <td align="center"> 
                <input name="confirm" type="submit" class="button" value="<fmt:message key='webclient.admin.systemadmin.conformation.yes'/>" > 
                <input name="confirm" type="button" class="button" value="<fmt:message key='webclient.admin.systemadmin.conformation.no'/>" onClick="javascript:history.back()"> 
                </td>
        </tr>
        </table>

</c:otherwise>
</c:choose>

</form>
</body>
</html>
