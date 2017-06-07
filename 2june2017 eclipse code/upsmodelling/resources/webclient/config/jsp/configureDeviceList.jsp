<%-- $Id: configureDeviceList.jsp,v 1.3 2010/10/29 13:47:05 swaminathap Exp $ --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/config/jspf/taskconfig.jspf" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script type="text/javascript" src="/webclient/config/js/taskconfig.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script type="text/javascript" src="/webclient/config/js/config.js"></script>
<title><fmt:message key="webclient.config.dl.form.title"/></title>
<link href="css/SteelBlue/style.css" rel="stylesheet" type="text/css">
</head>
<body onload="constructDeviceListTable('snmp')">
<form name="dlForm" method="POST" action='/config/TaskAction.do?'>
<input type="hidden" name="device" value=""/>
<input type="hidden" name="deviceList" value=""/>
<input type="hidden" name="dlNames" value=""/>
<input type="hidden" name="newdlName" value=""/>
<input type="hidden" name="deviceattr" value=""/>
<input type="hidden" name="toggleAllDevices" value=""/>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
      <td nowrap="nowrap"><h1><fmt:message key="webclient.config.dl.form.title"/></h1></td>
    </tr>
  </tbody>
</table>
<table class="greyboxStyle1" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:5px;"><table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
            <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
          </tr>
          <tr>
            <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td style="padding:4px 8px 4px 8px;" valign="top" class="whiteBg">
              <table style="margin-top:10px;clear:both" width="100%" cellspacing="0" cellpadding="3" border="0" align="left">
                <tbody>
                  <tr>
			  <td valign="top" nowrap="nowrap" width="10%"><span class="boldTxt"><fmt:message key="webclient.config.dl.protocol"/></span> :</td>
                    <td valign="top" align='left'>
                    <select name="protocol" onchange="javascript:constructDeviceListTable(this.options[this.options.selectedIndex].value)">
                        <option value='snmp'><fmt:message key="webclient.config.task.form.protocol.snmp"/></option>
                        <option value='telnet'><fmt:message key="webclient.config.task.form.protocol.telnet"/></option>
                        <option value='tl1'><fmt:message key="webclient.config.task.form.protocol.tl1"/></option>
                        <option value='ftp'><fmt:message key="webclient.config.task.form.protocol.ftp"/></option>
			<option value='tftp'><fmt:message key="webclient.config.task.form.protocol.tftp"/></option>
                      </select>
                      &nbsp;<img align="absmiddle" class="helpIcon" border="0" src="/webclient/common/images/spacer.gif"/></td>
                  </tr>
                </tbody>
              </table>
              <table style="clear:both;margin-bottom:6px;margin-top:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="rowSeparator">
			<td><span class="boldTxt"><fmt:message key="webclient.config.dl.list"/> :</span>&nbsp;&nbsp;&nbsp;<span class="blueLink"><img align="absmiddle" class="addIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:addNewDl()"><fmt:message key="webclient.config.dl.add"/></a></span></td><td align='right'><span class="boldTxt"><fmt:message key='webclient.config.add.device.title'/> :</span>&nbsp;&nbsp;<input type='text' name='newDevice' value=''>&nbsp;&nbsp;<input type='button' class='button' value="<fmt:message key='webclient.config.add.device.button'/>" onClick="javascript:addDevice()">&nbsp;&nbsp;|&nbsp;<img align="absmiddle" class="searchIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:openNewWindow('/topo/deviceAdvancedSearch.do?ComplexSearchView=Topology&searchType=dlSearch&viewId=Network Database.CompleteView&ORNotSupported=true&searchAction=deviceAdvancedSearch.do','<fmt:message key='webclient.config.task.executeform.searchtitle'/>','scrollbars=no,width=550,height=200,screenX=300,screenY=200')"><span class="blueLink"><fmt:message key="webclient.config.add.device.search"/></span></a></td>
                </tr>
              </table>
                <div id="deviceLists" class="tableBdr2" style="display:none;overflow:auto;">
		</div>
		<div id="generaldc" style="display:none; position:absolute; top:250px; left:350px; border:1px dotted #000; background-color:white;"/>
	    </td>
            <td class="alarmLeftBdrRight"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
          </tr>
          <tr>
            <td class="generalCurveLeftBot"><img height="5" width="5" src="/webclient/common/images/corner2-4.gif"/></td>
	    <td class="alarmLeftBdrBottom"><img height="5" width="5" src="/webclient/common/images/spacer.gif"/></td>
	    <td class="generalCurveRightBot"><img height="5" width="5" src="/webclient/common/images/corner2-3.gif"/></td>
          </tr>
        </tbody>
      </table></td>
  </tr>
</table>
<table style="margin-top:15px;clear:both" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><input type="button" value="<fmt:message key='webclient.config.dl.save'/>" class="button" name="Submit" onclick="javascript:updateDL()"/>&nbsp;&nbsp;<input type="button" value="<fmt:message key='webclient.config.dl.reset'/>" class="button" name="Submit" onclick="document.dlForm.reset();"/>&nbsp;&nbsp;<input type="button" value="<fmt:message key='webclient.config.dl.cancel'/>" class="button" name="Submit" onclick="javascript:history.back()"/>
  </tr>
</table>
		<div id="newDL" style="display:none; position:absolute; top:173px; left:260px; background-color:white;"/>
</form>
</body>
</html>
