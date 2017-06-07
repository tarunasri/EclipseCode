<%-- $Id: taskForm.jsp,v 1.3 2010/10/29 13:47:05 swaminathap Exp $ --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/config/jspf/attrForm.jspf" %>
<%@include file="/webclient/config/jspf/taskconfig.jspf" %>
<%@include file="/webclient/config/jspf/deviceList.jspf" %>
<script type="text/javascript" src="/webclient/config/js/taskconfig.js"></script>
<script type="text/javascript" src="/webclient/config/js/config.js"></script>
<script language="Javascript" SRC="/webclient/common/js/DO.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/jquery-1.3.2.min.js"></script>
<script language="javascript" src="/webclient/common/js/dashboard.js"></script>


<script type="text/javascript">
	var dob = new DataObject();
	var tob = new DataObject();
	var resultxml;
	var resulttxt;
</script>
<title><fmt:message key="webclient.config.task.form.title"/></title>
<link href="css/SteelBlue/style.css" rel="stylesheet" type="text/css">
</head>
<body onload="init('<c:out value='${TaskForm.map.rollbackTask}'/>','<c:out value='${operation}'/>');document.TaskForm.taskName.focus();">
<html-el:form action="TaskAction.do" onsubmit="return saveTask();">
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
        <c:choose>
        <c:when test="${operation eq 'execute'}">
            <td><h1><fmt:message key="webclient.config.task.form.execute"/></h1></td>
        </c:when>
        <c:otherwise>
            <td><h1><fmt:message key="webclient.config.task.form.title"/></h1></td>
        </c:otherwise>
	</c:choose>
    </tr>
  </tbody>
</table> 
<%--
The below are the form attributes added to be handled in the js file.
--%>
<input type="hidden" name="overwrite" value="<c:out value='${TaskForm.map.overwrite}'/>"/>
<input type="hidden" name="attrXML" value="<c:out value='${TaskForm.map.attrXML}'/>"/>
<input type="hidden" name="tableXML" value="<c:out value='${TaskForm.map.tableXML}'/>"/>
<input type="hidden" name="dsp" value=""/>
<input type="hidden" name="device" value=""/>
<input type="hidden" name="deviceattr" value=""/>
<input type="hidden" name="actionToPerform" value=""/>
<input type="hidden" name="tableOID" value=""/>
<input type="hidden" name="oidVsLabel" value="<c:out value='${indexVslabels}'/>"/>
<%-- the below attribute is dummy here. since this is used from oid selector, its simply added as hidden--%>
<input type="hidden" name="isMultiplePolledData" value=""/>

<table class="greyboxStyle1" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:5px;"><table width="100%" cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td width="5"><img height="5" width="5" src="/webclient/common/images/corner2-1.gif"/></td>
            <td nowrap="nowrap" valign="top" align="left" class="alarmLeftBdrTop"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td height="5" width="5"><img height="5" width="5" src="/webclient/common/images/corner2-2.gif"/></td>
          </tr>
          <tr>
            <td class="alarmLeftBdrLeft"><img height="1" width="1" src="/webclient/common/images/spacer.gif"/></td>
            <td style="padding:4px 8px 4px 8px;" valign="top" class="whiteBg"><table style="clear:both" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="rowSeparator">
                  <td class="boldTxt"><fmt:message key="webclient.config.task.form.details"/> :</td>
		  <td class="blueLink" align="right" nowrap="nowrap"><sup class="mandatory">*</sup>&nbsp;<fmt:message key="webclient.perf.mandatory.message"/><div id="configDSLink"></div></td>
                </tr>
	</table>
