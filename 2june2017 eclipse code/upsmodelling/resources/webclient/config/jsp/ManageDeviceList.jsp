<%-- $Id: ManageDeviceList.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/config/jspf/deviceList.jspf" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script type="text/javascript" src="/webclient/config/js/taskconfig.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script type="text/javascript" src="/webclient/config/js/config.js"></script>
<title><fmt:message key="webclient.config.dl.form.title"/></title>
</head>
<body>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
      <td nowrap="nowrap"><h1><fmt:message key="webclient.config.manage.devicelist.title"/></h1></td>
      <td width="38%" nowrap="nowrap"><a class="blueLink" href="/config/AddDeviceList.do"><img border="0" align="absmiddle" src="/webclient/common/images/spacer.gif" class="addIcon"/></a>&nbsp;<a class="blueLink" href="/config/AddDeviceList.do"><fmt:message key="webclient.config.manage.devicelist.addnew"/></a></td>
    </tr>
  </tbody>
</table>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tbody>
    <tr>
      <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
      <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="images/spacer.gif"/></td>
      <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
    </tr>
    <tr>
      <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
      <td style="padding:1px;" valign="top" class="whiteBg">

<c:choose>
<c:when test="${!empty DeviceList}">
 <table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" >
          <tbody>
            <tr class="generalTBHeader">
              <td nowrap="nowrap">&nbsp;</td>
              <td nowrap="nowrap" class="w">&nbsp;</td>
              <td width="20%" nowrap="nowrap"><fmt:message key="webclient.config.add.device.table.header"/></td>
              <td width="15%" ><fmt:message key="webclient.config.manage.devicelist.table.protocol"/></td>
              <td width="15%" nowrap="nowrap" ><fmt:message key="webclient.config.manage.devicelist.table.count"/></td>
              <td width="50%" nowrap ><fmt:message key="webclient.config.manage.devicelist.table.tasks"/></td>
            </tr>
<c:forEach items="${DeviceList}" var="dlist" varStatus="increment">
<c:choose>
<c:when test="${increment.count % 2 ==0}">
            <tr class="generalEvenRow" onmouseout="this.className='generalEvenRow'" onmouseover="this.className='generalHover'">
</c:when>
<c:otherwise>
            <tr class="generalOddRow" onmouseout="this.className='generalOddRow'" onmouseover="this.className='generalHover'">
</c:otherwise>
</c:choose>

              <td style="padding-right:6px;padding-left:6px;"><a href="/config/DeviceListAction.do?actionToPerform=editDeviceList&dlName=<c:out value='${dlist.NAME}'/>&protocol=<c:out value='${dlist.PROTOCOL}'/>"><img src="/webclient/common/images/spacer.gif" border="0" align="absmiddle" class="editIcon" title="<fmt:message key='webclient.config.manage.devicelist.title.edit'/>"/></a></td>
              <td style="padding-right:6px;"><a href="javascript:deleteDL('<c:out value='${dlist.NAME}'/>');"><img src="/webclient/common/images/spacer.gif" border="0" align="absmiddle" class="deleteIcon" title="<fmt:message key='webclient.config.manage.devicelist.title.delete'/>"/></a></td>
              <td style="padding-right:6px;" nowrap="nowrap" ><a href="/config/DeviceListAction.do?actionToPerform=editDeviceList&dlName=<c:out value='${dlist.NAME}'/>&protocol=<c:out value='${dlist.PROTOCOL}'/>"><c:out value="${dlist.NAME}"/></a></td>
              <td style="padding-right:6px;"><c:out value="${dlist.PROTOCOL}"/></td>
              <td style="padding-right:6px;"><c:out value="${dlist.COUNT}"/></td>
              <td style="padding-right:6px;"><a href="javascript:openNewWindow('/config/TaskAction.do?actionToPerform=openAssociateDLForm&protocol=<c:out value="${dlist.PROTOCOL}"/>&dlName=<c:out value="${dlist.NAME}"/>','','scrollbars=no,width=500,height=300,top=250,left=300');" title='<fmt:message key="webclient.config.manage.devicelist.table.tasks"/>'><fmt:message key="webclient.config.manage.devicelist.title.assign"/></a></td>
            </tr>
</c:forEach>

          </tbody>
        </table>
</c:when>
<c:otherwise>
<table id='noaddedDevices' width="100%" cellspacing="0" cellpadding="3" border="0" align="center" style="margin-top: 7px; margin-bottom: 7px;">
<tr>    
 <td nowrap="" valign="middle" align="center" class="configParams" style="padding-left: 10px;">
<div style="padding: 3px; text-align: center;">
<fmt:message key ='webclient.config.manage.nodeviceList'/><a href="/config/AddDeviceList.do" class="bluelink boldTxt" style="cursor:pointer">&nbsp;<fmt:message key ='webclient.config.manage.devicelist.addnew'/></a>
</div>
</td>
</tr>
</table>

</c:otherwise>
</c:choose>

</td>
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
    <td align="center"><input type="submit" value="<fmt:message key='webclient.config.add.devicelist.button.cancel'/>" class="button" name="Submit" onclick="javascript:window.location='/config/TaskList.do?'"/></td>
  </tr>
</table>
</body>
</html>
