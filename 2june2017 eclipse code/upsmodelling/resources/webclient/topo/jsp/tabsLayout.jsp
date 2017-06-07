<%-- $Id: tabsLayout.jsp,v 1.5 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>

<%@ page  import="java.util.*" %>


<tiles:useAttribute name="tabList" classname="java.util.List" />
<tiles:useAttribute id="completeDef" name="completeDef" ignore="true" classname="java.lang.String" />


<%!

int tablecount=0;

%>

<SCRIPT language=JavaScript type=text/JavaScript>

var formBean = '<c:out value="${beanName}"/>';
var formName = eval('document.'+formBean);

function traverseTab(beanName,tabindex)
{  
// For issue in Mozilla & Opera
document.forms[beanName].mode.value = "tab";
document.forms[beanName].perform.value = "traverse";
document.forms[beanName].toBeSelected.value = tabindex;
}

function changeMode(beanName,tabindex)
{
document.forms[beanName].mode.value = tabindex;
document.forms[beanName].perform.value = "traverse";
document.forms[beanName].submit(); 
}

function traverseTabLink(beanName,tabindex)
{  
//document.forms[beanName].mode.value = "tab";
document.forms[beanName].perform.value = "traverse";
document.forms[beanName].toBeSelected.value = tabindex;
formName.submit();
}

function updatePerform(beanName)
{  
//document.forms[beanName].mode.value = "tab";
document.forms[beanName].perform.value = "update";
}

</SCRIPT>

<INPUT type="hidden" name="perform" value="traverse">
<INPUT type="hidden" value="<c:out value='${selectedTopoTabName}'/>" name="selectedTopoTab">
<INPUT type="hidden" value="<c:out value='${selectedTopoTabName}'/>" name="toBeSelected">

<c:out value="${deviceGraph}"/>
<%--
for the graph added from the getGraph method of MODetailsHandler, the data will be available in the deviceGraph as properties.

<c:out value="${deviceGraph}"/>

below is sample implementation about how the graph needs to be plotted

<c:choose>
<c:when test='${(deviceGraph==null) || (deviceGraph.<TITLE>== "NODATA")}'>
<tr><td colspan=2 class="txtGlobal" align="center"><fmt:message key='webclient.devices.details.na'/></td></tr>

</c:when>
<c:otherwise>
<tr>
<td align=center>
        <img src="<c:out value='${deviceGraph.<TITLE>.imageFileName}'/>" border=0 }/>
</td>
</tr>
</c:otherwise>
</c:choose>
--%>

 <c:forEach items="${tabList}" var="tab" varStatus="status"> 
<c:set var='tablecount' value="${status.count}" />
</c:forEach>


<td  width="130" valign="top"> 
<c:set var="swaptableid" value='0' scope='request'/>
<table height="100%" width="775" border="0" valign="top" cellspacing="1"  cellpadding="10" >
    <c:if test="${!empty messages}">
	<tr>
		<td  colspan=2>
			<table width="100%" border="0" align="left" valign="top" cellpadding="0" cellspacing="0">
				<tiles:insert attribute='header'/> 
			</table>
		</td>
	</tr>   
	</c:if>

	<tr>
         <td valign="top">
			<table width="100%" border="0" valign="top" align="left" cellpadding="0" cellspacing="0">
			<c:forEach items="${tabList}" var="tab" varStatus="status">
			<c:set var="selectedBody" value='${tab.link}'/>
			<tr>
				<td><tiles:insert beanName="selectedBody"/></td>
			</tr>
            <tr>
				<td>&nbsp;</td>
			</tr>
			</c:forEach> 
			</table>
		</td>
