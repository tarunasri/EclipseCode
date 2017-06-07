<%-- $Id: ListViewWidget.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<table class="inventoryBg" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="bottom" style="padding:10px 30px 30px 10px;" class="inventoryFold">

<table width="100%" border="0" cellpadding="2" cellspacing="0" style="margin:20px 0px 20px 0px;">
        <c:forEach var="invTable" items="${inventTable}" varStatus="status"> 
        <tr>
	<td width="5%"><img src="/webclient/common/images/<c:out value='${invTable.type}'/>.gif"/></td>
        <td align="left"><a href="/topo/NetworkInventory.do?selectedTab=Network+Database&viewId=Network+Database&type=<c:out value='${invTable.type}'/>&displayName=<c:out value='${invTable.displayName}'/>&showMenus=false" title="<fmt:message key='${invTable.displayName}'/>" class="boldTxt"><fmt:message key='${invTable.displayName}'/></a></td>

        <c:forEach var="severity" items="${severityList}" varStatus="status">
        <c:choose>
        <c:when test="${severity=='Clear'}">
            <td align="right" style="padding-right:30px;"><a class="boldTxt" title="<fmt:message key='webclient.inventory.device${severity}'/>" href="/topo/NetworkInventory.do?selectedTab=Network+Database&viewId=Network+Database&type=<c:out value='${invTable.type}'/>&displayName=<c:out value='${invTable.displayName}'/>&showMenus=false&status=<c:out value='${severity}'/>"><c:out value='${invTable[severity]}'/></a> <img  border="0" align="absmiddle" src="/webclient/common/images/upgreen.gif" /></td>
        </c:when>

        <c:otherwise>
        <td align="right" ><a title="<fmt:message key='${severity}'/>" href="/topo/NetworkInventory.do?selectedTab=Network+Database&viewId=Network+Database&type=<c:out value='${invTable.type}'/>&displayName=<c:out value='${invTable.displayName}'/>&status=<c:out value='${severity}'/>&showMenus=false" class="boldTxt"><c:out value='${invTable[severity]}'/></a> <img  border="0" align="absmiddle" src="/webclient/common/images/downred.gif" /></td>
        </c:otherwise>
        </c:choose>
        </c:forEach>

        </tr>
        </c:forEach> 

        </table>

</td>
  </tr>
</table>
</html>

