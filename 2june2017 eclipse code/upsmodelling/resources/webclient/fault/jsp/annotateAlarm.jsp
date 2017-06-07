<%-- $Id: annotateAlarm.jsp,v 1.3 2007/10/18 06:37:45 gnanasekar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.fault.alarmdetails.annotatenotes.title'><fmt:param value='${entity}'/></fmt:message> </title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="javascript" src="/webclient/fault/js/fault.js" type="text/javascript"></script>
</head>

<body onload="focusAnnotate()">
<form name="annotation" action="/fault/AlarmDetails.do?method=setAnnotation&entity=<c:out value="${entity}"/>" method="post">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.fault.alarmdetails.annotatenotes.header'><fmt:param value='${entity}'/></fmt:message></h1></td>
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
        <table width="100%" border="0" align="left" cellpadding="2" cellspacing="1">
     
            
          <td width="26%" align="right" class="text"><fmt:message key='webclient.fault.details.properties.message'/></td>
            
          <td height="95" align="right"> 
            <textarea name="text" cols="25" rows="4" class="textarea" style=width:250></textarea>
          </td>
          </tr>
          <tr> 
            <td height="25" align="right" colspan="2">
                <input type="button" name="Annotate" value="<fmt:message key='webclient.fault.alarmdetails.annotatenotes.button.annotate'/>"  class="button" onClick="javascript:validateAnnotationMessage('<fmt:message key="webclient.fault.alarmdetails.annotatenotes.error"/>')">
                <input type="button" name="Cancel" value="<fmt:message key='webclient.fault.alarmdetails.button.cancel'/>"  class="button" onClick="javascript:MM_callJS('window.close()')">
            </td>
          </tr>
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