<%--

		<td valign="top">
			<table width="50%"  valign="top" align="left" cellpadding="0" class="htableBorder" cellspacing="0">
			<c:forEach items="${tabList}" var="tab" varStatus="status">
			<c:choose>
			<c:when test="${status.count le tablecount/2}" >
			<c:set var="selectedBody" value='${tab.link}'/>
			<tr>
				<td><tiles:insert beanName="selectedBody"/></td>
			</tr>
			</c:when>
			</c:choose>
			</c:forEach> 
			</table>
		</td>
      
		<td valign="top">
			<table width="50%" valign="top" align="left" cellpadding="0" class="htableBorder" cellspacing="0">
			<c:forEach items="${tabList}" var="tab" varStatus="status">
			<c:choose>
			<c:when test="${status.count gt tablecount/2}" >
			<c:set var="selectedBody" value='${tab.link}'/>
			<tr>
				<td><tiles:insert beanName="selectedBody"/> </td>
			</tr>
			</c:when>
			</c:choose>
			</c:forEach>
			</table>
		</td>
--%>

	</tr>
</table>
 

<%-- Master table for the snapshot page --%>
<table border="0" cellspacing="0" cellpadding="2" width="770" align="left">
  <tbody>
<%-- 
 <tr> 
        <td colspan="3">&nbsp;</td>
 </tr>
 --%>

<%-- XXXXXXXXXXXXXXXXXXX  Interface Graphs STARTS HERE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --%>


<c:choose>
<c:when test="${ObjectDetailsBean.map.type eq 'Interface' || ObjectDetailsBean.map.type eq 'Port'}" >


<tr>
<td valign="top"> 
<%--
 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >		
--%>
<!-- Interface Traffic Details -->

<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

<table border="0" cellspacing="0" cellpadding="4" class="htableBorder" width=100%>
<tbody>
<tr class="boldText">
    <td colspan=3 class="header2Bg">
		<fmt:message key='webclient.devices.details.intf.trafficgraph'><fmt:param value="${info.desc}"/></fmt:message></font>
	</td>

</tr>
<%--
<tr>
<td align=right>
<!-- graph tools -->
	 <table border=0 cellspacing=2 cellpadding=2>
	 <tr>
	 <td>
	 <a href="javascript:openWindow('/devices/ZoomImage.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceTraffic&domainRange=&graphName=InterfaceTraffic&snapshot=Interface','WEEK',850,600,'scrollbars=yes')"><img src="/webclient/common/images/zoom.gif" border=0 align="middle"></a>
	 </td>
	 <td>
	 <a href="javascript:openWindow('/devices/graphview.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceTraffic&domainRange=WEEK&graphName=InterfaceTraffic&snapshot=Interface','WEEK',850,600,'scrollbars=yes')"><IMG src="/webclient/common/images/7days.gif" border="0"></a>
   	 </td>
	 <td>
		<a href="javascript:openWindow('/devices/graphview.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceTraffic&domainRange=MONTH&graphName=InterfaceTraffic&snapshot=Interface','MONTH',850,600,'scrollbars=yes')"><IMG src="/webclient/common/images/30days.gif" border="0"></a>
	 </td>
	 </tr>
	 </table>
</td>
</tr>
--%>
<c:choose>
<c:when test='${(IntfGraph==null) || (IntfGraph.InterfaceTraffic == "NODATA")}'>

<tr><td colspan=2 class="txtGlobal" align="center"><fmt:message key='webclient.devices.details.na'/></td></tr>

</c:when>
<c:otherwise>


<tr>
<td align=center>

	<img src="<c:out value='${IntfGraph.InterfaceTraffic.imageFileName}'/>" border=0 }/>
</td>
</tr>
</c:otherwise>
</c:choose>

</table>

 </td>		
	<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>	



<br>	

<!-- Interface Utilization Details -->
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table border="0" cellspacing="0" cellpadding="5" class="htableBorder" width=100%>

<tr class="boldText">
<td colspan=2  class="header2Bg">		
	<fmt:message key='webclient.devices.details.intf.utilgraph'><fmt:param value="${info.desc}"/></fmt:message></font></td>
