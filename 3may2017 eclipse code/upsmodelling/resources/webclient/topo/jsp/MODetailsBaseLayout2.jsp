<%-- $Id: MODetailsBaseLayout2.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<html>
<head>
<title>
<fmt:message key="webclient.mainwindow.title"/>
</title>
<title>
<fmt:message key="webclient.mainwindow.title"/>
</title>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@ include file="/webclient/topo/jspf/inventoryViewOperations.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/topo/js/moFunctions.js"></SCRIPT>
<script type="text/javascript" src="/webclient/common/js/calendar.js"></script>
<script type="text/javascript" src="/webclient/common/js/calendar-en.js"></script>
<script type="text/javascript" src="/webclient/common/js/calendar-setup.js"></script>
</head>
<html>
<body>
<table class="pageTitleBot" width="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="45%" valign="bottom" class="MODisplayNameClassCol1" id="MODisplayName">&nbsp;
      <fmt:message key='webclient.topo.objectdetails.snapshot'/>
      -
      <c:out value='${ObjectDetailsBean.map.name}'/></td>
    <td width="0%" class="MODisplayNameClassCol1">&nbsp;</td>
    <td width="55%" align="right" valign="bottom" class="MODisplayNameClassCol1"><div style="padding-bottom:0px; ">
        <tiles:insert attribute="Actions"/>
      </div></td>
  </tr>
</table>

  <table width="100%" border="0" cellpadding="0" cellspacing="0" >
		  <tr><td><tiles:insert attribute="UpdateMsg"/></td></tr>
		  <tr><td>&nbsp;</td></tr>
  </table>
  
<table width="100%"  border="0" cellpadding="0" cellspacing="0">
  
  <tr>
    <td colspan="3" valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0"  >
        <tr>
          <td width="4%" height="21" class="tableBdr1" style=" padding:0px; border-left:0px; border-right:0px; border-top:0px;">&nbsp;</td>
          <td width="10%" height="21" nowrap="" class="tabLeftBgSel" ><b>
            <fmt:message key='webclient.topo.objectdetails.devicedetails'/>
            </b></td>
          <c:choose>
          <c:when test="${modifyObject == 'true'}">
          <td width="86%" height="21" class="tableBdr1" style="border-right:0px; border-top:0px; border-left:0px; text-align:right; padding:0px;"><div id="edittoggle">&nbsp;<img class="pointer" title="<fmt:message key='webclient.topo.modetails.edit'/>" id="edit" onClick="javascript:hidediv1('devicedetail_edit','devicedetail','null1')" src="/webclient/common/images/edit1.gif" width="16" height="15"></div></td>
          </c:when>
          <c:otherwise>
          <td width="86%" height="21" class="tableBdr1" style="border-right:0px; border-top:0px; border-left:0px; text-align:right; padding:0px;">&nbsp;</td>
          </c:otherwise>
          </c:choose>
        </tr>
        <tr>
          <td colspan="3" class="tableBdr1" style="border-top:0px; padding:0px;"><div id="devicedetail">
              <tiles:insert attribute="DeviceDetails_2"/>
            </div>
            <div id="devicedetail_edit"style="display:none;">
              <tiles:insert attribute="EditDeviceDetails_2"/>
            </div>
            <tiles:insert attribute="RecentAlarms"/>          </td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td width="45%">&nbsp;</td>
  </tr>
  <c:choose>
    <c:when test="${ObjectDetailsBean.map.type eq 'Port'}">
      <tr>
        <td height="40" colspan="2" valign="bottom"  class="MODisplayNameClassCol1"><fmt:message key='webclient.topo.objectdetails.graphs'/></td>
        <%--<td valign="bottom"  class="MODisplayNameClassCol1" style="text-align:right; "><img src="/webclient/common/images/more_graphs_icon.gif" width="21" height="21"><a  style="cursor:pointer; " onclick=Javascript:showElement("showgraph")>More Graphs</a></td>--%>
        <td width="55%" valign="bottom"  class="MODisplayNameClassCol1" style="text-align:right; ">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3"><div id="prtgrphs">
            <tiles:insert attribute="Graphs"/>
          </div></td>
      </tr>
    </c:when>
  </c:choose>
</table>

<div id="canceltoggle" style="display:none;" >&nbsp;<img class="pointer" title="<fmt:message key='webclient.topo.modetails.cancel'/>" id="cncl" onClick="javascript:hidediv1('devicedetail','devicedetail_edit','cancel')" src="/webclient/common/images/cancelIcon.gif" width="16" height="15"></div>
<div id="edittoggle1" style="display:none;">&nbsp;<img class="pointer" title="<fmt:message key='webclient.topo.modetails.edit'/>" id="edit" onClick="javascript:hidediv1('devicedetail_edit','devicedetail','null1')" src="/webclient/common/images/edit1.gif" width="16" height="15"></div>
</body>
</html>
