

<%-- $Id: searchResults.jsp,v 1.3 2010/10/29 13:47:07 swaminathap Exp $ --%>
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
    <c:choose>
    <c:when test="${module == 'Events'}">
              <%@include file = "/webclient/fault/jsp/eventList.jsp" %>
    </c:when>
    <c:otherwise>
          <%@include file = "/webclient/fault/jsp/alarmList.jsp" %>
    </c:otherwise>
    </c:choose>
    </td>
</tr>
</c:when>
<c:otherwise>
<tr class="header1Bg"> 
    <td height="30" class="header1Bg" align=center><span class="text">&nbsp;<fmt:message key='webclient.fault.searchresult.noresult'/> </span></td>
</tr>

</c:otherwise>
</c:choose>
</c:if>