</tr>
<%--
<tr>
<td align=right>
<!-- graph tools -->
	 <table border=0 cellspacing=2 cellpadding=2>
	 <tr>
	 <td>
	 <a href="javascript:openWindow('/devices/ZoomImage.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceUtilization&domainRange=&graphName=InterfaceUtilization&snapshot=Interface','WEEK',850,600,'scrollbars=yes')"><img src="/webclient/common/images/zoom.gif" border=0></a>
	 </td>
	 <td>
	 <a href="javascript:openWindow('/devices/graphview.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceUtilization&domainRange=WEEK&graphName=InterfaceUtilization&snapshot=Interface','WEEK',850,600,'scrollbars=yes')"><IMG src="/webclient/common/images/7days.gif" border="0"></a>
   	 </td>
	 <td>
	<a href="javascript:openWindow('/devices/graphview.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceUtilization&domainRange=MONTH&graphName=InterfaceUtilization&snapshot=Interface','MONTH',850,600,'scrollbars=yes')"><IMG src="/webclient/common/images/30days.gif" border="0"></a>
	 </td>
	 </tr>
	 </table>
</td>
</tr>
--%>

<c:choose>
<c:when test='${(IntfGraph == null) || (IntfGraph.InterfaceUtilization == "NODATA")}'>

<tr><td colspan=2 class="txtGlobal" align="center"><fmt:message key='webclient.devices.details.na'/></td></tr>

</c:when>
<c:otherwise>


<tr>
<td align=center>
	<img src="<c:out value='${IntfGraph.InterfaceUtilization.imageFileName}'/>" border=0 />
</td>
</tr>

</c:otherwise>
</c:choose>

</table>

 </td>		
	<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>	

<br>

<!-- Interface Errors Table -->
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table border="0" cellspacing="0" cellpadding="5" class="htableBorder" width=100%>
<tr class="boldText">
<td class="header2Bg">
		<fmt:message key='webclient.devices.details.intf.errorgraph'><fmt:param value="${info.desc}"/></fmt:message></font></td>
</tr>
<%--
<tr>
<td align="right" class="txtGlobal">
<table border=0 cellspacing=2 cellpadding=2>
<tr>
<td>
<a href="javascript:openWindow('/devices/ZoomImage.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceError&domainRange=&graphName=InterfaceErrors&snapshot=Interface','WEEK',850,600,'scrollbars=yes')"><img src="/webclient/common/images/zoom.gif" border=0 title="Zoom"></a>
</td>
<td>
<a href="javascript:openWindow('/devices/graphview.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceError&domainRange=WEEK&graphName=InterfaceErrors&snapshot=Interface','WEEK',850,600,'scrollbars=yes')"><IMG src="/webclient/common/images/7days.gif" border="0" title="7 Days"></a>
</td>
<td>
<a href="javascript:openWindow('/devices/graphview.do?name=<c:out value='${info.name}'/>&requestid=Interface&Instance=<c:out value='${info.instance}'/>&type=InterfaceError&domainRange=MONTH&graphName=InterfaceErrors&snapshot=Interface','MONTH',850,600,'scrollbars=yes')"><IMG src="/webclient/common/images/30days.gif" border="0" title="30 days"></a>
</td>
</tr>
</table>
</td>
</tr>
--%>
<c:choose>
<c:when test='${(IntfGraph == null) || (IntfGraph.InterfaceErrors == "NODATA")}'>
<tr><td class="txtGlobal" align="center"><fmt:message key='webclient.devices.details.na'/></td></tr>
</c:when>
<c:otherwise>

<tr>
<td align=center>
<img src="<c:out value='${IntfGraph.InterfaceErrors.imageFileName}'/>" border=0 />
</td>

</tr>

</c:otherwise>
</c:choose>
</tbody>
</table>
</td>		
	<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>	
<%-- XXXXXXXXXXXXXXXXXXX  Interface Graphs ENDS HERE XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX --%>

</c:when>
<c:otherwise>



<c:choose>
<c:when test="${empty IF_DATA}">
</c:when>

<c:when test="${classname eq 'SwitchObject'}">
<%--tr>
<td colspan=5 valign="bottom" class="header2"><span ><fmt:message key='webclient.topo.interfaces.table.header'/></span></td>
 
</tr--%>
<tr>
 
