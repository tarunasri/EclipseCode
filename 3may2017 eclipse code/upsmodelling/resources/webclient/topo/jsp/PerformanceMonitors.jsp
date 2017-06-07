<%-- $Id: PerformanceMonitors.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@ include file="/webclient/topo/jspf/inventoryViewOperations.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>


<c:choose>
<c:when test="${ForPerfMonitors eq 'false'}" >
<html>
<body>
  <table id="PerformanceMonitors" width="100%" border="0" cellspacing="0" cellpadding="5">
    <tr  class="homeHeader"><td colspan="3"> <b><fmt:message key='webclient.topo.modetails.perfmonitors.header' /></b></td></tr> 
    <tr> 
      <td height="170" align="center" class="alarmLeftBdrBottom"> 
       <img src='/webclient/common/images/LoadingTC.gif' style='margin-top:14px'/>
      </td>
	</tr>
	<tr>
	  <td height="170" align="center" class="alarmLeftBdrBottom"> 
       <img src='/webclient/common/images/LoadingTC.gif' style='margin-top:4px'/>
      </td>
     </tr>  
    <tr> 
      <td height="170" align="center"> 
       <img src='/webclient/common/images/LoadingTC.gif' style='margin-top:14px'/>
      </td> 
	</tr>
</table>
</body>
</html>
</c:when>
<c:otherwise>
<html>
 <body>
<c:set var='cpugrpName' value="CPUUtilization"/>
    <c:set var='memgrpName' value="MemoryUtilization"/>
    <c:if test='${ObjectDetailsBean.map.isRouter}'>
     <c:set var='cpugrpName' value="RouterCPUUtilization"/>
     <c:set var='memgrpName' value="RouterMemoryUtilization"/>
    </c:if>
    
    <table id="PerformanceMonitors" width="100%" border="0" cellspacing="0" cellpadding="5">
    <tr  class="homeHeader">
    <td class="boldTxt"><fmt:message key='webclient.topo.modetails.perfmonitors.header' />
    </td>
    <td align="right">
    <img class="pointer" title="<fmt:message key='webclient.topo.modetails.reload' />" border="0" onclick="javascript:performanceMonitorsRequest('<c:out value="${name}"/>','<c:out value="${ClassName}"/>','null','','','','','true');" src="/webclient/common/images/reloadWidget.gif"/>
    </td>   
    <tr> 
    </table>
<table id="PerformanceMonitors" width="100%" border="0" cellspacing="0" cellpadding="5">
    <!--tr  class="homeHeader"><td> <b><fmt:message key='webclient.topo.modetails.perfmonitors.header' /></b></td><td><img border="0" onclick="javascript:performanceMonitorsRequest('<c:out value="${name}"/>','<c:out value="${ClassName}"/>','null','','','','','true');" src="/webclient/common/images/reloadWidget.gif"/></td></tr>
     
    <tr--> 
    
  <!--td  align="center" class="alarmLeftBdrBottom" ><b></b></td-->
  
			<td height="170" align="center" class="alarmLeftBdrBottom">
				<div><fmt:message key='webclient.topo.graph.meter.cpu' /></div>
				<c:choose> 
	            <c:when test="${details.cpuImagePath eq 'NODATA' || CpuImagePath eq 'NODATA'}" > 
				<div id="cpuUtil" style="margin-top:8px;"> <IMG SRC="/webclient/topo/images/dial_grey.png" border="0"> </div> 
				</c:when> 
		        <c:otherwise> 
				<div id="cpuUtil"> <a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&amp;reportType=<c:out value='${cpugrpName}'/>&amp;displayName=CPU Utilization"><IMG SRC="<c:out value='${details.cpuImagePath}'/>" border="0"></a></div>  
				</c:otherwise> 
		        </c:choose>
	        </td>
	</tr>
   
   <tr>
   
	<!--td align="center" class="alarmLeftBdrBottom"> <b><font class="text">
	 </b></td--> 
	 
			<td height="170" align="center" class="alarmLeftBdrBottom">
				<div><fmt:message key='webclient.topo.graph.meter.memory'/></div>
			 <c:choose> 
			 <c:when test="${details.memImagePath eq 'NODATA' || MemImagePath eq 'NODATA'}" > 
		     <div id="memUtil" style="margin-top:8px;"><IMG SRC="/webclient/topo/images/dial_grey.png" border="0"></div> 
			</c:when> 
			<c:otherwise> 
			<div id="memUtil"> <a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${memgrpName}'/>&displayName=Memory Utilization"><IMG SRC="<c:out value='${details.memImagePath}'/>" border="0"></a></div> 
			</c:otherwise> 
		    </c:choose> 
	        </td>	    
   </tr>  
		
    <tr> 
   
  <!--td align="center" > <b><font class="text"> </b></td--> 
	
			<td  height=170" align="center" >
			<div><fmt:message key='webclient.topo.graph.meter.disk'/></div>
			<c:choose> 
  			<c:when test="${details.diskImagePath eq 'NODATA' || DiskImagePath eq 'NODATA'}" >  
			<div id="diskUtil" style="margin-top:8px;"> <IMG SRC="/webclient/topo/images/pie3d_grey.png" border="0"/></div>  
			</c:when>
			<c:otherwise> 
			<div id="diskUtil"><IMG SRC="<c:out value='${details.diskImagePath}'/>" border="0" /> </div> 
			</c:otherwise> 
	        </c:choose> 
	        </td>
	</tr>
	
</table>
  </body>
</html>
</c:otherwise>
</c:choose>