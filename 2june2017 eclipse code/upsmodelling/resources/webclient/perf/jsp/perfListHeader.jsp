<%-- $Id: perfListHeader.jsp,v 1.3 2007/10/05 07:23:10 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--table border=0 cellspacing=0 cellpadding="0">


<tr>

  <td valign="bottom" align="left"><span class="pageHeader"><fmt:message key='webclient.perf.view.hostlist'/>dddd</span>



<select  styleClass="formstyle" name="AgentList" onchange="showStatistics(this.options[this.selectedIndex].value);">
		   <c:forEach var="hostName" items="${agentList}">

 <c:set var="agent" value="${hostName}" scope="request" />
      <%
        String name  = (String) request.getAttribute("agent");
        if (name.length() > 35)
        {
            request.setAttribute("trimagent",(name.substring(0,33)+".."));
        }
        else
        {
            request.setAttribute("trimagent",name);
        }
     %>

		<option value='<c:out value="${hostName}"/>' <c:if test="${hostName==agentName}"> selected </c:if>> <c:out value="${trimagent}"/></option> 
	   	</c:forEach>
		<select>
  </td>

--%>
<%--
/perf/StatisticDetails.do?toPerform=deleteStatistics&selectedNode=Stats Admin&selectedTab=Performance&viewId=Stats Admin&displayName=Configured Collection

             <td align="left">
            <input name="Submit" type="button" class="button" value="<fmt:message key='webclient.perf.statistics.add.prop'/>" onclick="javascript:addStatistics('/perf/StatisticDetails.do?toPerform=addStatisticsForm&agentName=<c:out value="${agentName}"/>')">
            </td>

            <td align="left">
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.perf.statistics.delete.prop'/>" onclick="javascript:deleteStatistics('/perf/StatisticDetails.do?toPerform=deleteStatistics&agentName=<c:out value="${agentName}"/>','<fmt:message key="webclient.perf.statistics.deletestats.nostatserror"/>','<fmt:message key="webclient.perf.statistics.deletestats.confirm"/>')">
            </td>

        <c:if test="${permittedToDeleteStats == true}">
            <td align="left">
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.alarm.operations.delete'/>" onclick="javascript:deleteAlarm('/fault/AlarmOperations.do?methodCall=deleteAlarm&viewId=<c:out value="${viewId}"/>&displayName=<c:out value="${param.displayName}"/>','<fmt:message key="webcliemt.fault.alarm.operations.delete.noalarmerror"/>','<fmt:message key="webclient.fault.alarm.operations.deletealarm.confirm"/>')">
            </td>
        </c:if>



</tr>
</table--%>
