<%-- $Id: addCVHeader.jsp,v 1.2 2007/09/14 11:46:24 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<c:choose>
<c:when test ='${searchForm.map.actionToPerform == "create"}'>
<fmt:message key='webclient.topo.addcv.header'/>
</c:when>
<c:when test ='${searchForm.map.actionToPerform == "modify"}'>
<fmt:message key='webclient.topo.modifycv.header'><fmt:param value="${searchForm.map.cvName}"/></fmt:message>

</c:when>
</c:choose>
</h1></td>
	        <td align="right"></td>
        
        </tr>
</table>



