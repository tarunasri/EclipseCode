<%-- $Id: AdminPanel.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.admin.adminpanel.useradmin'/></title>
</head>

<body>

<table border=0 cellspacing=0 cellpadding=10 width=100%>
<tr>
<td>

<table border="0" cellpadding="0" cellspacing="0" class="dbborder1" style="text-align: left; width: 100%;">
  <tbody>
	<tr>
      <td colspan="6" align="left" class="headgGrad"><span ><fmt:message key='webclient.admin.adminpanel.securityadm'></fmt:message></span></td>
    </tr>
    	<tr>    
		<td colspan='6'> 
		<table border=0 cellspacing=0 cellpadding=10 cols=6 width=100% >
<tr align="center" > 

 
<%-- ******* User Details related Code snippet ******* --%>

<c:choose>
<c:when test="${toViewUsers == 'true'}">  
    <td height="20" colspan='1'>  <a class="text" href ="/admin/UserAdmin.do?"> <IMG border='0' align=center src='/webclient/admin/images/users.gif' ><br/><fmt:message key="webclient.admin.adminpanel.userconfig"/></a> </td>
</c:when>
<c:otherwise>
    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/users.gif' ><br/><fmt:message key="webclient.admin.adminpanel.userconfig"/></td>
</c:otherwise>
</c:choose>

<%-- ******* User Details related Code snippet ******* --%>


<%-- ******* Add User related Code snippet ******* --%>

<c:choose>

<c:when test="${groupList=='true'}">  
    <td height="20" colspan='1'> <a class="text" href ="/admin/GroupAdmin.do?"><IMG border='0' align=center src='/webclient/admin/images/groups.gif' ><br/><fmt:message key="webclient.admin.adminpanel.groupconfig"/></a></td>
</c:when>

<c:otherwise>
    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/groups.gif' ><br/><fmt:message key="webclient.admin.adminpanel.groupconfig"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Add User related Code snippet ******* --%>


<%-- ******* Modify User related Code snippet ******* --%>

<c:choose>

<c:when test="${setOperations=='true'}">  
    <td height="20" colspan='1'>  <a class="text" href ="javascript:openWindow('/admin/OperationsView.do?selectedTab=admin&selectedNode=securityadmin&Operation=AddOperation','OperationTree','450','580',',scrollbars=yes,resizable=no,directories=no,menubar=no,toolbar=no')"> <IMG align=center border='0' src='/webclient/admin/images/operations.gif' ><br/><fmt:message key="webclient.admin.adminpanel.operationconfig"/></a></td>
</c:when>

<c:otherwise>
    <td height="20" colspan='1'> <IMG align=center border='0' src='/webclient/admin/images/operations.gif' ><br/><fmt:message key="webclient.admin.adminpanel.operationconfig"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Modify User related Code snippet ******* --%>
 

<%-- ******* Audit Trails settings related Code snippet ******* --%>

<c:choose>

<c:when test="${auditTrails == 'true'}">
      <td colspan='1'> <a class="text" href ="/admin/AuthAudit.do?"><IMG border='0' align=center src='/webclient/admin/images/adminmodifyusericon.gif' ><br/><fmt:message key="webclient.admin.adminpanel.audittrails"/></a></td>
</c:when>

<c:otherwise>
    <td colspan='1'> <IMG border='0' align=center src='/webclient/admin/images/adminmodifyusericon.gif' ><br/><fmt:message key="webclient.admin.adminpanel.audittrails"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Audit Trails settings related Code snippet ******* --%>


<%-- ******* Remove User related Code snippet ******* --%>

<%-- ******* Remove User related Code snippet ******* --%>

   <td height="20" colspan='1'> 
	  &nbsp;
      </td>
   <td height="20" colspan='1'> 
	  &nbsp;
      </td>
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