<td colspan=2>

<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"><span class="generalTitle"><fmt:message key='webclient.topo.interfaces.table.header'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

<table border="0" cellspacing="0" cellpadding="0" class="htableBorder" width="100%" >
  <tbody>
  
  <tr height="23" class="header2Bg" >
  <td width="10%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.index'/></td>
  <td width="40%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.description'/></td>
  <td width="20%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.speed'/></td>
  <td width="10%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.status'/></td>
  <td width="30%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.mac'/></td>
  </tr>

<c:set var="colIndex" value="0"/>
<c:set var="rowIndex" value="0"/>
<c:forEach var="intf" items="${IF_DATA}" varStatus="status">
<c:forEach var="intf2" items="${intf}" >
         <c:choose>
           <c:when test='${colIndex <=5}'>
		<c:if test='${colIndex ==0}'>
			<c:choose>		
			    <c:when test="${status.count % 2 ==0}" > 		
				<TR class="reportsOddRow" >
			    </c:when>
			    <c:otherwise>
				<TR class="reportsEvenRow" >
			    </c:otherwise>
			</c:choose>  	
        	</c:if>
		<td class="text">

		<c:choose>
		<c:when test='${details.IF_DATA[rowIndex][colIndex] == null || details.IF_DATA[rowIndex][colIndex] == "" }'>
		N/A
		</c:when>
		<c:otherwise>
            <c:choose>		
			<c:when test="${colIndex ==1}" > 	
        <a href="/topo/objectdetails.do?requestid=GET_IF_DETAILS&Instance=<c:out value='${details.IF_DATA[rowIndex][0]}'/>&name=<c:out value='${ObjectDetailsBean.map.name}'/>" title="<c:out value='${prop.Name}' />" >
<c:out value='${details.IF_DATA[rowIndex][colIndex]}'/> </a>
            </c:when>
		    <c:otherwise>
		<c:out value='${details.IF_DATA[rowIndex][colIndex]}'/>
            </c:otherwise>
		    </c:choose>
		</c:otherwise>
		</c:choose>
	</a>
	</td>
           <c:set var="colIndex" value='${colIndex+1}'/>
           <c:if test='${colIndex ==5}'>
             <c:set var="colIndex" value="0"/>
             <c:set var="rowIndex" value='${rowIndex+1}'/>
             </TR>

           </c:if>
           </c:when>
         </c:choose>
        </c:forEach>
        </c:forEach>

</table>

</td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>


</td>
</tr>

</c:when>

<c:otherwise>
<!--tr>

 <td colspan=5 valign="bottom" class="header2"><span ><fmt:message key='webclient.topo.interfaces.table.header'/></span></td>
</tr-->
 
<tr>
 
<td colspan=2>

 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"><span class="generalTitle"><fmt:message key='webclient.topo.interfaces.table.header'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

<table border="0" cellspacing="0" cellpadding="0" class="htableBorder" width="100%">
  <tbody>
  
   <tr height="23" class="header2Bg" >
  <td width="10%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.index'/></td>
  <td width="40%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.description'/></td>
  <td width="20%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.speedinbps'/></td>
  <td width="10%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.status'/></td>
  <td width="30%"  class="boldText" ><fmt:message key='webclient.topo.interfaces.table.mac'/></td>
  </tr>

 <c:forEach var="prop" items="${IF_DATA}" varStatus="status" >
        
        <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="reportsOddRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsEvenRow" height=22>
           </c:otherwise>
        </c:choose>
        
<td class="text"  ><c:out value="${prop.ifIndex}"/></td>
<td class="text" >
<a href="/topo/objectdetails.do?requestid=SNAPSHOT&name=<c:out value='${prop.name}'/>" title="<c:out value='${prop.name}' />" >     <c:out value="${prop.ifDescr}"/></a> </td> 
     <%--   <td class="text" ><c:out value="${prop.ifDescr}"/></td> --%>
        <td class="text" ><c:out value="${prop.ifSpeed}"/></td>    
        <td class="text" ><c:out value="${prop.status}"/></td>
        <td class="text" ><c:out value="${prop.physAddr}"/></td>    