<div id='positionId'></div>
<div class="popBdr1 popupGBg1" style="width:550px; z-index:100;display:none;" id='helpDiv'>
<%@include file="/webclient/common/jspf/HelpDialog.jspf" %>
</div>
	<table><tr><td class="divclas">
              <table style="margin-top:10px;clear:both" width="50%" cellspacing="0" cellpadding="3" border="0" align="left">
                <tbody>
                  <tr>
                    <td width="10%" valign="top" nowrap="nowrap"><fmt:message key="webclient.config.task.form.taskName"/> :</td>
	 <td valign="top"><html-el:text style="width:160px;" styleClass="inputBoxStyle" name="TaskForm" maxlength='50' property="taskName" readonly="${TaskForm.map.overwrite}"/>
                      <sup class="mandatory">*</sup></td>
                  </tr>
                  <tr>
                 <td valign="top" nowrap="nowrap"><fmt:message key="webclient.config.task.form.protocol"/> :</td>
		 <c:choose>
		    <c:when test="${TaskForm.map.overwrite eq 'false'}">
		<td><html-el:select style="width:160px;" styleClass="inputBoxStyle" name="TaskForm" property="protocol" onchange="javascript:setProtocol()">
                        <html-el:option value='snmp'><fmt:message key="webclient.config.task.form.protocol.snmp"/></html-el:option>
			<html-el:option value='telnet'><fmt:message key="webclient.config.task.form.protocol.telnet"/></html-el:option>
			<html-el:option value='tl1'><fmt:message key="webclient.config.task.form.protocol.tl1"/></html-el:option>
			<html-el:option value='ftp'><fmt:message key="webclient.config.task.form.protocol.ftp"/></html-el:option>
			<html-el:option value='tftp'><fmt:message key="webclient.config.task.form.protocol.tftp"/></html-el:option>
                      </html-el:select>
		      &nbsp;<a href="javascript:displayHelpMsg()"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif" border="0"/></a></td>
		    </c:when>
		    <c:otherwise>
		    <td><html-el:text style="width:160px;" styleClass="disabledBg" name="TaskForm" property="protocol" readonly="true"/>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:displayHelpMsg()"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif" border="0"></a></td>
		    </c:otherwise> 
		    </c:choose>
		</tr>
                  <tr>
                    <td valign="top" nowrap="nowrap"><fmt:message key="webclient.config.task.form.isTemplate"/> :</td><td valign="top">
                    <c:choose>
                    <c:when test="${TaskForm.map.overwrite eq 'false'}">
	    		<html-el:select style="width:160px;" styleClass="inputBoxStyle" name="TaskForm" property="isTemplate" >
                        <html-el:option value="true"><fmt:message key="webclient.config.task.form.isTemplate.true"/></html-el:option>
			<html-el:option value="false"><fmt:message key="webclient.config.task.form.isTemplate.false"/></html-el:option>
                      </html-el:select>
		    </c:when>
		    <c:otherwise>
			<html-el:text style="width:160px;" styleClass="disabledBg" name="TaskForm" property="isTemplate" readonly="true"/>
		    </c:otherwise>
		    </c:choose>
		  </td>
                  </tr>
                  <tr>
                    <td valign="top" nowrap="nowrap"><fmt:message key="webclient.config.task.form.desc"/> :</td>
                    <td valign="top"><html-el:textarea style="width:250px;" styleClass="inputBoxStyle" property="description" name="TaskForm" /></td>
                  </tr>
                </tbody>
