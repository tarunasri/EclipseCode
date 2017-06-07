<%-- $Id: dataSourcePage.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<c:choose>
<c:when test='${empty datasources}'>
<table width='100%' height='100%' cellspacing='0' cellpadding='3' border='0'><tbody><tr valign='middle'><td class='configParams'><center><fmt:message key='webclient.config.task.form.attr.table.message'/>&nbsp;&nbsp;<a href="/config/DataSourceAction.do?actionToPerform=showAddDS&protocol=<c:out value='${TaskForm.map.protocol}'/>&taskName=<c:out value='${TaskForm.map.taskName}'/>"><span class="bluelink"><fmt:message key="webclient.config.ds.add.link"/></span></a></center></td></tr></tbody></table>
</c:when>
<c:otherwise>
<div id='dsTableTitle' style="display:'';">
	      <table width='100%' style='table-layout:fixed;' cellspacing='0' cellpadding='0' border='0' align='left'><tr class='generalTBHeader'>
	      <td style='width:15px;padding-right:5px;'>&nbsp;</td>
	      <td style='width:20px;padding-right:5px;'></td>
	      <td align='left' style='padding:2px 2px;'><fmt:message key='webclient.config.task.form.ds'/></td>
</tr></table>
</div>
<table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" style='clear:both;table-layout:fixed;' >
<tbody>

	<c:forEach var="dsName" items="${datasources}" varStatus="i">
	<c:choose>
	<c:when test="${i.count%2==0}">
		<tr id="<c:out value='${dsName}'/>" class="generalEvenRow" onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'">
	</c:when>
	<c:otherwise>
		<tr id="<c:out value='${dsName}'/>" class="generalOddRow" onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'">
	</c:otherwise>
	</c:choose>
	<td width="2%"><a href="javascript:deleteDS('<c:out value="${dsName}"/>');"><img src="/webclient/common/images/spacer.gif" border="0" align="absmiddle" class="deleteIcon" title="<fmt:message key='webclient.config.manage.device.title.delete'/>"/></a></td>
<td style='width:20px;padding-right:5px;'>
<input type='radio' name='dataSource' value="<c:out value='${dsName}'/>" onclick ="javascript:fetchDSDetails(this)"/></td>
	<td nowrap="nowrap" align='left' style='padding:2px 2px;'><a href="/config/DataSourceAction.do?actionToPerform=getDataSource&dsName=<c:out value='${dsName}'/>" title="<fmt:message key='webclient.config.datasource.modify'/>"><c:out value='${dsName}'/></a></td>


		</tr>

	</c:forEach>

</c:otherwise>
</c:choose>
</tbody>
</table>


</html>
