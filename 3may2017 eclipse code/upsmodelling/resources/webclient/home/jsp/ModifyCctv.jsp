<%-- $Id $ --%>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/common/jspf/HomePageFunctions.jspf" %>
<html>
<head>
<script language="javascript" src="/webclient/common/js/dashboard.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/importxml.js" type="text/javascript"></script>
<script language="javascript">
function callNewWindow(x)
{
url="/Recite.do?cctvId="+x;
window.open(url,"_blank","fullscreen=yes,menubar=no,resizable=no,status=no,toolbar=no,replace=false,scrollbars=yes");
}
</script>
</head>
<body>
<%
boolean isCctv=false;
long associationId =-1;
long dashboardId = -1;
String methodValue = request.getParameter("method");
Object modifyValue = request.getAttribute("modifyCctvViews");

if(methodValue.equals("addModifyCctvView") || methodValue.equals("deleteCctv") || methodValue.equals("showCctvList"))
{
%>
<div class="popBdr1 popupGBg1" style="width:600px;z-index:100;display:none;" id="addCctv">
<div id="replaceDiv">&nbsp;</div>
</div>

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
       <td width="5%"><h1><a href="/mainLayout.do"><fmt:message key = 'webclient.home.dashboard.manageCctv.link.home'/></a>&nbsp;-</h1></td>
      <td nowrap="nowrap"><h1><fmt:message key='webclient.home.dashboard.manageCctv.title'/></h1></td>
    </tr>
  </tbody>
</table>




<div class="popBdr1 popupGBg1" style="width:550px; z-index:100;display:none;" id='helpDiv'>
<%@include file="/webclient/common/jspf/HelpDialog.jspf" %>
</div>

<table id="popDivPosition" width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
            <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
          </tr>
          <tr>
            <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td style="padding:4px 8px 4px 8px;" valign="top" class="whiteBg"><div id="cctvList">
              <table style="clear:both;margin-bottom:6px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><span class="blueLink"><img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif"/> <a href="#" onclick="javascript:deleteAllCctv()"><fmt:message key ='webclient.home.dashboard.manageCctv.deleteselected'/></a></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="blueLink"><img align="absmiddle" class="addIcon" src="/webclient/common/images/spacer.gif"/> <a onclick="showAddCctv('popDivPosition','addCctv',600,'replaceDiv');" style="cursor:pointer" href="javascript:void(0);"><fmt:message key ='webclient.home.dashboard.manageCctv.addcctv'/></a>&nbsp;&nbsp;&nbsp;<a href="javascript:showHelpDialog('<b><fmt:message key="webclient.helpcard.cctv.title"/></b>&nbsp;<fmt:message key="webclient.helpcard.cctv.description"/><br><br><b><fmt:message key="webclient.helpcard.cctv.addoperation"/>&nbsp;</b><fmt:message key="webclient.helpcard.cctv.addoperation.description"/><br><br><b><fmt:message key="webclient.helpcard.cctv.deleteoperation"/>&nbsp;</b><fmt:message key="webclient.helpcard.cctv.deleteoperation.description"/><br><br><b><fmt:message key="webclient.helpcard.cctv.modifyoperation"/>&nbsp;</b><fmt:message key="webclient.helpcard.cctv.modifyoperation.description"/>','popDivPosition',550)"><img border="0" align="absmiddle" src="/webclient/common/images/spacer.gif" class="helpIcon"/></a></td>
                </tr>
              </table>
              <table style="clear:both;" id="test1" class="tableBdr2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
                      <tbody>
                        <tr class="generalTBHeader">
                          <td width="1%"><input type="checkbox" name="headercheck" value="checkbox" onClick="javascript:selectAll('headercheck','cctvCheck');"></td>
                          <td width="1%">&nbsp;</td>
                          <td width="1%">&nbsp;</td>
                          <td width="25%"><fmt:message key ='webclient.home.dashboard.manageCctv.tableTitle.name'/></td>
                          <td ><fmt:message key ='webclient.home.dashboard.manageCctv.tableTitle.description'/></td>
                          <td ><fmt:message key ='webclient.home.dashboard.manageCctv.tableTitle.refreshInterval'/></td>
                        </tr>
<c:forEach items="${cctvs}" var="associatedDashId" varStatus="status">

<c:if test="${status.count%2!=0}">

                        <tr class="generalEvenRow" onMouseOut="this.className='generalEvenRow'" onMouseOver="this.className='generalHover'">
</c:if>
<c:if test="${status.count%2==0}">
                        <tr class="generalOddRow" onMouseOut="this.className='generalOddRow'" onMouseOver="this.className='generalHover'">
</c:if>
                          <td style="padding-right:10px;"><input type="checkbox" name="cctvCheck" onclick="javascript:checkSelected('headercheck','cctvCheck')" value="<c:out value='${associatedDashId.ID}'/>"></td>
                          <td style="padding-right:10px;"><img align="absmiddle" class="editIcon" src="/webclient/common/images/spacer.gif" onclick="javascript:editCctv('popDivPosition','addCctv',600,'<c:out value="${associatedDashId.ID}"/>','replaceDiv');" /></td>
                          <td style="padding-right:10px;"><img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif" onclick="javascript:deleteCctv('<c:out value="${associatedDashId.ID}"/>');"/></td>
                          <td ><a href="/Recite.do?cctvId=<c:out value='${associatedDashId.ID}'/>" onclick="javascript:callNewWindow('<c:out value="${associatedDashId.ID}"/>');return false;"><fmt:message key="${associatedDashId.NAME}"/></a></td>
<c:choose>
<c:when test='${associatedDashId.DESCRIPTION !=""}'>
                          <td ><fmt:message key="${associatedDashId.DESCRIPTION}"/></td>
</c:when>
<c:otherwise>
                          <td >&nbsp;</td>
</c:otherwise>
</c:choose>
                          <td ><c:out value="${associatedDashId.TIMEINTERVAL}"/></td>
                        </tr>
</c:forEach>
                      </tbody>
                    </table></td>
                </tr>
              </table></td>
            <td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
          </tr>
          <tr>
            <td class="generalCurveLeftBot"><img height="1" width="1" src="/webclient/common/images/corner2-4.gif"/></td>
            <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
          </tr>
        </tbody>
      </table>

<div id="popUpDiv">&nbsp;</div>

<%
}
else
{
String title ="Add";
if(methodValue.equals("modifyCctvView"))
{
	title="Modify";
}
isCctv =(Boolean) request.getAttribute("isCctv");
HashMap<Long,String> dashboardDetail = (HashMap <Long,String>)request.getAttribute("dashboardDetail");
if(isCctv)
{

%>


<form name="addCctvForm" method="post" action="/associateWidget.do?method=addModifyCctvView">

<table cellspacing="0" cellpadding="0" border="0" width="100%">
  <tbody><tr>
    <td style="padding: 3px;">
    <table cellspacing="0" cellpadding="0" border="0" width="100%" class="hRule1">
        <tbody><tr>
          <td height="27" class="boldTxt">
<%
if(title.equals("Add"))
{
%>
<fmt:message key ='webclient.home.dashboard.addModifyCctv.title.add'/>
<%
}
else
{
%>
<fmt:message key ='webclient.home.dashboard.addModifyCctv.title.modify'/>
<%
}
%>
</td>
          <td align="right" valign="top">
    <img align="absmiddle" class="popClose1" src="/webclient/common/images/spacer.gif" title="<fmt:message key='webclient.home.managecctv.close'/>" onclick="javascript:closeThisDiv('addCctv')"/></td>
        </tr>
      </tbody>
</table>
      <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tbody><tr>
          <td valign="top" style="padding: 10px;">
    <table cellspacing="0" cellpadding="0" border="0" width="100%">
        <tbody>
          <tr>
            <td width="5"><img width="5" height="5" src="/webclient/common/images/corner2-1.gif"/></td>
            <td align="left" valign="top" nowrap="nowrap" class="alarmLeftBdrTop"><img width="1" height="1" src="/webclient/common/images/spacer.gif"/></td>
            <td width="5" height="5"><img width="5" height="5" src="/webclient/common/images/corner2-2.gif"/></td>
          </tr>
          <tr>
            <td class="alarmLeftBdrLeft"><img width="1" height="1" src="/webclient/common/images/spacer.gif"/></td>
            <td valign="top" class="whiteBg" style="padding: 4px 8px;">
        <table cellspacing="0" cellpadding="0" border="0" width="100%" style="clear: both; margin-bottom: 7px;">
                <tbody><tr class="rowSeparator">
                  <td class="boldTxt"><fmt:message key ='webclient.home.dashboard.addModifyCctv.subtitle'/></td>
                </tr>
              </tbody></table>
              <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tbody>
                  <tr>
                    <td width="60%" valign="top" style="padding: 2px;" class="tableBdr2">
                    <table style="clear:both" cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tbody><tr class="generalTBHeader">
                          <td class="boldTxt"><fmt:message key ='webclient.home.dashboard.addModifyCctv.header'/></td>
                        </tr>
                      </tbody>
</table>
<input type="hidden" name="redirect" value="/associateWidget.do?method=showCctvList">
              <table style="clear:both;margin-top:5px;" width="100%" cellspacing="0" cellpadding="3" border="0">
                <tr>
                  <td width="100" valign="middle" align="left"><fmt:message key ='webclient.home.dashboard.addModifyCctv.form.label.name'/><font color="red">&nbsp;*</font></td>
                  <td valign="middle" align="left">

<c:if test="${!modifyCctvViews}">
<input style="width: 100%" onfocus="this.className='inputFocusText'" class="textbox" type="text" name="cctvName"  value="<fmt:message key="${cctvDetails.NAME}"/>" maxlength="25" onblur="checkCctvExist('<fmt:message key='webclient.addCctvForm.cctvName.exists'/>');">
</c:if>

<c:if test="${modifyCctvViews}">
<input style="width: 100%;" class="disabledBg" readonly type="text" name="cctvName"  value="<fmt:message key="${cctvDetails.NAME}"/>">
</c:if>
</td>
</tr>
<tr><td></td><td>
<div style='display:none;' id='duplicateEntry'>&nbsp;</div>
</td>
                </tr>
                <tr>
                  <td valign="top" align="left"><fmt:message key ='webclient.home.dashboard.addModifyCctv.form.label.description'/></td>
<c:choose>
<c:when test='${cctvDetails.DESCRIPTION!=""}'>
                  <td valign="top" align="left"><textarea name="description" rows="4" style="width: 100%;" onFocus="this.className='inputFocusText'" onBlur="this.className='dateBox';"><fmt:message key="${cctvDetails.DESCRIPTION}"/></textarea>
                  </td>
</c:when>
<c:otherwise>
         <td valign="top" align="left"><textarea name="description" rows="4" style="width: 100%;" onFocus="this.className='inputFocusText'" onBlur="this.className='dateBox';"></textarea>
                  </td>
</c:otherwise>
</c:choose>
                </tr>
                <tr>
                  <td valign="top" align="left"><fmt:message key ='webclient.home.dashboard.addModifyCctv.form.label.refreshInterval'/><font color="red">&nbsp;*</font></td>
                  <td valign="top" align="left"><input maxlength="4" style="width:50px;" onfocus="this.className='inputFocusText'" onblur="this.className='dateBox';" class="textbox" type="text" name="timeInterval" value="<c:out value="${cctvDetails.TIMEINTERVAL}"/>" onkeypress="return checkIsNumeric(event)">
<fmt:message key ='webclient.home.dashboard.addModifyCctv.form.seconds'/>
                    </td>
                </tr>
              </table>

                      </td>
                  <td style="padding-left: 15px;"/>
                    <td width="40%" valign="top" style="padding: 2px;" class="tableBdr2">

<table style="clear:both" cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tbody><tr class="generalTBHeader">
                          <td class="boldTxt"> 
<fmt:message key ='webclient.home.dashboard.addModifyCctv.form.dashboardlist.title'/>
</td>
                        </tr>
                      </tbody>
</table>

                      <div style="overflow: auto; height: 200px; clear: both;">
<table style="clear:both" width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
                      <tbody>
                        <tr class="dgeneralTBHeader">
                          <td width="1%"><input type="checkbox" name="dashcheck" value="checkbox" onClick="javascript:selectAll('dashcheck','dashboards')"></td>
                          <td width="45%"><fmt:message key ='webclient.home.dashboard.addModifyCctv.form.dashboardlist.tableheader'/></td>
                        </tr>

<c:if test="${!modifyCctvViews}">

			<c:forEach var="dashId" items="${dashboardDetail}" varStatus="val">
			<c:if test="${(val.count%2) ==0}">
                        <tr class="generalEvenRow" onMouseOut="this.className='generalEvenRow'" onMouseOver="this.className='generalHover'">
			</c:if>
			<c:if test="${(val.count%2)!=0}">
			<tr class="generalOddRow" onMouseOut="this.className='generalOddRow'" onMouseOver="this.className='generalHover'">
			</c:if>
                          <td style="padding-right:10px;">
			  <input type="checkbox" name="dashboards" id="<c:out value='${dashId.key}_check'/>" onClick="javascript:checkSelected('dashcheck','dashboards')" value="<c:out value='${dashId.key}'/>">
			  </td>
                          <td ><fmt:message key="${dashId.value}"/></td>
                        </tr>
			</c:forEach>
</c:if>

<c:if test="${modifyCctvViews}">
<input type="hidden" name="cctvId" value="<c:out value="${cctvDetails.ID}"/>">
<c:forEach var="dashDetail" items="${selectedDash}" varStatus="val">

<c:if test="${(val.count%2) ==0}">
<tr class="generalEvenRow" onMouseOut="this.className='generalEvenRow'" onMouseOver="this.className='generalHover'">
</c:if>
<c:if test="${(val.count%2)!=0}">
<tr class="generalOddRow" onMouseOut="this.className='generalOddRow'" onMouseOver="this.className='generalHover'">
</c:if>

<c:choose>
<c:when test="${dashDetail.SELECT}">
<td style="padding-right:10px;"> <input type="checkbox" name="dashboards" id="<c:out value='${dashDetail.ID}_check'/>" onClick="javascript:checkSelected('dashcheck','dashboards')" value="<c:out value='${dashDetail.ID}'/>" checked></td><td><fmt:message key='${dashDetail.NAME}'/></td></tr>
</c:when>
<c:otherwise>
<td style="padding-right:10px;"> <input type="checkbox" name="dashboards" id="<c:out value='${dashDetail.ID}_check'/>" onClick="javascript:checkSelected('dashcheck','dashboards')" value="<c:out value='${dashDetail.ID}'/>"></td><td><fmt:message key='${dashDetail.NAME}'/></td></tr>
</c:otherwise>
</c:choose>
</c:forEach>
</c:if>
                      </tbody>
                    </table>
                      </div>
</td>
                  </tr>
                </tbody>
        </table>
</td>
            <td class="alarmLeftBdrRight"><img width="1" height="1" src="/webclient/common/images/spacer.gif"/></td>
          </tr>

          <tr>
            <td class="generalCurveLeftBot"><img width="1" height="1" src="/webclient/common/images/corner2-4.gif"/></td>
            <td class="alarmLeftBdrBottom"><img width="1" height="1" src="/webclient/common/images/spacer.gif"/></td>
            <td class="generalCurveRightBot"><img width="5" height="5" src="/webclient/common/images/corner2-3.gif"/></td>
          </tr>
        </tbody>
      </table>
<table cellspacing="0" cellpadding="0" border="0" width="100%" style="clear: both; margin-top: 8px;">
  <tbody>
<tr>
    <td align="center">

<input class="button" type="submit" name="modify" value="<fmt:message key ='webclient.home.dashboard.addModifyCctv.form.button.update'/>" onClick="javascript:return validateCctv();">
      <input class="button" type="button" name="cancel" value="<fmt:message key ='webclient.home.dashboard.addModifyCctv.form.button.cancel'/>" onClick="javascript:closeThisDiv('addCctv','popDivPosition'); return false;">

</td>
  </tr>
</tbody>
</table>
</td>
        </tr>
      </tbody></table></td>
  </tr>
</tbody></table>

</form>
<%
}
}
%>
</body>
</html>




