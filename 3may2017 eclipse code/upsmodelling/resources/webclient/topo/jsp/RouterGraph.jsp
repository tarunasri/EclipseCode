<%-- $Id $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>


<c:choose>
<c:when test="${ForMOGrahps eq 'false'}" >
<html>
<body>

  
 <c:forEach begin="0" end="5" step="1">
  <table style="margin-top:20px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        
		<tr><td> &nbsp;</td></tr>
        <tr>
         
          <td valign="top" >
            <table border="0" cellspacing="0" cellpadding="0" class="tablebdr1" width="100%" style="padding:0px; ">
             
              <tr class="homeHeader"><td> &nbsp;</td></tr>
              <tr><td> &nbsp;</td></tr>
              <tr> 
                 <td height="170" align="center" > 
                   <div style='text-align:center;padding:10px;height:180px'><img src='/webclient/common/images/LoadingTC.gif' style='margin-top:74px' onclick="javascript:interfaceTableRequest('<c:out value="${MOName}"/>','<c:out value="${TypeForMO}"/>','<c:out value="${SnmpCheckForMO}"/>');"/></div>
                 </td>
	          </tr>
	          <tr><td> &nbsp;</td></tr>
              <tr><td> &nbsp;</td></tr>
             </table>
           </td>
         </tr>
       </table>
     </c:forEach>
     
     
 
</body>
</html>
</c:when>
<c:otherwise>

<html>
<body>

<table border="0" cellspacing="0" cellpadding="5" width="100%">
<tr>
    <td align="center" valign="top">
    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tablebdr1" style="padding:0px; ">
	<tr class="homeHeader"><td> &nbsp;<fmt:message key ='webclient.topo.objectdetails.router.cpuheader'/></td></tr>
    <c:choose>
    <c:when test='${RouterGraph.CpuUsage != "NODATA"}'>
    <tr>
	<td align="center" style="padding:20px;"><IMG SRC="<c:out value='${RouterGraph.CpuUsage.imageFileName}'/>" border="0" /></td>
    </tr>
    </c:when>
    <c:otherwise>
    <tr><td align="center"><font style="color:red; font-weight:bold; "><fmt:message key ='webclient.topo.objectdetails.router.nograph'/></font></td></tr>
    </c:otherwise>
    </c:choose>
    </table>
    
	</td>
	</tr>


<tr>
    <td align=center valign=top>
    
<table border="0" cellspacing="0" cellpadding="0" width="100%" class="tablebdr1" style="padding:0px; ">
	<tr class="homeHeader"><td> &nbsp;<fmt:message key ='webclient.topo.objectdetails.router.memheader'/></span></td></tr>
    <c:choose>
    <c:when test='${RouterGraph.MemoryUtilization != "NODATA"}'>

    <tr>
	<td align="center" style="padding:20px;"><IMG SRC="<c:out value='${RouterGraph.MemoryUtilization.imageFileName}'/>" border="0" /></td>
    </tr>
    </c:when>
    <c:otherwise>
    <tr><td align="center"><font style="color:red; font-weight:bold; "><fmt:message key ='webclient.topo.objectdetails.router.nograph'/></font></td></tr>
    </c:otherwise>
    </c:choose>
    </table>

    </td>
	</tr>
	<tr>
    <td>

  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tablebdr1" style="padding:0px; ">
	<tr class="homeHeader"><td> &nbsp;<fmt:message key ='webclient.topo.objectdetails.router.buffhitheader'/></span></td></tr>
    <c:choose>
    <c:when test='${RouterGraph.BufferHits != "NODATA"}'>
<%--
    <tr>
	<td align="right">
	    <table border=0 cellspacing=2 cellpadding=2>
	    <tr>
		<td><a href="javascript:openWindow('/topo/objectdetails.do?requestid=SNAPSHOT&name=<c:out value='${ObjectDetailsBean.map.name}'/>&snapshot=RouterSnapshot&graphName=BufferHits&domainRange=','sathish',800,600)"><img src="/webclient/common/images/zoom.gif" border=0></a></td>
		<td><a href="javascript:openWindow('/topo/objectdetails.do?requestid=SNAPSHOT&name=<c:out value='${ObjectDetailsBean.map.name}'/>&snapshot=RouterSnapshot&graphName=BufferHits&domainRange=WEEK&chartType=STACKEDAREA','sathish',800,600)"><IMG src="/webclient/common/images/7days.gif" border="0"></a></td>
		<td><a href="javascript:openWindow('/topo/objectdetails.do?requestid=SNAPSHOT&name=<c:out value='${ObjectDetailsBean.map.name}'/>&snapshot=RouterSnapshot&graphName=BufferHits&domainRange=MONTH&chartType=STACKEDAREA','MONTH',800,600)"><IMG src="/webclient/common/images/30days.gif" border="0"></a></td>
	    </tr>
	    </table>
	</td>
    </tr>

