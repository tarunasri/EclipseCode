<%-- $Id: networkAdminPanel.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.admin.networkadmin.treenode'/></title>
</head>

<body>

<table border=0 cellspacing=0 cellpadding=10 width=100%>
<tr>
<td>
<table border="0" cellpadding="0" cellspacing="0" class="dbborder1" style="text-align: left; width: 100%;">
  <tbody>
	<tr>
      <td colspan="6" align="left" class="headgGrad"><span ><fmt:message key='webclient.admin.networkadmin.treenode'></fmt:message></span></td>
    </tr>
    	<tr>
		<td colspan='6'> 
		<table border=0 cellspacing=0 cellpadding=10 cols=6 width=100% >
<tr align="center" class="fontBlue"> 

<%-- ******* Add Node related Code snippet ******* --%>

<c:choose>

<c:when test="${privileges.AddNode=='true'}">  
    <td height="20" colspan='1'> <a href ="/topo/addNode.do"><IMG border='0' align=center src='/webclient/admin/images/adminaddnode.gif' ><br/><fmt:message key="webclient.admin.networkadmin.addnode.title"/></a></td>
</c:when>

<c:otherwise>
    <td height="20" colspan='1'><IMG border='0' align=center src='/webclient/admin/images/adminaddnode.gif' ><br/><fmt:message key="webclient.admin.networkadmin.addnode.title"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Add Node related Code snippet ******* --%>


<%-- ******* Add Network related Code snippet ******* --%>

<c:choose>

<c:when test="${privileges.AddNetwork=='true'}">  
    <td height="20" colspan='1'> <a href ="/topo/addNetwork.do"><IMG align=center border='0' src='/webclient/admin/images/adminaddnetwork.gif'><br/><fmt:message key="webclient.admin.networkadmin.addnetwork.title"/></a></td>
</c:when>

<c:otherwise>
    <td height="20" colspan='1'><IMG align=center border='0' src='/webclient/admin/images/adminaddnetwork.gif'><br/><fmt:message key="webclient.admin.networkadmin.addnetwork.title"/></td>
</c:otherwise>

</c:choose>

<%-- ******* Add Network related Code snippet ******* --%>


<%-- ******* Refresh Node related Code snippet ******* --%>

<c:choose>

<c:when test="${privileges.RefreshNode=='true'}">   
    <td height="20" colspan='1'> <a href ="/topo/refreshNode.do"><IMG border='0' align=center src='/webclient/admin/images/adminrefreshnode.gif'><br/><fmt:message key="webclient.admin.networkadmin.refreshnode"/></a></td>
</c:when>

<c:otherwise>
    <td height="20" colspan='1'> <a href ="/topo/refreshNode.do"><IMG border='0' align=center src='/webclient/admin/images/adminrefreshnode.gif'><br/><fmt:message key="webclient.admin.networkadmin.refreshnode"/></a></td>
</c:otherwise>

</c:choose>

<%-- ******* RefreshNode related Code snippet ******* --%>



	   <td height="20" colspan='1'> 
	  &nbsp;
      </td>
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
