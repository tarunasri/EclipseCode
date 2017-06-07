<%-- $Id: assignResponse.jsp,v 1.2 2007/10/19 13:06:31 gnanasekar Exp $ --%>

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

<body>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.fault.alarmdetails.assignalarm.title'/></h1></td>
        </tr>
        </table>


  <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center">
    <tr> 
      <td align="right" colspan="3"><table width="90%" border="0" align="center" cellpadding="2" cellspacing="1">
                <c:choose>
                <c:when test="${pickUpStatus == 'true'}">
                <tr> 
                <td height="75" align="center" class="text"><fmt:message key='webclient.fault.alarmdetails.assign.response.success'><fmt:param value='${assignedOwner}'/></fmt:message> </td>
                </tr>
                </c:when>
                <c:otherwise>
                <tr> 
                <td height="75" align="center" class="text"><fmt:message key='webclient.fault.alarmdetails.assign.response.failure'/></td>
                </tr>
                </c:otherwise>
                </c:choose>
            <tr> 
            <td height="25" align="center" class="text">
                
              <c:choose>
                <c:when test="${from == 'listView'}">
                   <input type="button" name="Close" value="<fmt:message key='webclient.fault.alarmdetails.button.close'/>" class="button" onClick="javascript:reloadParent('/fault/AlarmView.do?viewId=<c:out value="${param.viewId}"/>')">
                </c:when>
                <c:otherwise>
                <input type="button" name="Close" value="<fmt:message key='webclient.fault.alarmdetails.button.close'/>" class="button" onClick="javascript:reloadParent('/fault/AlarmDetails.do?method=traversePage&tab=tabOne&entity=<c:out value="${entity}"/>&view=default&pickUpStatus=<c:out value="${pickUpStatus}"/>')">
                </c:otherwise>
              </c:choose>      
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</body>
</html>
