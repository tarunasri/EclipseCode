<%-- $Id: serverDetails.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.serverstatus.details'/></title>
</head>

<body>

<table border=0 cellspacing=0 cellpadding=10 width=100%>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0" class="dbborder1" style="text-align: left; width: 100%;">
  <tbody>
	<tr>
      <td colspan="6" align="left" class="headgGrad"><span ><fmt:message key='webclient.admin.systemadmin.serverstatus.details'></fmt:message></span></td>
    </tr>
    	<tr>
		<td colspan='6'> 
		<table border=0 cellspacing=0 cellpadding=10 cols=6 width=100% >
	  <tr align="center" class="fontBlue"> 

<%-- ******* Server Details related Code snippet ******* --%>

<c:choose>

<c:when test="${serverDetails=='true'}">  	  
    <td height="20" colspan='1'> <a href ="/admin/AdminServerStatus.do?toPerform=serverDetails"><IMG border='0' align=center src='/webclient/admin/images/adminbedetails.gif' ><br/><fmt:message key="webclient.admin.sysadmin.bedetails.link"/></a></td>

    <td height="20" colspan='1'>  <a href ="/admin/AdminServerStatus.do?toPerform=schedulerDetails"><IMG align=center border='0' src='/webclient/admin/images/adminschdetails.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverstatus.schedulerdetails"/></a></td>
 
    <td height="20" colspan='1'>  <a href ="/admin/AdminServerStatus.do?toPerform=portDetails"><IMG border='0' align=center src='/webclient/admin/images/adminportdetails.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverstatus.portdetails"/></a></td>
	  
    <td height="20" colspan='1'>  <a href ="/admin/AdminServerStatus.do?toPerform=feDetails"><IMG border='0' align=center src='/webclient/admin/images/adminfedetails.gif' ><br/><fmt:message key="webclient.admin.sysadmin.fedetails.link"/></a> </td>

</c:when>

<c:otherwise>

    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminbedetails.gif' ><br/><fmt:message key="webclient.admin.sysadmin.bedetails.link"/></td>

    <td height="20" colspan='1'><IMG align=center border='0' src='/webclient/admin/images/adminschdetails.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverstatus.schedulerdetails"/></td>

    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminportdetails.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverstatus.portdetails"/></td>

    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminfedetails.gif' ><br/><fmt:message key="webclient.admin.sysadmin.fedetails.link"/></td>
</c:otherwise>
</c:choose>
</tr>
          <tr align="center" class="fontBlue">
<c:choose>

<c:when test="${serverDetails=='true'}">

    <td height="20" colspan='1'>  <a href ="/admin/AdminServerStatus.do?toPerform=clientDetails"><IMG border='0' align=center src='/webclient/admin/images/adminclientdetails.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverstatus.clientdetails"/></a></td>

    <td height="20" colspan='1'> <a href ="/admin/ShowServerLogs.do?directory=logs"><IMG border='0' align=center src='/webclient/admin/images/adminserverlogs.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverlogs.title"/></td>

</c:when>

<c:otherwise>


    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminclientdetails.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverstatus.clientdetails"/></td>

    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminserverlogs.gif' ><br/><fmt:message key="webclient.admin.systemadmin.serverlogs.title"/></td>

</c:otherwise>

</c:choose>

<%-- ******* Server Details related Code snippet ******* --%>
<c:choose>
<c:when test="${logging=='true'}">
<td colspan='1'><a class="adminLink" href ="/admin/loggingAction.do"><IMG border='0' align=center src='/webclient/admin/images/adminloggingicon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.logging.link"/></a></td>

<td colspan='1'><a href="/admin/viewlogAction.do"><IMG border='0' align=center src='/webclient/admin/images/spylogicon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.spylog.link"/></a></td>
</c:when>

<c:otherwise>
<td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminloggingicon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.logging.link"/></td>

<td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/spylogicon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.spylog.link"/></td>
</c:otherwise>

</c:choose>

</tr>
     </table>
   </td>
   </tr>
   <br> 
</tbody>
</table>

<br>
</td>
</tr>
</table>
</body>
</html>
