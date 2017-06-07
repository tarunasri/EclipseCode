<%-- $Id: searchHeader.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<tr>
	<td nowrap="nowrap">
<table class='pageHeaderStr' width='100%'>
<tbody>
<tr>
<td nowrap='nowrap'>
	<h1>
		<c:choose>
			<c:when test ='${searchForm.map.actionToPerform == "create"}'>
				<fmt:message key='webclient.config.audit.customview.create'/>
			</c:when>
			<c:when test ='${searchForm.map.actionToPerform == "modify"}'>
				<fmt:message key='webclient.config.audit.customview.modify'/>
                        </c:when>
                        <c:when test ='${searchForm.map.actionToPerform == "search"}'>
                                <fmt:message key='webclient.config.audit.customview.search'/>
			</c:when>			
		</c:choose>
	</h1>
</td>
</tr>
</tbody>
</table>
	</td>
</tr>
<input type="hidden" name="ComplexSearchView" value="<c:out value='${ComplexSearchView}'/>">
<input type="hidden" name="searchAction" value="<c:out value='${searchAction}'/>">
<input type="hidden" name="viewId" value="<c:out value='${viewId}'/>">
<html-el:hidden  name="searchForm" property="actionToPerform" />