</table></td>
<td class="tdclass"><div style="display:none;z-index:10;" id="xContent"></div></td></table>

	      <table style="clear:both;margin-bottom:6px;margin-top:10px;" width="100%" border="0" cellspacing="0" cellpadding="0" id="refAttrTable">
                <tr class="rowSeparator">
                  <td><a href="javascript:toggleTable(attrTable)"><img id="toggleImg_attrTable" align="absmiddle" border='0' src="/webclient/common/images/toggleIcon2.gif"/></a>&nbsp;<span class="boldTxt"><fmt:message key="webclient.config.task.form.attr.table"/> :</span><c:if test="${operation ne 'execute'}"> &nbsp;&nbsp;<a href="javascript:attrForm('-1')"><img align="absmiddle" border='0' class="addIcon" src="/webclient/common/images/spacer.gif"/>&nbsp;<span class="blueLink"><fmt:message key="webclient.config.task.form.attr.add"/></span></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="javascript:deleteAllAttr()"><img align="absmiddle" class="deleteIcon" border='0' src="/webclient/common/images/spacer.gif"/>&nbsp;<span class="blueLink"><fmt:message key="webclient.config.task.form.attr.delall"/></span></a></c:if></td>
                </tr>
		</table>
		<div id="attrTable" style="display:none;z-index:10;"></div>
		<c:if test="${TaskForm.map.protocol eq 'snmp'}">
                <table style="clear:both;margin-bottom:6px;margin-top:10px;" width="100%" border="0" cellspacing="0" cellpadding="0" id="refTabularAttr">
		<tr><td><div id="tableAttrTitle" style="display:none;z-index:10;"/></td></tr>
		<tr><td><div id="tableAttr" style="display:none;overflow:auto;z-index:10;"/></td></tr>
		</table>
		</c:if>
              <table style="clear:both;margin-bottom:6px;margin-top:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="rowSeparator" id='rbHelpId'>
		  <td><a href="javascript:toggleTable(rbTable)"><img align="absmiddle" id="toggleImg_rbTable" src="/webclient/common/images/toggleIcon2.gif" border='0'/></a>&nbsp;<span class="boldTxt"><fmt:message key="webclient.config.task.form.rollback.config"/> :</span> &nbsp;&nbsp;<a href="javascript:showHelpDialog('<fmt:message key="webclient.config.task.form.rollback.config.message"/>','rbHelpId',550);"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif" border="0"/></a></td>
                </tr>
              </table>
	      <div id="rbHelp" class="tableBdr2" style="display:none;left:33%;width:54%;position:absolute;background-color:white;z-index:10;"></div>
	      <div id="rbTable" style="display:none;overflow:auto;z-index:10;"></div>
	      <c:if test="${TaskForm.map.isTemplate eq 'true'}">
              <table style="clear:both;margin-bottom:6px;margin-top:10px;" width="100%" border="0" cellspacing="0" cellpadding="0" id="refDSTable">
                <tr class="rowSeparator">
		<td><a href="javascript:toggleTable(dsComp)"><img id="toggleImg_dsComp" align="absmiddle" border='0' src="/webclient/common/images/toggleIcon1.gif"/></a>&nbsp;<span class="boldTxt"><fmt:message key="webclient.config.task.form.ds.choose"/> : </span>&nbsp;&nbsp;<a href="/config/DataSourceAction.do?actionToPerform=showAddDS&protocol=<c:out value='${TaskForm.map.protocol}'/>&taskName=<c:out value='${TaskForm.map.taskName}'/>"><img align="absmiddle" border='0' class="addIcon" src="/webclient/common/images/spacer.gif"/>&nbsp;<span class="blueLink"><fmt:message key="webclient.config.ds.add.link"/></span></a></td>
                </tr>
              </table>
<div class='tableBdr2' id='dsComp' style='padding:2px 3px;'>
	      <div id="dsTable" style="height:120px;overflow:auto;z-index:10;display:'';clear:both;">&nbsp;</div>
</div>
	      <div id="configureDataSource" style="display:none; position:absolute; background-color:white; z-index:10;"></div>
		</c:if>
