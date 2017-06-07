<%-- $Id: MODetailsBaseLayout1.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<html>
<head>
<title><fmt:message key="webclient.mainwindow.title"/></title>
<title><fmt:message key="webclient.mainwindow.title"/></title>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@ include file="/webclient/topo/jspf/inventoryViewOperations.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/topo/js/moFunctions.js"></SCRIPT>
<script type="text/javascript" src="/webclient/common/js/calendar.js"></script>
<script type="text/javascript" src="/webclient/common/js/calendar-en.js"></script>
<script type="text/javascript" src="/webclient/common/js/calendar-setup.js"></script>

<script>



</script>

<style>
      #hometab1 a, #hometab2 a { cursor: pointer; }
       
</style>

</head>





<html>
<body>
<table class="pageTitleBot" width="100%"  border="0" cellpadding="0" cellspacing="0" > 
	
         <tr> 
          <input type="hidden" value='<c:out value="${ObjectDetailsBean.map.name}"/>' name="tst" />
          <td valign="bottom" class="MODisplayNameClassCol1" id="MODisplayName">&nbsp;<fmt:message key='webclient.topo.objectdetails.snapshot'/> - <c:out value='${ObjectDetailsBean.map.name}'/></td> 
          <td class="MODisplayNameClassCol1">&nbsp; </td> 
          <td  align="right" valign="bottom" class="MODisplayNameClassCol1" > <div style="padding-bottom:0px; " ><tiles:insert attribute="Actions"/> </div></td> 
        </tr> 
		</table>
		
		<table width="100%" border="0" cellpadding="0" cellspacing="0" >
		  <tr><td><tiles:insert attribute="UpdateMsg"/></td></tr>
		  <tr><td>&nbsp;</td></tr>
		</table>
		
