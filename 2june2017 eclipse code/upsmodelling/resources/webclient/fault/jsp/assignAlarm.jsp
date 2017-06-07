<%-- $Id: assignAlarm.jsp,v 1.2 2007/10/19 13:06:30 gnanasekar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.fault.alarmdetails.assignalarm.title'/></title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="javascript" src="/webclient/fault/js/fault.js" type="text/javascript"></script>
</head>

<body onload="javascript:focusAssign()">
<form name="assignForm" action="/fault/AlarmDetails.do?entity=<c:out value="${entity}"/>&method=assignTheAlert" method="post">
<input type="hidden" name="from" value="<c:out value='${param.from}'/>">
<input type="hidden" name="viewId" value="<c:out value='${param.viewId}'/>">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.fault.alarmdetails.assignalarm.title'/></h1></td>
        </tr>
        </table>

<table style="margin-bottom:10px;" align="center" width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

  <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center">
    <tr> 
      <td colspan="3" align="right"> 
        <table width="90%" border="0" align="center" cellpadding="2" cellspacing="1">
        <c:if test="${userDExist == true}">
          <tr>
          <td height="30" colspan="2"><span class="errorText"><fmt:message key='webclient.fault.alarmdetails.assignalarm.error'><fmt:param value='${assignedOwner}'/></fmt:message></span></td>
          </tr>
        </c:if>

          <tr> 
            <td width="26%" align="left" valign="top" class="text"><fmt:message key='webclient.fault.alarmdetails.assignalarm.assign'/></td>
            <td height="30">
                <input type="text" name="assign" style=width:180 class="formStyle"> 
            </td>
          </tr>
          <tr> 
            <td class="boldText">&nbsp;</td>
            <td height="30">
                <input type="button" name="Assign" value="<fmt:message key='webclient.fault.alarmdetails.assignalarm.button.assign'/>" class="button" onClick="javascript:validatePickUp('<fmt:message key="webclient.fault.alarmdetails.assignalarm.error.validate"/>');">
                <input type="button" name="Cancel" value="<fmt:message key='webclient.fault.alarmdetails.button.cancel'/>" class="button" onClick="window.close();">
            </td>
          </tr>
        </table></td> </tr>
        </table>

</td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</form>
</body>
</html>