</c:forEach>



</table>
</td>

<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</tr>

</c:otherwise>
</c:choose>
<tr>
 <td colspan=5 ><span >&nbsp;</span></td>
</tr>
<tr>

<td valign="top">
	  <%-- CPU, Memory and Disk --%>
<%--
	    <c:set var='cpugrpName' value="CPUUtilization"/>
	    <c:set var='memgrpName' value="MemoryUtilization"/>
	    <c:if test='${ObjectDetailsBean.map.isRouter}'>
		<c:set var='cpugrpName' value="RouterCPUUtilization"/>
		<c:set var='memgrpName' value="RouterMemoryUtilization"/>
	    </c:if>


 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

      <table width="100%" class="htableBorder" border="0" cellspacing="0" cellpadding="4" >
        <tr class="header2Bg">
	    <td align="center"><span class="boldText"><fmt:message key='webclient.topo.graph.meter.cpu'/></span></td>
	    <td align="center"><span class="boldText"><fmt:message key='webclient.topo.graph.meter.memory'/></span></td>
	    <td width="37%" align="center"><span class="boldText"><fmt:message key='webclient.topo.graph.meter.disk'/></span></td>
	    </tr>
	    
	     <tr >
	    <td align="center"  valign=top>
   
	    <c:choose>
	    <c:when test='${details.CPU_USAGE == "NODATA" || details.cpuImagePath == "NODATA" ||  details.MO_PROPERTIES.category == "Switch"}'>
	     <font class="txtGlobalBold"><fmt:message key ='webclient.topo.graph.meter.nomessage'/></font><!--<c:out value='${details.cpuImagePath}'/>-->
	    </c:when>
	    <c:otherwise>

<a href="/perf/ReportViewAction.do?name=<c:out value='${ObjectDetailsBean.map.name}'/>&amp;reportType=<c:out value='${cpugrpName}'/>&amp;displayName=CPU Utilization"><IMG SRC="<c:out value='${details.cpuImagePath}'/>" border="0"></a><br><font class="text"><fmt:message key='webclient.topo.graph.meter.cpu'/><c:out value='  ${details.CPU_USAGE}'/> %</font> 

	    </c:otherwise>
	    </c:choose>
      
	    </td>
		
	    <td align="middle"  valign=top>

    
	    <c:choose>
	    <c:when test='${details.RAMUSAGE == "NODATA" || details.memImagePath == "NODATA" ||  details.MO_PROPERTIES.category == "Switch"}'>
		<font class="txtGlobalBold"><fmt:message key ='webclient.topo.graph.meter.nomessage'/></font>
	    </c:when>
	    <c:otherwise>

<a href="/perf/ReportViewAction.do?name=<c:out value='${ObjectDetailsBean.map.name}'/>&reportType=<c:out value='${memgrpName}'/>&displayName=Memory Utilization"><IMG SRC="<c:out value='${details.memImagePath}'/>" border="0"></a><br><font class="text"><fmt:message key='webclient.topo.graph.meter.memory'/><c:out value='  ${details.RAM_USAGE}'/> %</font>

	    </c:otherwise>
	    </c:choose>
    
	    </td>
	    <td  align="center"  valign=top>

	    <c:choose>
	    <c:when test='${details.DISK_USAGE == "NODATA" || details.diskImagePath == "NODATA" ||  details.MO_PROPERTIES.category == "Switch"}'>
	    <font class="txtGlobalBold"><fmt:message key ='webclient.topo.graph.meter.nomessage'/></font>
        </c:when>
	    <c:otherwise>
        <table>
		<tr>
                <IMG SRC="<c:out value='${details.diskImagePath}'/>" border=0>
        </tr>
        <tr>
		    <td align="left" ><font class="text"><fmt:message key='webclient.topo.graph.meter.disk.used'/><c:out value=' ${details.USED_DISK}GB'/></td>
            <td align="right" ><font class="text"><fmt:message key='webclient.topo.graph.meter.disk.free'/><c:out value=' ${details.FREE_DISK}GB'/></td>
		</tr>
		<tr>
		  <td align="left" ><font class="text"><fmt:message key='webclient.topo.graph.meter.disk.total'/><c:out value=' ${details.TOTAL_DISK}GB'/></td>
		</tr>
		</table></font>
	    </c:otherwise>
	    </c:choose>
	    </td>

	    </tr>
	    </table>
