<%-- $Id: AddDeviceList.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/config/jspf/deviceList.jspf" %>
<%@include file="/webclient/config/jspf/taskconfig.jspf" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script type="text/javascript" src="/webclient/config/js/taskconfig.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/dashboard.js"></script>
<script language="javascript" src="/webclient/config/js/config.js"></script>

<title><fmt:message key="webclient.config.dl.form.title"/></title>
</head>
<body>
<form name="dlForm" method="POST" action='/config/DeviceListAction.do?actionToPerform=updateDeviceList'>
<input type="hidden" name="deviceattr" value="<c:out value='${deviceattr}'/>"/>
<input type="hidden" name="redirectURL" value="/config/DeviceListAction.do?actionToPerform=getDeviceLists" />
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
<c:choose>
<c:when test='${isEdit ne true}'>
      <td nowrap="nowrap"><h1><fmt:message key="webclient.config.dl.form.title"/></h1></td>
</c:when>
<c:otherwise>
      <td nowrap="nowrap"><h1><fmt:message key="webclient.config.dl.form.modify.title"/></h1></td>
</c:otherwise>
</c:choose>
    </tr>
  </tbody>
</table>
<div class="popBdr1 popupGBg1" style="width:550px; z-index:100;display:none;" id='helpDiv'>
<%@include file="/webclient/common/jspf/HelpDialog.jspf" %>
</div>
<table id='positionId' width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr>
      <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
      <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
      <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
    </tr>
    <tr>
      <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
      <td style="padding:4px 8px 4px 8px;" valign="top" class="whiteBg"><table style="margin-top:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
          <tbody>
            <tr>
              <td width="10%" nowrap="nowrap"><fmt:message key='webclient.config.add.device.label.listname'/>  :</td>
<c:choose>
<c:when test='${isEdit ne true}'>

	<td><input style="width:200px;" type="text" class="formstyle" value="<c:out value='${dlName}'/>" name="deviceList"/>
                <sup class="mandatory">*</sup></td>
            </tr>
</c:when>
<c:otherwise>

              <td><input style="width:200px;" type="text" class="disabledBg" value="<c:out value='${dlName}'/>" readonly name="deviceList"/>
                <sup class="mandatory">*</sup></td>
            </tr>
</c:otherwise>
</c:choose>
<%
if(request.getParameter("protocol")!=null)
{
%>
           <tr>
              <td nowrap="nowrap"><fmt:message key="webclient.config.dl.protocol"/> :</td>
              <td><input style="width:200px;" type="text" readonly class="disabledBg" value="<c:out value='${protocol}'/>" name="protocol">                &nbsp;<a href="javascript:displayHelpMsg(document.dlForm.protocol.value)"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif"/></a></td>
            </tr>
<%
}
else
{
%>
            <tr>
              <td nowrap="nowrap"><fmt:message key="webclient.config.dl.protocol"/> :</td>
              <td><select style="width:203px;" name="protocol"><c:out value='${protocol}'/>
	      <option value='snmp'><fmt:message key="webclient.config.task.form.protocol.snmp"/></option>
	      <option value='telnet'><fmt:message key="webclient.config.task.form.protocol.telnet"/></option>
	      <option value='tl1'><fmt:message key="webclient.config.task.form.protocol.tl1"/></option>
	      <option value='ftp'><fmt:message key="webclient.config.task.form.protocol.ftp"/></option>
	      <option value='tftp'><fmt:message key="webclient.config.task.form.protocol.tftp"/></option>
                </select>
                &nbsp;<a href="javascript:displayHelpMsg(document.dlForm.protocol.value)"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif"/></a></td>
            </tr>
<%
}
%>

            <tr>
              <td nowrap="nowrap"><fmt:message key='webclient.config.add.device.label.name'/> :</td>
              <td><input value="" style="width:200px;" type="text" name="newDevice"/>
	      <a href="javascript:addDeviceName()"><img border="0" align="absmiddle" title="<fmt:message key='webclient.config.dl.add.title'/>" src="/webclient/common/images/spacer.gif" class="addIcon"/></a>&nbsp;<a href="javascript:addDeviceName()"><fmt:message key="webclient.config.dl.add"/></a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="javascript:openSearch('dlSearch');"><img border="0" align="absmiddle" src="/webclient/common/images/spacer.gif" class="searchIcon"/></a>&nbsp;<a href="javascript:openSearch('dlSearch');"><span class="blueLink"><fmt:message key="webclient.config.add.device.search"/></span></a> &nbsp;&nbsp;&nbsp;<span class="brownTxt"><fmt:message key='webclient.config.add.device.text'/></span></td>
            </tr>
          </tbody>
        </table>



        <table style="clear:both; margin-top: 10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><table width="100%" cellspacing="0" cellpadding="0" border="0" style="clear: both;margin-bottom: 4px;">
                <tr  class="rowSeparator">
                  <td><span class="boldTxt"><fmt:message key='webclient.config.add.device.title'/></span></td>
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

