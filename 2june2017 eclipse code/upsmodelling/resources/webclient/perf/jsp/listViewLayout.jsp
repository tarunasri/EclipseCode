<%-- $Id: listViewLayout.jsp,v 1.1 2007/10/05 07:24:41 gnanasekar Exp $ --%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<tiles:insert attribute="PageIncludes"/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="bottom">
        <td valign=bottom width="100%">
	<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><c:out value="${displayName}" default="${param.displayName}"/></h1></td>
		<td align="right"><tiles:insert attribute="HeaderIncludes"/></td>
        </tr>
        </table>	
	</td>
</tr>

 <tr>
	<td>
	        <table align="center" width="100%" cellpadding="0" cellspacing="0" border="0">
	        <tr>
        	<td>
		<tiles:insert attribute="StatusMessage"/> 
		</td>
		</tr>     
		</table>
	</td>
 </tr>

 <tr>
	<td><tiles:insert attribute="ListView"/></td>
 </tr>	
</table>