<table width="100%" border="0" cellpadding="0" cellspacing="0" > 

          <c:choose>
          <c:when test="${ObjectDetailsBean.map.type eq 'Interface'}">
             <tr> 
          <td width="49%" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0"  > 
              <tr> 
                <td width="3%" height="21" class="tableBdr1" style=" padding:0px; border-left:0px; border-right:0px; border-top:0px;">&nbsp;</td> 
                <td width="25%" height="21" nowrap class="tabLeftBgSel" ><b><fmt:message key='webclient.topo.objectdetails.devicedetails'/></b></td> 
                <c:choose>
                <c:when test="${modifyObject == 'true'}">
                <td width="49%" height="21" class="tableBdr1" style="border-right:0px; border-top:0px; border-left:0px; text-align:right; padding:0px;"> <div id="edittoggle">&nbsp;<img class="pointer" title="<fmt:message key='webclient.topo.modetails.edit'/>" id="edit" onClick="javascript:hidediv1('devicedetail_edit','devicedetail','null1')" src="/webclient/common/images/edit1.gif" width="16" height="15"></div></td> 
                </c:when>
                <c:otherwise>
                <td width="49%" height="21" class="tableBdr1" style="border-right:0px; border-top:0px; border-left:0px; text-align:right; padding:0px;">&nbsp;</td> 
                </c:otherwise>
                </c:choose>
              </tr> 
              <tr> 
                <td colspan="3" class="tableBdr1" style="border-top:0px; padding:0px;">
				<div id="devicedetail" style="display: ;"><tiles:insert attribute="DeviceDetails"/></div>
				
				<div id="devicedetail_edit"style="display:none;"><tiles:insert attribute="EditDeviceDetails"/></div>
				<tiles:insert attribute="RecentAlarms"/>
				</td> 
              </tr>
			  
            </table>
			
			
			</td> 
          <td width="2%">&nbsp;</td> 
          <td width="49%" align="center" valign="top"  > <table width="100%"  border="0" cellspacing="0" cellpadding="0"  > 
              <tr> 
                <td width="3%" height="21" class="tableBdr1" style=" padding:0px; border-left:0px; border-right:0px; border-top:0px;">&nbsp;</td> 
                <td width="23%" height="21" nowrap  class="tabLeftBgSel"><b><fmt:message key='webclient.topo.objectdetails.otherdetails'/></b></td> 
                <td width="49%" height="21" class="tableBdr1" style="border-right:0px; border-top:0px; border-left:0px; text-align:right; padding:0px;">&nbsp; </td> 
                
              </tr> 
              <tr> 
                <td colspan="3" class="tableBdr1" style="border-top:0px; padding:0px;" >
				
				<div style=" display:;" id="DeviceNote" ><tiles:insert attribute="DeviceNotes"/></div>
				
				
				</td> 
              </tr>
			  
            </table></td> 
             
          </c:when>
          <c:otherwise> 
          <td width="60%" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0"  > 
              <tr> 
                <td width="3%" height="21" class="tableBdr1" style=" padding:0px; border-left:0px; border-right:0px; border-top:0px;">&nbsp;</td> 
                <td width="25%" height="21" nowrap class="tabLeftBgSel" id="hometab1" onClick="javascript:hidediv1('devicedetail','DeviceNote','devicedetail_edit')" ><b><a><fmt:message key='webclient.topo.objectdetails.devicedetails'/></a></b></td> 
                <td width="23%" height="21" nowrap  class="tabLeftBgnotSel" id="hometab2" onClick="javascript:hidediv1('DeviceNote','devicedetail','devicedetail_edit')"><b><a><fmt:message key='webclient.topo.objectdetails.otherdetails'/></a></b></td> 
                <c:choose>
                <c:when test="${modifyObject == 'true'}">
                <td width="49%" height="21" class="tableBdr1" style="border-right:0px; border-top:0px; border-left:0px; text-align:right; padding:0px;"><div id="edittoggle">&nbsp;<img class="pointer" title="<fmt:message key='webclient.topo.modetails.edit'/>" id="edit" onClick="javascript:hidediv1('devicedetail_edit','devicedetail','DeviceNote')" src="/webclient/common/images/edit1.gif" width="16" height="15"></div></td>
                </c:when>
                <c:otherwise> 
                <td width="49%" height="21" class="tableBdr1" style="border-right:0px; border-top:0px; border-left:0px; text-align:right; padding:0px;">&nbsp;</td>
                </c:otherwise>
                </c:choose>
              </tr> 
              <tr> 
                <td colspan="4" class="tableBdr1" style="border-top:0px; padding:0px;">
				<div id="devicedetail" style="display: ;"><tiles:insert attribute="DeviceDetails"/></div>
				<div style=" overflow:auto;height:410px;display:none;" id="DeviceNote" ><tiles:insert attribute="DeviceNotes"/></div>
                                <div id="devicedetail_edit"style="display:none;"><tiles:insert attribute="EditDeviceDetails"/></div>
				<tiles:insert attribute="RecentAlarms"/>
				</td> 
              </tr>
			  
            </table>
			
			
			</td> 
          <td width="2%">&nbsp;</td> 
          <td width="38%" valign="top" class="tableBdr1" style="padding:0px;" ><div id="perfmonitors"><tiles:insert attribute="PerformanceMonitors"/></div></td>
          </c:otherwise>
          </c:choose> 
        </tr> 
        
         <tr> 
          <td height="30" colspan="2" valign="bottom"  class="MODisplayNameClassCol1"><fmt:message key='webclient.topo.objectdetails.graphs'/></td> 
          <td valign="bottom"  class="MODisplayNameClassCol1" style="text-align:right; ">&nbsp;</td> 
        </tr> 
      </table>
		 <c:choose>
		  <c:when test="${ObjectDetailsBean.map.isRouter eq 'true'}">
			<div id="routgrphs"><tiles:insert attribute="RouterGraphs"/></div>
		  </c:when>
		  <c:otherwise>
              <div style="margin-top:15px;" id="mogrphs"><tiles:insert attribute="Graphs"/></div>
          </c:otherwise>
         </c:choose> 
        
          <c:choose>
        <c:when test="${( ObjectDetailsBean.map.type ne 'Interface' && classname eq 'SnmpNode') || (ObjectDetailsBean.map.type ne 'Interface' && classname eq 'Printer') || (ObjectDetailsBean.map.type ne 'Interface' && classname eq 'SwitchObject') }">
        
       
             <div id="interfacetable"><tiles:insert attribute="InterfaceTable"/></div> 
        
        </c:when>
        <c:otherwise>
        
        </c:otherwise>
        </c:choose>         
 
<div id="canceltoggle" style="display:none;" >&nbsp;<img class="pointer" title="<fmt:message key='webclient.topo.modetails.cancel'/>" id="cncl" onClick="javascript:hidediv1('devicedetail','devicedetail_edit','cancel')" src="/webclient/common/images/cancelIcon.gif" width="16" height="15"></div>
<div id="edittoggle1" style="display:none;">&nbsp;<img class="pointer" title="<fmt:message key='webclient.topo.modetails.edit'/>" id="edit" onClick="javascript:hidediv1('devicedetail_edit','devicedetail','null1')" src="/webclient/common/images/edit1.gif" width="16" height="15"></div>
 </body>
 </html>