--%>
    <tr>

	<td align="center" style="padding:20px;"><IMG SRC="<c:out value='${RouterGraph.BufferHits.imageFileName}'/>" border="0" /></td>
    </tr>
    </c:when>
    <c:otherwise>
    <tr><td align="center" style=""><font  style="color:red; font-weight:bold; "><fmt:message key ='webclient.topo.objectdetails.router.nograph'/></font></td></tr>
    </c:otherwise>
    </c:choose>
    </table>
    </td>
    </tr>
	<tr>
	<td>

  <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tablebdr1" style="padding:0px; ">
	<tr class="homeHeader"><td> &nbsp;<fmt:message key ='webclient.topo.objectdetails.router.buffmissheader'/></td></tr>
    <c:choose>
    <c:when test='${RouterGraph.BufferMisses != "NODATA"}'>
    <tr>
	<td align="center" style="padding:20px;"><IMG SRC="<c:out value='${RouterGraph.BufferMisses.imageFileName}'/>" border="0" /></td>
    </tr>
    </c:when>
    <c:otherwise>
    <tr><td align="center"><font style="color:red; font-weight:bold; "><fmt:message key ='webclient.topo.objectdetails.router.nograph'/></font></td></tr>
    </c:otherwise>
    </c:choose>
    </table>
    </td>
</tr>
<tr>
    <td colspan=2>
 <table border="0" cellspacing="0" cellpadding="0" width="100%" class="tablebdr1" style="padding:0px; ">
	<tr class="homeHeader"><td> &nbsp;<fmt:message key ='webclient.topo.objectdetails.router.bufffailheader'/></td></tr>
    <c:choose>
    <c:when test='${RouterGraph.BufferFailures != "NODATA"}'>
    <tr>
	<td align="center" style="padding:20px;"><IMG SRC="<c:out value='${RouterGraph.BufferFailures.imageFileName}'/>" border="0" /></td>
    </tr>
    </c:when>
    <c:otherwise>
    <tr><td align="center"><font style="color:red; font-weight:bold; "><fmt:message key ='webclient.topo.objectdetails.router.nograph'/></font></td></tr>
    </c:otherwise>
    </c:choose>
    </table>
    </td>
</tr>


                <%-- ................... Code for Other Graphs............. --%>

<c:choose>
<c:when test="${empty PollsList}">

</c:when>
<c:otherwise>

<tr>
<td colspan="2"> &nbsp;
    <c:set var="i" value="0"/>
    <c:set var="rowCount" value="0"/>	

<table width="100%" class="tablebdr1" border="0" cellspacing="0" cellpadding="0" style="padding:0px;">
    <tr class="homeHeader">
    <td colspan="3" align="left"> &nbsp;<span class="boldText"><fmt:message key='webclient.topo.othergraph.title'/></span>
    </td>
    </tr>    

    <c:forEach var="list" items="${PollsList}" varStatus="status">
    <c:choose>
    <c:when test="${list.key == 'hrStorageType_RAM' || list.key == 'hrStorageAllocationUnits_RAM' || list.key == 'hrStorageUsed_RAM' || list.key == 'hrStorageSize_RAM' || list.key == 'RouterMemoryUtilization' || list.key == 'RouterCPUUtilization' || list.key == 'MemoryUtilization' || list.key == 'CPUUtilization' || list.key == 'SwitchMemoryUtilization'}">
    </c:when>


    <c:otherwise>

<%-- ************* Code for displaying the Graphs Links in two columns ***************** --%>
<c:choose>
<c:when test="${list.value=='Device_INTERFACE_out_octets'}">
<c:set var="graphName" value="Device_Tx_Traffic"/>
</c:when>
<c:when test="${list.value=='Device_INTERFACE_in_octets'}">
<c:set var="graphName" value="Device_Rx_Traffic"/>
</c:when>
<c:otherwise>
<c:set var="graphName" value="${list.value}"/>
</c:otherwise>
</c:choose>

            <c:set var="i" value="${i+1}"/>
            <c:choose>
            <c:when test="${i % 2 != 0}">
		<c:set var="rowCount" value="${rowCount+1}"/>
		<c:choose>
		<c:when test="${rowCount %2 == 0}">
		<tr class="reportsOddRow">
		</c:when>
		<c:otherwise>
		<tr class="reportsEvenRow">
		</c:otherwise>
		</c:choose>
            <td class="text" nowrap>
            <img src="/webclient/common/images/actCfgGraphs.gif" align="middle"></img>&nbsp;&nbsp;<a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${list.key}'/>&displayName=<c:out value='${list.value}'/>"><c:out value="${graphName}"/></a><br>
            </td>   
            </c:when>

            <c:otherwise>
            <td class="text" nowrap>
            <img src="/webclient/common/images/actCfgGraphs.gif" align="middle"></img>&nbsp;&nbsp;<a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${list.key}'/>&displayName=<c:out value='${list.value}'/>"><c:out value="${graphName}"/></a><br>
            </td>
            </c:otherwise>    
            </c:choose> 

            <c:if test="${i % 2 == 0}">
            </tr>
            </c:if>

    </c:otherwise>
    </c:choose>
    </c:forEach>
  </table>
  </td>
</tr>
</c:otherwise>
</c:choose>
</table>
</body>
</html>
</c:otherwise>
</c:choose>



