<%-- $Id: taskListHeader.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="com.adventnet.nms.util.NmsUtil;"%>
<table border=0 cellspacing=0 cellpadding="2">
	<tr nowrap='nowrap'>
		<td  align="center" nowrap class="pageHeader"><fmt:message key='webclient.config.task.configure.addtask'/>&nbsp;</td>
		<td>
			<a href="/config/AddTask.do?"><fmt:message key='webclient.config.task.configure.addsingletask'/></a>&nbsp;|
		</td>
		<td>
			<a href="/config/TaskAction.do?operation=execute&actionToPerform=combinedTaskForm"><fmt:message key='webclient.config.task.configure.addcombinedtask'/></a>&nbsp;|
		</td>
		<td width="5" align="center" class="textSmall"> &nbsp; </td>	
		<td  align="center" nowrap class="pageHeader"><fmt:message key='webclient.config.task.configure.header'/>&nbsp;</td>
                <td>
                        <a href="/config/DeviceListAction.do?actionToPerform=getDeviceLists"><fmt:message key='webclient.config.task.configure.dl'/></a>
		</td>
	</tr>
</table>
