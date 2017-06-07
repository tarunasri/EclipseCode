<%-- $Id: configureDataSource.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/config/jspf/taskconfig.jspf" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/config/jspf/deviceList.jspf" %>
<script type="text/javascript" src="/webclient/config/js/taskconfig.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script type="text/javascript" src="/webclient/config/js/config.js"></script>
 <script language="javascript" src="/webclient/common/js/dashboard.js"></script>
<title><fmt:message key="webclient.config.ds.form.title"/></title>
<link href="css/SteelBlue/style.css" rel="stylesheet" type="text/css">
</head>
<body onload="loadDSConfigPage('<c:out value="${protocol}"/>')">
<form name="dsForm" method="POST" action='/config/TaskAction.do?' accept-charset="UTF-8">
<input type='hidden' name='operation' value='<c:out value="${operation}"/>'>
<input type='hidden' name='userInput' value='<c:out value="${userInput}"/>'>
<input type='hidden' name='invInput' value='<c:out value="${invInput}"/>'>
<input type='hidden' name='neInput' value='<c:out value="${neInput}"/>'>
<input type='hidden' name='device' value=''>

<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
  <tbody>
    <tr>
      <td nowrap="nowrap"><h1><fmt:message key="webclient.config.ds.form.title"/></h1></td>
    </tr>
  </tbody>
</table>
<table style="padding:5px 5px 5px 5px;" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<%--td width="20%" valign='top'>
<div id="dsList" class="tableBdr2" style="display:block;height:75%;position:absolute; background-color:white;overflow-x:auto;"></div>
</td--%>
<td width="80%">
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
                <tr class="rowSeparator">
	 	    <td width="10%" valign="top" nowrap="nowrap" ><span class="boldTxt"><fmt:message key="webclient.config.ds.form.details"/> :</span></td>
                </tr>
                <tr>
                    <td width="10%" valign="top" nowrap="nowrap" colspan="2"><img height="3" width="1" src="/webclient/common/images/spacer.gif"/></td>
                </tr>		
		<tr>
		    <td width="10%" valign="top" nowrap="nowrap"><fmt:message key="webclient.config.ds.form.dsName"/> :</td>
		    <td><input type="text" name="dsName" value='<c:out value="${dsName}"/>' <c:if test="${operation eq 'edit'}">readonly='readonly'</c:if>></td>
		</tr>
                <tr>
                    <td valign="top" nowrap="nowrap"><fmt:message key="webclient.config.ds.form.desc"/> :</td>
                    <td valign="top"><input type="textarea" width="250px" name="description" value="<c:out value='${description}'/>"/></td>
                </tr>
		<tr><td width='100%' colspan='2'><div id="showAttribute"  style="position:absolute;display:none; background-color:white;"></div></td></tr>
                <tr>
                    <td valign="top" nowrap="nowrap" width="10%"><fmt:message key="webclient.config.ds.form.protocol"/></span> :</td>
                    <td valign="top" align='left'>
			<input name="protocol" id="myProto" readonly class='disabledBg' type='text' value='<c:out value='${protocol}'/>'>
</td>
                </tr>
		<tr>
			<td width="10%" valign="top" nowrap="nowrap"><fmt:message key="webclient.config.ds.form.taskName"/> :</td>
			<td valign="top" align='left'>
			<c:choose>
			<c:when test="${operation eq 'edit'}">
				<c:forEach items="${availableTasks}" var="task" varStatus="status">
				<c:if test='${taskMap[task] eq "true"}'>
				<input name="tasks" readonly class='disabledBg' type='text' value='<c:out value="${task}"/>'>
				</c:if>
				</c:forEach>

			</c:when>
			<c:otherwise>
				<div id="taskTable"  style="display:block;"></div>
				<input name="tasks" readonly class='disabledBg' type='text' value='<c:out value="${taskName}"/>'>
			</c:otherwise>
			</c:choose>
			</td>
		</tr>
		<tr><td width='100%' colspan='2'><div id="editInputTable" class='popBdr1 popupGBg1'  style="position:absolute;display:none; background-color:white;"></div></td></tr>
		<tr>
			<td colspan='2'>
				<table width="100%" cellspacing="0" cellpadding="3" border="0" align="left" id='tableId'>

				    <tr><td><div id="neInputTableTitle" style="display:none;"></div></td></tr>
				    <tr><td><div id="neInputTable" style="display:none;overflow:auto;"></div></td></tr>
                                    <tr class="rowSeparator">
                                        <td><a href="javascript:toggleTable(invInputTable)"><img id="toggleImg_invInputTable" align="absmiddle" border='0' src="/webclient/common/images/toggleIcon1.gif"/></a>&nbsp;<span class="boldTxt"><fmt:message key="webclient.config.ds.form.invInput"/> :</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="blueLink"><img align="absmiddle" class="addIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:editInput('invInput','')"><fmt:message key="webclient.config.ds.form.add"/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:deleteAllInputs('invInput')"><fmt:message key="webclient.config.ds.form.delall"/></a></span></td>
                                    </tr>
     				    <tr><td><div id="invInputTable" style="display:none;overflow:auto;"></div></td></tr>
                                    <tr class="rowSeparator">
                                        <td><a href="javascript:toggleTable(userInputTable)"><img id="toggleImg_userInputTable" align="absmiddle" border='0' src="/webclient/common/images/toggleIcon1.gif"/></a>&nbsp;<span class="boldTxt"><fmt:message key="webclient.config.ds.form.userInput"/> :</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="blueLink"><img align="absmiddle" class="addIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:editInput('userInput','')"><fmt:message key="webclient.config.ds.form.add"/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<img align="absmiddle" class="deleteIcon" src="/webclient/common/images/spacer.gif"/> <a href="javascript:deleteAllInputs('userInput')"><fmt:message key="webclient.config.ds.form.delall"/></a></span></td>
                                    </tr>
   				    <tr><td><div id="userInputTable"  style="display:none;overflow:auto;"></div></td></tr>
				</table>
			</td>
		</tr>
		</tbody>
		</table>
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
</td>
</tr>
</table>
<table style="margin-top:15px;clear:both" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
    <td align="center"><input type="button" value="<fmt:message key='webclient.config.ds.save'/>" class="button" name="Save" onclick="javascript:updateDS()"/>&nbsp;&nbsp;<input type="button" value="<fmt:message key='webclient.config.ds.reset'/>" class="button" name="Reset" onclick="location.href=location.href"/>&nbsp;&nbsp;<input type="button" value="<fmt:message key='webclient.config.ds.cancel'/>" class="button" name="Cancel" onclick="javascript:history.back()"/></td>
</tr>
</table>
</form>
</body>
</html>