<%--start--%>
<input type=hidden value="<c:out value='${deviceattr}'/>" name="attribs"/>

<c:choose>
<c:when test="${!empty details}">
<div id="addedDevices" style="display:;">
<div id='replaceDiv' style='display:none;width:500px;'>&nbsp;</div>

<table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
<tr class="generalTBHeader">
<td nowrap="nowrap">&nbsp;</td>
<td nowrap="nowrap" class="w">&nbsp;</td>
<td width="40%" nowrap="nowrap"><fmt:message key="webclient.config.add.device.table.device"/></td>
<td width="15%" nowrap="nowrap"><fmt:message key="webclient.config.add.device.table.port"/></td>
<td width="15%" nowrap="nowrap"><fmt:message key="webclient.config.add.device.table.retries"/></td>
<td width="30%" nowrap="nowrap"><fmt:message key="webclient.config.add.device.table.timeout"/></td>
</tr>
<%--table content--%>
<c:forEach var="devName" items="${details}" varStatus="i">
	<c:choose>
	<c:when test="${i.count%2==0}">
		<tr id="<c:out value='${devName.NAME}'/>" class="generalEvenRow" onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'">
	</c:when>
	<c:otherwise>
		<tr id="<c:out value='${devName.NAME}'/>" class="generalOddRow" onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'">
	</c:otherwise>
	</c:choose>

		<td style="padding-right:6px;padding-left:6px;"><a href="javascript:showDeviceAttribs('dlForm','<c:out value="${devName.NAME}"/>','replaceDiv','addedDevices',550)"><img src="/webclient/common/images/spacer.gif" border="0" align="absmiddle" class="editIcon" title="<fmt:message key='webclient.config.manage.device.title.edit'/>"/></a></td>
		<td style="padding-right:6px;"><a href="javascript:deleteDevice('<c:out value="${devName.NAME}"/>');"><img src="/webclient/common/images/spacer.gif" border="0" align="absmiddle" class="deleteIcon" title="<fmt:message key='webclient.config.manage.device.title.delete'/>"/></a></td>
		<td style="padding-right:6px;" nowrap="nowrap" ><c:out value="${devName.NAME}"/></td>
		<td style="padding-right:6px;" nowrap="nowrap" ><div id='<c:out value="${devName.NAME}"/>Port'><c:out value="${devName.PORT}"/></div></td>
		<td style="padding-right:6px;" nowrap="nowrap" ><div id='<c:out value="${devName.NAME}"/>Retries'><c:out value="${devName.RETRIES}"/></div></td>
		<td style="padding-right:6px;" nowrap="nowrap" ><div id='<c:out value="${devName.NAME}"/>Timeout'><c:out value="${devName.TIMEOUT}"/></div></td>
		<input type="hidden" name="devices" value="<c:out value='${devName.NAME}'/>">
	</tr>
</c:forEach>

</table>
</div>

<div id="noaddedDevices" style='display:none;'>
</c:when>
<c:otherwise>
<div id="noaddedDevices" style='display:;'>

</c:otherwise>
</c:choose>

<table  width="100%" cellspacing="0" cellpadding="3" border="0" align="center" style="margin-top: 7px; margin-bottom: 7px;">
<tr>    
 <td nowrap="" valign="middle" align="center" class="configParams" style="padding-left: 10px;">
<div style="padding: 3px; text-align: center;">
<fmt:message key ='webclient.config.dlForm.nodevices'/>
</div>
</td>
</tr>
</table>
</div>

<%-- End --%>


</td>
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
<table style="margin-top:15px;" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><input type="submit" value="<fmt:message key='webclient.config.add.device.button.add'/>" class="button" name="Submit" onClick='return checkDevices();'/>
      &nbsp;&nbsp;
      <input type="button" value="<fmt:message key='webclient.config.add.device.button.cancel'/>" onclick="javascript:window.location='/config/DeviceListAction.do?actionToPerform=getDeviceLists';" class="button" name="Submit"/></td>
  </tr>
</table>

</form>
</body>
</html>
