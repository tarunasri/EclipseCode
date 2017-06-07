<%-- $Id: annotationResponse.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.fault.alarmdetails.annotatenotes.status.header'><fmt:param value='${entity}'/></fmt:message> </title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="javascript" src="/webclient/fault/js/fault.js" type="text/javascript"></script>
</head>

<body class="popupbg" onload="document.forms[0].Close.focus();"> 
<form name="annResponse">
  <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center">
    <tr> 
     <td class="header1Bg" colspan="3" height="30"><p><span class="header1"><fmt:message key='webclient.fault.alarmdetails.annotatenotes.status.header'><fmt:param value='${entity}'/></fmt:message></span></p>
        </td>
    </tr>
    <tr> 
      
    <td colspan="3">
<table width="90%" border="0" align="center" cellpadding="2" cellspacing="1">
        <c:choose> <c:when test="${isAlertAnnotated == 'true'}"> 
        <tr align="center"> 
            <td height="75" colspan="2" class="text"> <fmt:message key='webclient.fault.alarmdetails.annotatenotes.status.success'/> </td>
          </tr>
         </c:when>
         <c:otherwise>
          <tr align="center"> 
            <td height="75" colspan="2" class="text"> <fmt:message key='webclient.fault.alarmdetails.annotatenotes.status.failure'/> </td>
          </tr>
         </c:otherwise>
       </c:choose>
          <tr align="center"> 
            <td height="25" colspan="2" class="boldtext">
                <input type="button" name="Close" value="<fmt:message key='webclient.fault.alarmdetails.button.close'/>"  class="button" onClick="javascript:MM_callJS('window.close()')">
                <input type="button" name="View Annotation" value="<fmt:message key='webclient.fault.alarmdetails.annotatenotes.button.view'/>"  class="button" onClick="javascript:reloadParent('/fault/AlarmDetails.do?method=traversePage&tab=tabTwo&entity=<c:out value="${entity}"/>&view=default')">
             </td>
          </tr>
        </table>
      </td>
    </tr>
</table>
</form>
</body>
</html>