--%>
  
		<%-- CPU mem disk closes --%>
       <%-- </td>		
	<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>	
 </td>  
--%>


	   
	    
<%--
        <td>
            <table  class="htableBorder" border="0" cellspacing="0" cellpadding="2" width="170">
            <tr class="header2Bg">
            <td><span class="boldText">Other Graphs</span>
            </td>
            </tr>
            <c:forEach var="list" items="${PollsList}" varStatus="status">
            <c:choose>
            <c:when test="${list.key == 'hrStorageType_RAM' || list.key == 'hrStorageAllocationUnits_RAM' || list.key == 'hrStorageUsed_RAM' || list.key == 'hrStorageSize_RAM' || list.key == 'MemoryUtilization' || list.key == 'CPUUtilization'}">
            </c:when>
            <c:otherwise>
            <tr><td class="text" nowrap>
            <img src="/webclient/common/images/actCfgGraphs.gif" align="middle"></img>&nbsp;&nbsp;<a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${list.key}'/>&displayName=<c:out value='${list.value}'/>"><c:out value="${list.value}"/></a><br>
            </td></tr>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            </table>
            </td>
--%>
	    </tr>


<tr>
 <td colspan=5 ><span >&nbsp;</span></td>
</tr>


</c:otherwise>
</c:choose>

<%-- ................... Code for Other Graphs............. --%>
<%--  
<c:choose>
<c:when test="${empty PollsList}">
</c:when>
<c:otherwise>

<tr>
<td>
    <c:set var="i" value="0"/>
    <c:set var="rowCount" value="0"/>	

 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

    <table width="100%" class="htableBorder" border="0" cellspacing="0" cellpadding="2">
    <tr class="header2Bg">
    <td colspan="3" align="center"><span class="boldText"><fmt:message key='webclient.topo.othergraph.title'/></span>
    </td>
    </tr>    

    <c:forEach var="list" items="${PollsList}" varStatus="status">
    <c:choose>
    <c:when test="${list.key == 'hrStorageType_RAM' || list.key == 'hrStorageAllocationUnits_RAM' || list.key == 'hrStorageUsed_RAM' || list.key == 'hrStorageSize_RAM' || list.key == 'RouterMemoryUtilization' || list.key == 'RouterCPUUtilization' || list.key == 'MemoryUtilization' || list.key == 'CPUUtilization' || list.key == 'SwitchMemoryUtilization'}">
    </c:when>


    <c:otherwise> --%>

<%-- ************* Code for displaying the Graphs Links in two columns ***************** --%>
<%--
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
<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</tr>
</c:otherwise>
</c:choose>

--%>


<c:if test='${RouterGraph != null}'>
<tr>
    <td colspan=2>
	    <%@ include file="/webclient/topo/jsp/RouterGraph.jsp" %>
     </td>
</tr>

<tr>
 <td colspan=5 ><span >&nbsp;</span></td>
</tr>
</c:if>
   

<tr>
<td colspan=2>
<c:if test='${!empty viewData && viewData != "NODATA" }'>
    <table border="0" cellspacing="0" cellpadding="0" width="100%">
    <!--tr>
      <td colspan=5 class="header2"><fmt:message key='webclient.topo.alarms.table.header'/></td>
    </tr-->
    <tr>
	<td>

 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

	    <%@ include file="/webclient/fault/jsp/alarms.jsp" %>
	</td>

<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>

    </tr>
    </table>
</c:if>
</td>
</tr>
</tbody>
</table>

 </td>



<script>

var swaptableid=<c:out value='${swaptableid}' />
</script>




