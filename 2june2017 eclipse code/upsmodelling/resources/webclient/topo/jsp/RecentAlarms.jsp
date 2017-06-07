<%-- $Id: RecentAlarms.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>

<html>

<body onload="javascript:performanceMonitorsRequest('<c:out value="${MOName}"/>','<c:out value="${ClassNameForMO}"/>','<c:out value="${CategoryForMO}"/>','<c:out value="${TypeForMO}"/>','<c:out value="${SnmpCheckForMO}"/>','<c:out value="${RouterCheckForMO}"/>','<c:out value="${InstanceForMO}"/>','false');">

					<table id="anchorforas" width="100%" cellpadding="0" cellspacing="0" border="0" class="msgboard"> 
  <tr> 
    <td  width="25"  height="50"> &nbsp;<img src="/webclient/common/images/alarm.gif" width="20" height="25"></td> 
    <td  nowrap><b style="color: rgb(255, 0, 0);">&nbsp;<fmt:message key='webclient.topo.modetails.recentalarm'/></b></td> 
    <td  width="90%" align="right" nowrap><a  style="cursor:pointer; text-decoration:underline; font-weight:bold;" onclick="javascript:showAlarmChart('alarm_summary','anchorforas');" ><fmt:message key='webclient.topo.objectdetails.alarms.viewsummary'/></a> &nbsp;&nbsp;</td>
    <td  align="right" valign="top" ><img src="/webclient/common/images/postitTopRight.gif" border="0"></td>
    <c:choose> 
    <c:when test="${RecentAlarmImg eq 'NODATA'}" > 
  <tr> 
    <td colspan="4" height="78"><b> <fmt:message key='webclient.topo.objectdetails.alarms.na'/> </b></td> 
  </tr> 
  </c:when> 
  <c:otherwise> 
  <tr> 
    <td colspan="3" height="78" align="left"><div> &nbsp;<IMG SRC="<c:out value='${RecentAlarmImg}'/>"> &nbsp;<c:out value='${RecentAlarmMsg}'/>
    </div><br>
    <c:choose> 
    <c:when test="${RecentAlarmImg1 eq 'NODATA'}" >
    <div>&nbsp;</div><td valign="bottom"><a href='/mainLayout.do?entity=<c:out value="${ObjectDetailsBean.map.name}"/>+&objName=<c:out value="${ObjectDetailsBean.map.name}"/>+&selectedNode=Alerts&selectedTab=Fault&displayName=Alarms&action=/fault/AlarmView.do'><b><fmt:message key='webclient.topo.objectdetails.alarms.more'/></b> </a>&nbsp; &nbsp;
    </c:when>
    <c:otherwise>
    <div>&nbsp;<IMG SRC="<c:out value='${RecentAlarmImg1}'/>"> &nbsp;<c:out value='${RecentAlarmMsg1}'/></div> </td><td valign="bottom"><a href='/mainLayout.do?entity=<c:out value="${ObjectDetailsBean.map.name}"/>+&objName=<c:out value="${ObjectDetailsBean.map.name}"/>+&selectedNode=Alerts&selectedTab=Fault&displayName=Alarms&action=/fault/AlarmView.do'><b><fmt:message key='webclient.topo.objectdetails.alarms.more'/></b> </a>&nbsp; &nbsp;
    </c:otherwise>
    </c:choose>
    </td>
     
  </tr> 
  
  </c:otherwise> 
  </c:choose> 
   </table>   
   
   
 <div  id="alarm_summary" style="display:none; " >	

  <table cellspacing="0" cellpadding="0" border="0" width="250"> 
	
	<tr> 
  <td class="tablebdr1" style="border-right:0px; padding:0px;  border-bottom:0px; "></td> 
  <td align="left" valign="top"  class="tablebdr1" style="border-right:0px; border-left:0px; border-bottom:0px; padding:0px; "></td> 
  <td class="righttop_curve" > </td> 
</tr> 
<tr> 
  <td class="tablebdr1" style="border-right:0px; border-top:0px; border-bottom:0px; padding:0px; "><img height="1" width="1" src="images/spacer.gif"/></td> 
  <td valign="top" class="generalTBPadding1" style="background-color:#FFFFFF; ">
  
  <table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tr class="homeHeader">
	<td align="left"  height="25" style="padding:0px; "> &nbsp;<b> <fmt:message key='webclient.topo.modetails.alarmsummary'/> </b></td><td align="right"><img border="0" src="/webclient/common/images/deleteWidget.gif" title="close" onclick=Javascript:hideElement("alarm_summary") style="cursor: pointer; text-decoration: none;" /> &nbsp;</td></tr>
	<tr>
	<c:choose> 
			<c:when test="${alarmChart eq 'NODATA'}" > 
			<td width="200" height="200" align="center" colspan="2"><IMG SRC="/webclient/topo/images/pie3d_grey.png" /> </td> 
			</c:when> 	
			<c:otherwise> 
			<td align="center" colspan="2"><IMG SRC="<c:out value='${alarmChart}'/>" border="0" /></td> 
			</c:otherwise>
	</c:choose> 
	</tr>
    
	</table>
   
  </td> 
  <td class="rightcenter"></td> 
</tr> 
<tr> 
  <td class="bottomleft_curve"> <img height="1" width="1" src="images/spacer.gif"/></td> 
  <td class="bottomcenter"> <img height="1" width="1" src="images/spacer.gif" /></td> 
  <td class="bottomright_curve"><img height="1" width="1" src="images/spacer.gif" /></td> 
</tr> 
</table> 


</div>
</body>
</html>
