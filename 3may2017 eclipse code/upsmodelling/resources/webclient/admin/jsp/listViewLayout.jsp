<%-- $Id: listViewLayout.jsp,v 1.5 2010/10/29 13:46:54 swaminathap Exp $ --%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<tiles:insert attribute="PageIncludes"/>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
		<td><h1><fmt:message key='javaui.security.authaudit.authaudit'/></h1></td>
        </tr>
      </table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td width=810>


		<table width="100%" border="0" cellspacing="0" align="left" cellpadding="2">
		<tr>
		<td>
			<table width="100%" border="0" cellspacing="0" align="left" cellpadding="0">
			<tr>
			<td width="400" valign="bottom" align="left" height=25><tiles:insert attribute="Toolbar"/></td>
            <td valign="middle"> <tiles:insert attribute="PageTraversal"/>  </td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
 	</td>
</tr>

<tr>
<td colspan="1">
<table align="center" width="100%" cellpadding="0" cellspacing="0" border="0">
<tiles:insert attribute="StatusMessage"/>      
</table>
</td>
</tr>

<tr>
<td><tiles:insert attribute="ListView"/>
</td>
</tr>	
</table>
