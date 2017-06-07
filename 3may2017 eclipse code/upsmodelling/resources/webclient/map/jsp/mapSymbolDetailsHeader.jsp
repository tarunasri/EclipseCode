<%-- $Id: mapSymbolDetailsHeader.jsp,v 1.2 2007/09/14 11:26:51 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><c:out value='${MapSymbolForm.map.label}'/></h1></td>
	        <td align="right">
        
                        <table class="headerInclude" width="10%" border="0" cellpadding="0" cellspacing="3">
                        <tr>
                        <td align="left" nowrap>
                        <c:if test="${! empty MapSymbolForm.map.objName && MapSymbolForm.map.objName != null && MapSymbolForm.map.objName ne 'null'}">
                            <c:url var="url" value="/topo/objectdetails.do?requestid=SNAPSHOT&name=${MapSymbolForm.map.objName} "></c:url><A HREF='<c:out value="${url}"/>'><fmt:message key='webclient.map.details.viewmodetails'/></a>
                        </c:if>
                        </td>
                        </tr>
                        </table>
                </td>
        </tr>
</table>

