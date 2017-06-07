<%-- $Id: searchResults.jsp,v 1.3 2010/10/29 13:47:16 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:if test ='${param.method =="search"}'>
<c:choose>
<c:when test ='${! empty viewData}'>

<table width="100%" cellSpacing=0 border="0">    
<tr class="header1Bg">
<td height="30"><span class="header1"><fmt:message key='webclient.topo.searchresult.header'/></span></td>
<td class="text" align="right"> <fmt:message key='webclient.topo.preview.count'><fmt:param value="${RECORDS}"/></fmt:message></td>
</tr>
</table>



    <div>
              <%@include file = "/webclient/topo/jsp/inventoryList.jsp" %>
    </div>

</c:when>
<c:otherwise>


    <div><span class="text"><fmt:message key='webclient.topo.searchresult.noresult'/></div>


</c:otherwise>
</c:choose>
</c:if>