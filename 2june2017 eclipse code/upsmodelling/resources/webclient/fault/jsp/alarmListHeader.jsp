<%-- $Id: alarmListHeader.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="com.adventnet.nms.util.NmsUtil;"%>
<table border=0 cellspacing=0 cellpadding="2">
<tr>
           <%
             String dispName = request.getParameter("displayName");
             if(dispName == null)
             {
                dispName = (String)request.getAttribute("displayName");
             }
             String encodedDispname = "";
             if(dispName != null)
             {
                encodedDispname = java.net.URLEncoder.encode(dispName,"UTF-8");
             }
             request.setAttribute("encodedDispname",encodedDispname );
             request.setAttribute("encodedNetworkEvents",java.net.URLEncoder.encode(NmsUtil.GetString("Network Events"),"UTF-8"));
          %>

            <td align="left">
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.alarm.operations.viewevent'/>" onclick="javascript:showEvents('/fault/NetworkEvent.do?selectedNode=Events&selectedTab=Fault&viewId=Events&displayName=<c:out value="${encodedNetworkEvents}"/>','<fmt:message key="webcliemt.fault.alarm.operations.viewevent.noalarmerror"/>')">
            </td>

        <c:if test="${permittedToClearAlert == true}">
            <td align="left">
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.alarm.operations.clear'/>" onclick="javascript:performOperation('/fault/AlarmOperations.do?methodCall=clearAlarm&viewId=<c:out value="${viewId}"/>&displayName=<c:out value="${encodedDispname}"/>','<fmt:message key="webcliemt.fault.alarm.operations.clear.noalarmerror"/>')">
            </td>
        </c:if>

        <c:if test="${permittedToDeleteAlert == true}">
            <td align="left">
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.alarm.operations.delete'/>" onclick="javascript:deleteAlarm('/fault/AlarmOperations.do?methodCall=deleteAlarm&viewId=<c:out value="${viewId}"/>&displayName=<c:out value="${encodedDispname}"/>','<fmt:message key="webcliemt.fault.alarm.operations.delete.noalarmerror"/>','<fmt:message key="webclient.fault.alarm.operations.deletealarm.confirm"/>')">
            </td>
        </c:if>

        <c:if test="${permittedToPickup == true}">
          <td align="left">

         <c:choose>
          <c:when test="${isAssign == 'true'}">
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.alarm.operations.assign'/>" onclick="javascript:assignAlarm('/fault/AlarmDetails.do?method=toAssignAlert&viewId=<c:out value="${viewId}"/>&from=listView','<fmt:message key="webcliemt.fault.alarm.operations.assign.noalarmerror"/>')">
          </c:when>
          <c:otherwise> 
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.alarm.operations.pickup'/>" onclick="javascript:performOperation('/fault/AlarmOperations.do?methodCall=pickUpAlarm&viewId=<c:out value="${viewId}"/>&displayName=<c:out value="${encodedDispname}"/>','<fmt:message key="webcliemt.fault.alarm.operations.pickup.noalarmerror"/>')">
          </c:otherwise>
        </c:choose>
      </td>
     </c:if>

            <td align="left">
            <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.fault.alarm.operations.unpick'/>" onclick="javascript:performOperation('/fault/AlarmOperations.do?methodCall=unPickAlarm&viewId=<c:out value="${viewId}"/>&displayName=<c:out value="${encodedDispname}"/>','<fmt:message key="webcliemt.fault.alarm.operations.unpick.noalarmerror"/>')">
            </td>

</tr>
</table>
