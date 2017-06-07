<%-- $Id: DashboardList.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/HomePageFunctions.jspf" %>
<html>
<script language="javascript" src="/webclient/common/js/importxml.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/dashboard.js" type="text/javascript"></script>
<script>
var browser_ie=false;
var popDivEle;
var popFrame;
function browser_detection(){
	if (document.all){
		browser_ie=true;
	}
}
</script>
<div class="popBdr1 popupGBg1" style="width:600px;z-index:100;display:none;" id="addDashboard">
<div id="replaceDiv">&nbsp;</div>
</div>
<div id="popUpDiv"></div>
</div>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
       <td width="5%"><h1><a href="/mainLayout.do"><fmt:message key ='webclient.home.dashboards.manageDashboards.link.home'/></a>&nbsp;-</h1></td>
<td nowrap="nowrap"><h1><fmt:message key ='webclient.home.dashboards.manageDashboards.title'/></h1></td>
    </tr>
  </tbody>
</table>

<div class="popBdr1 popupGBg1" style="width:550px; z-index:100;display:none;" id='helpDiv'>
<%@include file="/webclient/common/jspf/HelpDialog.jspf" %>
</div>


<table id='popUpPosition' width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><table width="100%" cellspacing="0" cellpadding="0" border="0">
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
                  <td><span class="blueLink"><img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif"/> <a href="#" onClick="javascript:deleteSelected()"><fmt:message key ='webclient.home.dashboards.manageDashboards.title.deleteselected'/></a></span>&nbsp;&nbsp;|&nbsp;&nbsp;<span class="blueLink"><img align="absmiddle" class="addIcon" src="/webclient/common/images/spacer.gif"/> <a onclick="addDashboard('popUpPosition', 'addDashboard', 600,'replaceDiv');" style="cursor:pointer" href="javascript:void(0);"><fmt:message key ='webclient.home.dashboards.manageDashboards.adddashboard'/></a>
&nbsp;&nbsp;&nbsp;<a href="javascript:showHelpDialog('<b><fmt:message key="webclient.helpcard.dashboard.title"/></b>&nbsp;<fmt:message key="webclient.helpcard.dashboard.description"/><br><br><b><fmt:message key="webclient.helpcard.dashboard.addoperation"/>&nbsp;</b><fmt:message key="webclient.helpcard.dashboard.addoperation.description"/><br><br><b><fmt:message key="webclient.helpcard.dashboard.deleteoperation"/>&nbsp;</b><fmt:message key="webclient.helpcard.dashboard.deleteoperation.description"/><br><br><b><fmt:message key="webclient.helpcard.dashboard.modifyoperation"/>&nbsp;</b><fmt:message key="webclient.helpcard.dashboard.modifyoperation.description"/><br><br><b><fmt:message key="webclient.helpcard.widget"/>&nbsp;</b><fmt:message key="webclient.helpcard.widget.description"/>','popUpPosition',550)"><img border="0" align="absmiddle" src="/webclient/common/images/spacer.gif" class="helpIcon"/></a>
</td>
                </tr>
              </table>
              <table style="clear:both;" id="test1" class="tableBdr2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td><table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
                      <tbody>
                        <tr class="generalTBHeader">
                          <td width="1%"><input type="checkbox" name="checkbox" value="checkbox" onClick="javascript:selectAll('checkbox','dashcheckbox')"></td>
                          <td width="1%">&nbsp;</td>
                          <td width="1%">&nbsp;</td>
                          <td width="25%"><fmt:message key ='webclient.home.dashboards.manageDashboards.tableheader.name'/></td>
                          <td ><fmt:message key ='webclient.home.dashboards.manageDashboards.tableheader.description'/></td>
                        </tr>
			<c:forEach var="details" items="${Details}" varStatus="status">

<c:if test="${status.count%2!=0}">
                        <tr class="generalEvenRow" onMouseOut="this.className='generalEvenRow'" onMouseOver="this.className='generalHover'">
</c:if>
<c:if test="${status.count%2==0}">
                        <tr class="generalOddRow" onMouseOut="this.className='generalOddRow'" onMouseOver="this.className='generalHover'">
</c:if>
<td style="padding-right:10px;"><input type="checkbox" id="<c:out value='${details.ID}'/>"  name="dashcheckbox" value="<c:out value='${details.ID}'/>" onClick="javascript:checkSelected('checkbox','dashcheckbox');"></td>
<td style="padding-right:10px;"><img align="absmiddle" class="editIcon" src="/webclient/common/images/spacer.gif" onclick="editDashboard('popUpPosition', 'addDashboard', 600,<c:out value='${details.ID}'/>,'replaceDiv');" title="<fmt:message key='webclient.home.managedashboards.edit'/>"/></td>
<td style="padding-right:10px;"><img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif" onClick="javascript:deleteDashboard('<c:out value="${details.ID}"/>');" title="<fmt:message key='webclient.home.managedashboards.delete'/>"/></td>
<td ><a href="/home/Homepage.do?selectedTab=Home&viewId=Home&displayName=Home&dashboardId=<c:out value='${details.ID}'/>"><fmt:message key='${details.NAME}'/></a></td>
<c:choose>
<c:when test='${details.DESCRIPTION != ""}'>
<td ><fmt:message key='${details.DESCRIPTION}'/></td>
</c:when>
<c:otherwise>
<td >&nbsp;</td>
</c:otherwise>
</c:choose>
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
      </table></td>
  </tr>
</table>
</html>