<c:if test="${operation ne 'execute' && TaskForm.map.overwrite eq 'false'}">
<div style='display:none;'>
</c:if>
              <table style="clear:both;margin-bottom:6px;margin-top:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="rowSeparator" id='chooseDivId'>
		
			<td width="50%"><a href="javascript:toggleTable(deviceTables)"><img id="toggleImg_deviceTables" align="absmiddle" src="/webclient/common/images/toggleIcon1.gif" border="0"/></a>&nbsp;<span class="boldTxt"><fmt:message key="webclient.config.task.form.dl.choose"/> </span></td><td><a href="javascript:openSearch('configSearch')"><img align="absmiddle" class="searchIcon" src="/webclient/common/images/spacer.gif"/></a> <span class="blueLink"><a href="javascript:openSearch('configSearch')"><fmt:message key="webclient.config.task.executeform.moredevices"/></a></span>&nbsp;&nbsp;<a href="javascript:showHelpDialog('<fmt:message key='webclient.config.task.executeform.devices.title.helpMsg'/>','chooseDivId',550);"><img align="absmiddle" class="helpIcon" src="/webclient/common/images/spacer.gif" border="0"/></td>
                </tr>
              </table>
		<div id='deviceTables' style="display:;z-index:10;height:150px;overflow:auto;">
              <table style="clear:both;" width="100%" border="0" cellspacing="0" cellpadding="2">
                <tr>
                  <td id="dlTableSize" width="50%"valign="top" class="tableBdr2"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                      <tr id="dlTableHeader" class="generalTBHeader">
			      <td style="padding-left:5px;"><input name="toggleAllDl"  type="checkbox" onclick="javascript:ToggleAllDl(this,this.form)" style="vertical-align:middle;margin:0px;padding:0px;" id="020"><label for="020"> <fmt:message key='webclient.config.task.executeform.devicelist.title'/></label></td>
                      </tr>
                    </table>
                    <div id="dlTable" style="overflow:auto;z-index:10;height:100px;display:none"/>
                    </td>
		  <td id="searchResultSize" width="50%" valign="top" class="tableBdr2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
		     <td><div id="searchHelp" class="tableBdr2" align="right" style="display:none;position:absolute;background-color:white;left:60%;"></div></td>
                      <tr id="searchResultHeader" style="display:none" class="generalTBHeader">
			      <td style="padding-left:5px;"><input style="vertical-align:middle;margin:0px;padding:0px;" name="toggleAllDevices" type="hidden" onclick='javascript:ToggleAllDl(this,this.form)' id="010"/> <label for="010"><fmt:message key="webclient.config.task.executeform.devices.title"/></label></td>
                      </tr>
                    </table>
<div style='overflow:auto;height:100px;'>
		    <div id="searchResult" style="height:100px;z-index:10;"/>
</div>
                   </td>
                </tr>
              </table></div>
<c:if test="${operation ne 'execute' && TaskForm.map.overwrite eq 'false'}">
</div>
</c:if>
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
	</td>
  </tr>
</table>
<table style="margin-top:15px;" width="100%" border="0" cellspacing="0" cellpadding="0" id="refTable1">
    <tr>
        <td align="center">
        <c:choose>
        <c:when test="${operation eq 'execute'}">
            <input type="button" value="<fmt:message key='webclient.config.task.executeform.execute'/>" class="button" name="SaveandExecute" onclick="javascript:executeTask(this.form)"/>
        </c:when>
        <c:otherwise>
            <input type="button" value="<fmt:message key='webclient.config.task.save'/>" class="button" name="Save" onclick="javascript:saveTask()"/>
		<c:if test="${TaskForm.map.overwrite =='true'}">
            <input type="button" value="<fmt:message key='webclient.config.task.saveexec'/>" class="button" name="SaveandExecute" onclick="javascript:saveAndExecute()"/>
		</c:if>
        </c:otherwise>
        </c:choose>
        <input type="button" value="<fmt:message key='webclient.config.task.cancel'/>" class="button" name="Cancel" onclick="javascript:history.back()"/>
        </td>
    </tr>
</table>
<%--
adding my code here to display div --- ajs
--%>
<div id="attrFormTable" style="display:none; position:absolute; background-color:white; z-index:10;">
</div>
<div style="display:none; position:absolute; z-index:10;" id="ExecutionResult">
</div>
<div id="generaldc" style="display:none; position:absolute; top:250px; left:350px; background-color:white; z-index:10;width:450px">
</div>

<%--
changes ends here 
--%>
</html-el:form>
</body>
</html>
