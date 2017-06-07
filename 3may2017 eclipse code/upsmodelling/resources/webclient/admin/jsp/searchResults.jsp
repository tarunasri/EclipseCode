
<%-- $Id: searchResults.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<c:if test ='${param.method =="search"}'>
<c:choose>
<c:when test ='${! empty viewData}'>
<table width="100%" cellSpacing="0">
<tr class="header1Bg"> 
    <td height="30" class="header1Bg"><span class="header1">&nbsp;<fmt:message key='webclient.fault.searchresult.header'/></span></td>
    <td class="text" align="right"><fmt:message key='webclient.fault.searchresult.searchcount'><fmt:param value="${RECORDS}"/></fmt:message></td>
</tr>
</table>

<tr class="propertyHeader"> 
    <td align="left" valign="top" class="propertyHeader">
          <%@include file = "/webclient/admin/jsp/auditTrailsView.jsp" %>
    </td>
</tr>
</c:when>
<c:otherwise>
<tr > 
    <td height="10" class="header1Bg"> <br></td>
</tr>
<tr class="header1Bg"> 
    <td height="30" class="header1Bg" align=center><span class="text">&nbsp;<fmt:message key='webclient.fault.searchresult.noresult'/> </span></td>
</tr>
</c:otherwise>
</c:choose>
</c:if>
