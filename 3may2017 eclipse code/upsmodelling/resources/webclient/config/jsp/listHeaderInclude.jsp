<%-- $Id: listHeaderInclude.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<table class="headerInclude" width="10%" border="0" cellpadding="0" cellspacing="3">
<tr>
    <td align="left" nowrap>
	    <a class="menuText" href="/config/AuditCVOperation.do?&viewId=<c:out value='${viewId}'/>&actionToPerform=create&searchAction=AuditCVOperation.do"><fmt:message key='webclient.config.audit.customview.addcv'/></a>
    </td>
    <td width="10" align="center" class="textSmall">&nbsp;|</td>

    <td align="center" nowrap>
	    <c:set var="modifyCVurl" value="/config/AuditCVOperation.do?&viewId=${viewId}&actionToPerform=modify&displayName=${displayName}&searchAction=AuditCVOperation.do"/>
	<a class="menuText" href='<c:out value="${modifyCVurl}"/>'><fmt:message key='webclient.config.audit.customview.modifycv'/></a>
    </td>
    <td width="10" align="center" class="textSmall"> &nbsp;|</td>
    <c:if test="${viewId != 'ConfigAudit'}">
    <td  align="center" nowrap>
	    <a class="menuText" href="javascript:removeAuditCV('<c:out value="${userName}"/>','<c:out value="${viewId}"/>','<fmt:message key="webclient.audit.customview.delete.confirmation"/>')"><fmt:message key='webclient.fault.customview.removecv'/></a>
    </td>
    <td width="10" align="center" class="textSmall"> &nbsp;|</td>
    </c:if>

    <td align="left" nowrap>
	<a class="menuText" href="/config/AdvancedAuditSearch.do?&viewId=<c:out value='${viewId}'/>&actionToPerform=search&searchAction=AdvancedAuditSearch.do"><fmt:message key='webclient.common.listview.header.operations.search'/></a>
    </td>
    <td width="10" align="center" class="menuText"> &nbsp;|</td>

    <td align="left" nowrap> 
	    <a class="menuText" href="javascript:openNewWindow('/config/AuditViewOperation.do?action=showcc&viewId=<c:out value='${viewId}'/>','','width=550,height=250,screenX=300,screenY=200,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no')"><fmt:message key='webclient.common.listview.header.operations.columncustomizer'/></a>
    </td>
</tr>
</table>
