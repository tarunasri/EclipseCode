<%-- $Id: runtimeAdmin.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.admin.runtime.title'/></title>
</head>

<body>

<table border=0 cellspacing=0 cellpadding=10 width=100%>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0" class="dbborder1" style="text-align: left; width: 100%;">
	<tr>
      <td colspan="6" align="left" class="headgGrad"><span ><fmt:message key='webclient.admin.runtime.title'></fmt:message></span></td>
    </tr>
	<tr>
		<td colspan='6'> 
		<table border=0 cellspacing=0 cellpadding=10 cols=6 width=100% >
    <tr align="center"> 

<%-- ******* Discovery Parameter & Discovery Criteria related Code snippet ******* --%>

<c:choose>

<c:when test="${runtimeAdmin=='true'}">  	  

    <td height="20" colspan='1'> <a class="adminLink" href ="/admin/ConfigDiscParam.do"><IMG border='0' align=center src='/webclient/admin/images/admindiscparam.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.discpara.link"/></a></td>

    <td height="20" colspan='1'>  <a class="adminLink" href ="/admin/CriteriaBasedDiscovery.do"> <IMG align=center border='0' src='/webclient/admin/images/admindisccriteria.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.disccriteria.link"/></a> </td>
</c:when>

<c:otherwise>
    <td height="20" colspan='1' class="adminLink"> <IMG border='0' align=center src='/webclient/admin/images/admindiscparam.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.discpara.link"/></td>

    <td height="20" colspan='1' class="adminLink"> <IMG align=center border='0' src='/webclient/admin/images/admindisccriteria.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.disccriteria.link"/> </td>
</c:otherwise>

</c:choose>

<%-- ******* Discovery Parameter & Discovery Criteria related Code snippet ******* --%>

<%-- ******* rediscovery schedular related Code snippet ******* --%>

<c:choose>

<c:when test="${runtimeAdmin=='true'}">
          <td colspan='1'> <a class="adminLink" href ="/admin/ReDiscoverySchedular.do"><IMG border='0' align=center src='/webclient/admin/images/admindiscparam.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.rediscpara.link"/></a></td>
</c:when>

<c:otherwise>
          <td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/admindiscparam.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.rediscpara.link"/></td>
</c:otherwise>

</c:choose>
<%-- ******* rediscovery schedular related Code snippet ******* --%>
<%-- ******* Notification Profiles related Code snippet *******--%>

<c:choose>

<c:when test="${getEventFilters=='true' || setEventFilters=='true' || getAlertFilters=='true' || setAlertFilters=='true'}">
          <td colspan='1'>  <a class="adminLink" href ="/admin/NotificationProfiles.do"><IMG border='0' align=center src='/webclient/admin/images/notification_profiles.gif' ><br/><fmt:message key="webclient.admin.filters.notifications"/></a></td>
</c:when>

<c:otherwise>
         <td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/notification_profiles.gif' ><br/><fmt:message key="webclient.admin.filters.notifications"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Notification Profiles related Code snippet ******* --%>
</tr>
<tr align="center">
<%-- ******* Trap Parser related Code snippet ******* --%>

<c:choose>

<c:when test="${setTrapParsers=='true' || getTrapParsers=='true'}">  	  
<td height="20" colspan='1'>  <a class="adminLink" href ="/admin/TrapParser.do"> <IMG border='0' align=center src='/webclient/admin/images/admintrapparsericon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.trapparser.link"/></a> </td>
</c:when>

<c:otherwise>
<td height="20" colspan='1' class="adminLink"><IMG border='0' align=center src='/webclient/admin/images/admintrapparsericon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.trapparser.link"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Trap Parser related Code snippet ******* --%>
<%-- ******* Event Parser related Code snippet ******* --%>

<c:choose>

<c:when test="${getEventParser=='true' || setEventParser=='true'}">  
  <td colspan='1'><a class="adminLink" href ="/admin/EventParser.do"><IMG border='0' align=center src='/webclient/admin/images/admineventparsericon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.eventparser.link"/></a></td>
</c:when>

<c:otherwise>
  <td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/admintrapparsericon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.eventparser.link"/></td>
</c:otherwise>
  
</c:choose>

<%-- ******* Event Parser related Code snippet ******* --%>

<%-- ******* Logging related Code snippet ******* 

<c:choose>

<c:when test="${logConfiguration=='true'}">  	  
<td height="20" colspan='1'>  <a class="adminLink" href ="/admin/loggingAction.do"> <IMG border='0' align=center src='/webclient/admin/images/adminloggingicon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.logging.link"/></a> </td>
</c:when>

<c:otherwise>
<td height="20" colspan='1' class="adminLink"><IMG border='0' align=center src='/webclient/admin/images/adminloggingicon.gif' ><br/><fmt:message key="webclient.admin.runtimeadmin.logging.link"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Logging related Code snippet ******* --%>

<%-- ******* Event Filters related Code snippet ******* --%>

<c:choose>

<c:when test="${getEventFilters=='true' || setEventFilters=='true'}"> 
  <td colspan='1'>  <a class="adminLink" href ="/admin/EventFilters.do"><IMG border='0' align=center src='/webclient/admin/images/event_filters.gif' ><br/><fmt:message key="webclient.admin.filters.event"/></a></td>
</c:when>

<c:otherwise>
  <td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/event_filters.gif' ><br/><fmt:message key="webclient.admin.filters.event"/></td>
</c:otherwise>
  
</c:choose>

<%-- ******* Event Filters related Code snippet ******* --%>

<%-- ******* Alert Filters related Code snippet ******* --%>

<c:choose>

<c:when test="${getAlertFilters=='true' || setAlertFilters=='true'}"> 
  <td colspan='1'>  <a class="adminLink" href ="/admin/AlertFilters.do"><IMG border='0' align=center src='/webclient/admin/images/alert_filters.gif' ><br/><fmt:message key="webclient.admin.filters.alert"/></a></td>
</c:when>

<c:otherwise>
  <td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/alert_filters.gif' ><br/><fmt:message key="webclient.admin.filters.alert"/></td>
</c:otherwise>
  
</c:choose>

<%-- ******* Alert Filters related Code snippet ******* --%>

<%-- ******* Notification Profiles related Code snippet *******
<c:choose>

<c:when test="${getEventFilters=='true' || setEventFilters=='true' || getAlertFilters=='true' || setAlertFilters=='true'}"> 
  <td colspan='1'>  <a class="adminLink" href ="/admin/NotificationProfiles.do"><IMG border='0' align=center src='/webclient/admin/images/adminloggingicon.gif' ><br/><fmt:message key="webclient.admin.filters.notifications"/></a></td>
</c:when>

<c:otherwise>
  <td colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminloggingicon.gif' ><br/><fmt:message key="webclient.admin.filters.notifications"/></td>
</c:otherwise>
  
</c:choose>

<%-- ******* Notification Profiles related Code snippet ******* --%>

</tr>
   </table>
   </td>
   </tr>
   <br> 
</table>

<br>
</td>
</tr>
</table>
</body>
</html>
