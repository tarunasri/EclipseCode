<%-- $Id: attributeAudit.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<html>
<head>
	<title><fmt:message key='webclient.config.audit.attribute'/></title>
</head>
<body>
	<table width="100%" height="100%">
		<tr>
			<td>
	<table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="homeTableBorder">
                <tr>
                        <td align="center" nowrap class="subHeader" colspan="5">
                                <fmt:message key='webclient.config.audit.attribute'/>
                        </td>
                </tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="homeTableBorder">
                <tr>
                        <td align="center" nowrap class="blackText" colspan="3">
                                <fmt:message key='webclient.config.audit.attribute.deviceName'/>&nbsp; : &nbsp;
				<c:out value="${deviceName}"/>
			</td>
                </tr>
                <tr>
                        <td align="center" nowrap class="blackText" colspan="3">
                                <fmt:message key='webclient.config.audit.attribute.starttime'/>&nbsp; : &nbsp;
                                <c:out value="${timeOfStart}"/>
                        </td>
                </tr>
	</table>
	<table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="homeTableBorder">
                <tr class="tableHeaders">
                        <td nowrap class="tableHeaders">
                                <fmt:message key='webclient.config.audit.attribute.name'/>
                        </td>
                        <td nowrap class="tableHeaders">
                                <fmt:message key='webclient.config.audit.attribute.timeOfFinish'/>
                        </td>
                        <td nowrap class="tableHeaders">
                                <fmt:message key='webclient.config.audit.attribute.retires'/>
                        </td>
                        <td nowrap class="tableHeaders">
                                <fmt:message key='webclient.config.audit.attribute.result'/>
                        </td>
                        <td nowrap class="tableHeaders">
                                <fmt:message key='webclient.config.audit.attribute.status'/>
                        </td>
                </tr>
		<c:forEach var="prop" items="${list}" varStatus="status">
		        <c:choose>
		          <c:when test="${status.count%2==0}">
		             <TR class="generalOddRow" height=22>
		          </c:when>
		          <c:otherwise>
		             <TR class="generalEvenRow" height=22>
		          </c:otherwise>
		       </c:choose>
			<td>
				<c:out value='${prop.identifier}'/>
			</td>
                        <td>
                                <c:out value='${prop.timeOfFinish}'/>
                        </td>
                        <td>
                                <c:out value='${prop.retries}'/>
                        </td>
                        <td>
                                <c:out value='${prop.result}'/>
                        </td>
                        <td>
                                <c:out value='${prop.status}'/>
                        </td>
		</tr>
		</c:forEach>
	</table>
</td>
</tr>
</table>
</body>
</html>
