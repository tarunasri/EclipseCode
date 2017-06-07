<%-- $Id: perfHeaderInclude.jsp,v 1.2 2007/09/14 11:30:55 gnanasekar Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
      
  <table class="headerInclude" border="0" cellspacing="0" cellpadding="0" >
   <tr>


<%--  ====================  MENUS FOR STATISTICS MANIPULATION ========================== 

    <td  align="center" nowrap><span class="pageHeader"><fmt:message key='webclient.perf.statistic.header'/> </span>

        &nbsp;</td><Td>  <a class="textSmall" href="javascript:addStatistics('/perf/StatisticDetails.do?toPerform=addStatisticsForm&agentName=<c:out value="${agentName}"/>')"><fmt:message key='webclient.perf.header.add'/></a></td>

        <td width="10" align="center" class="textSmall"> &nbsp;| </td>
       <td align="center" nowrap><a class="textSmall" href="javascript:modifyStatistics('/perf/StatisticDetails.do?toPerform=showStatistics&agentName=<c:out value="${agentName}"/>','<fmt:message key="webclient.perf.statistics.modify.errmsg"/>')"><fmt:message key='webclient.perf.header.modify'/></a></td>
	 
    <td width="10" align="center" class="textSmall"> &nbsp;| </td>
    <td align="center" nowrap><a class="textSmall" href="javascript:deleteStatistics('/perf/StatisticDetails.do?toPerform=deleteStatistics&agentName=<c:out value="${agentName}"/>','<fmt:message key="webclient.perf.statistics.deletestats.nostatserror"/>','<fmt:message key="webclient.perf.statistics.deletestats.confirm"/>')"><fmt:message key='webclient.perf.header.delete'/></a></td>

<td width="25" align="center" class="textSmall"> &nbsp;&nbsp;&nbsp;&nbsp; </td>  --%>


<%--  ====================  MENUS FOR POLLINGOBJECT MANIPULATION ==========================  --%>

 <td  align="center" nowrap class="pageHeader"><fmt:message key='webclient.perf.polling.header'/>&nbsp;</td>
        <td><a class="textSmall" href="/perf/AddPollingObjectValues.do?toPerform=userProperties"><fmt:message key='webclient.perf.header.add'/></a></td>

        <td width="10" align="center" class="textSmall"> &nbsp;| </td>
       <td align="center" nowrap><a class="textSmall" href="/perf/ModifyPollingObjects.do?toPerform=fillUpDetails&list_oid=none"><fmt:message key='webclient.perf.header.modify'/></a></td>
	 
    <td width="10" align="center" class="textSmall"> &nbsp;| </td>
    <td align="center" nowrap><a class="textSmall" href="javascript:DeletePO()"><fmt:message key='webclient.perf.header.delete'/></a></td>

<td width="25" align="center" class="textSmall"> &nbsp;&nbsp;&nbsp;&nbsp; </td>



<%--  ====================  MENUS FOR THRESHOLD MANIPULATION ==========================  --%>

 <td  align="center" nowrap class="pageHeader"><fmt:message key='webclient.perf.thresholds.header'/>&nbsp;</td>

      <td class=""><a class="textSmall" href="/perf/ThresholdDetails.do?toPerform=addThresholdForm"><fmt:message key='webclient.perf.header.add'/></a></td>
        <td width="10" align="center" class="textSmall"> &nbsp;| </td>

       <td align="center" nowrap><a class="textSmall" href="/perf/ThresholdDetails.do?toPerform=showThreshold&&actionToPerform=modifyThreshold"><fmt:message key='webclient.perf.header.modify'/></a></td>
	 
    <td width="10" align="center" class="textSmall"> &nbsp;| </td>
     <%--   <c:url var="modifyAlarmCVurl" value="/fault/invokeAlarmCV.do">
           <c:param name="actionToPerform" value="modify"/>
           <c:param name="viewId" value="${viewId}"/>
           <c:param name="displayName" value="${displayName}"/>
        </c:url> --%>

    <td align="center" nowrap><a class="textSmall" href="/perf/ThresholdDetails.do?toPerform=showThreshold&actionToPerform=deleteThreshold"> <fmt:message key='webclient.perf.header.delete'/></a></td>

<td width="10" align="center" class="textSmall"> &nbsp;&nbsp;&nbsp;&nbsp; </td>


    <%--

       <td width="10" align="center" class="menuText"> &nbsp;| </td>

	  <td align="left" nowrap><a class="menuText" href="/fault/alarmAdvancedSearch.do?ComplexSearchView=Alerts&viewId=<c:out value='${viewId}'/>&searchAction=alarmAdvancedSearch.do"><fmt:message key='webclient.common.listview.header.operations.search'/></a></td>
	  
	  <td width="10" align="center" class="menuText">&nbsp;|</td>

        <c:url var="printLink" value="/fault/PrintAlarmView.do">

          <c:choose>
          <c:when test="${empty severity}">
          </c:when>
          <c:otherwise>
          <c:param name="severity" value="${severity}"/>
          </c:otherwise>
          </c:choose>

           <c:param name="viewId" value="${viewId}"/>
           <c:param name="displayName" value="${encodedDisplayName}"/>
           <c:param name="viewLength" value="${viewLength}"/>
          <c:param name="actionToPerform" value="print"/>
	   <c:param name="FROM_INDEX" value="${startIndex}"/>
           <c:param name="isAscending" value="${isAscending}"/>
           <c:param name="orderByColumn" value="${orderByColumn}"/>
           <c:if test='${!entity}'>     
              <c:param name="entity" value="${entity}"/>
           </c:if>     
                
        </c:url>

	  <td align="left" nowrap><a class="menuText" href="javascript:MM_openBrWindow('<c:out value="${printLink}"/>','Print','menubar=yes,toolbar=no,location=no,status=yes,scrollbars=yes,resizable=yes,width=800,height=600')"><fmt:message key='webclient.common.listview.header.operations.print'/></a></td>
	  
	  <td width="10" align="center" class="menuText">&nbsp;|</td>
	  
	  <td align="left" nowrap> <a class="menuText" href="javascript:openNewWindow('<c:out value="${CUSTOMIZE_COLUMNS_ACTION}?viewId=${viewId}"/>')"><fmt:message key='webclient.common.listview.header.operations.columncustomizer'/></a></td>
	  </td>

--%>

  </tr>

</table>
