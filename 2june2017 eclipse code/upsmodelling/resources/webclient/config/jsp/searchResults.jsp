<%-- $Id: searchResults.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:choose>
<c:when test ='${! empty viewData}'>
<table width="100%" cellSpacing="0">
<tr class="header1Bg">
    <td height="30" class="header1Bg"><span class="header1">&nbsp;<fmt:message key='webclient.config.audit.searchresult.header'/></span></td>
    <td class="text" align="right"><fmt:message key='webclient.config.audit.cv.preview.count'><fmt:param value="${RECORDS}"/></fmt:message></td>
</tr>
</table>

<tr class="propertyHeader">
    <td align="left" valign="top" class="propertyHeader">
          <%@include file = "/webclient/config/jsp/auditList.jsp" %>
    </td>
</tr>
</c:when>
<c:otherwise>
<tr class="header1Bg">
	<td height="30" class="header1Bg" align=center><span class="text">&nbsp;<c:out value="${emptyMsg}"/></span></td>
</tr>
</c:otherwise>
</c:choose>
