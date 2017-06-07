<%-- $Id: AssociateWidgetForm.jsp,v 1.2 2010/10/29 13:47:08 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/treeSelection.js"></SCRIPT>
<script language="javascript" src="/webclient/common/js/importxml.js" type="text/javascript"></script>

<body>



<div class="popBdr1 popupGBg1" style="width:550px; z-index:100;display:none;" id="test2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:3px;"><table class="hRule1" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="27" class="boldTxt">&nbsp;&nbsp;<fmt:message key ='webclient.home.dashboards.associateWidget.title'/></td>
          <td align="right" valign="top"><img align="absmiddle" class="popClose1" src="/webclient/common/images/spacer.gif"/onclick="javascript:closeThisDiv('test2')"></td>
        </tr>
      </table>
<form name="associateForm" method="post" action="/associateWidget.do?method=associate" onsubmit="return checkWidgetSelected('Id','<fmt:message key="webclient.dashboard.addWidget.notselected"/>');">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="padding:10px;"><table style="clear:both;margin-bottom:5px;margin-top:5px;" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%" nowrap style="padding-right:5px;"><span class="boldTxt"><fmt:message key ='webclient.home.dashboards.associateWidget.form.label.selectdashboard'/></span>

</td><td>

                  <select style="width:200px;" name="select">
<c:forEach var="dashboards" items="${dashIdVsName}">
<c:if test='${currentDashboard != dashboards.key}'>
<option value="<c:out value='${dashboards.key}'/>"><fmt:message key="${dashboards.value}"/></option>
</c:if>
<c:if test='${currentDashboard == dashboards.key}'>
<option value="<c:out value='${dashboards.key}'/>" selected><fmt:message key="${dashboards.value}"/></option>
</c:if>
</c:forEach>
                  </select></td>
              </tr>
            </table>

            <table width="100%" cellspacing="0" cellpadding="0" border="0">
              <tbody>
                <tr>
                  <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
                  <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                  <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
                </tr>
                <tr>
                  <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                  <td style="padding:1px;" valign="top" class="whiteBg">

<table width="100%" style="clear:both;" cellspacing="0" cellpadding="2" border="0" align="left" >
                      <tbody>
                        <tr class="generalTBHeader">
                          <td width="5" ><input type="checkbox" name="checkwidgets" onClick="javascript:selectAll('checkwidgets','Id')"/></td>
                          <td ><fmt:message key ='webclient.home.dashboards.associateWidget.form.tableheader'/></td>
                        </tr>
                      </tbody>
                    </table>

                    <div style="overflow:auto; height:200px;clear:both;">
		    <table  width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
                        <tbody>
<c:forEach var="widgets" items="${widgetsVector}" varStatus="status">

<c:if test="${status.count % 2 != 0}">

	<tr class="generalEvenRow" onMouseOut="this.className='generalEvenRow'" onMouseOver="this.className='generalHover'">
</c:if>
<c:if test="${status.count %2 ==0}">
	<tr class="generalOddRow" onMouseOut="this.className='generalOddRow'" onMouseOver="this.className='generalHover'">
</c:if>
<td width="5"><input type='checkbox' name='Id' value="<c:out value='${widgets.ID}'/>" onClick="javascript:checkSelected('checkwidgets','Id');"></td>
	<td><fmt:message key="${widgets.NAME}"/></td>
                          </tr>
</c:forEach>
                        </tbody>
                      </table>
</div>
</td>
                  <td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/images/spacer.gif"/></td>
                </tr>
                <tr>
                  <td class="generalCurveLeftBot"><img height="1" width="1" src="/webclient/common/images/corner2-4.gif"/></td>
                  <td class="alarmLeftBdrBottom"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
                  <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
                </tr>
              </tbody>
            </table>

           <table style="margin-top:15px;" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="center"><input type="submit" value="<fmt:message key ='webclient.home.dashboards.associateWidget.form.button.addwidget'/>" class="button" name="Submit"/>
                  <input type="button" value="<fmt:message key ='webclient.home.dashboards.associateWidget.form.button.cancel'/>" class="button" name="cancel" onclick="javascript:closeThisDiv('test2')"/></td>
              </tr>
            </table>
</td>
        </tr>
      </table></td>
  </tr>
</table>

</form>
</div>
</body>
</html>
