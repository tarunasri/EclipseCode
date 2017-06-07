<%-- $Id: alarmSummary.jsp,v 1.3 2010/10/29 13:47:07 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<title>ACC Panel</title>


</head>

<meta http-equiv="Refresh" content="<c:out value='${refreshInterval}'/>; ">

<body style="background:none;">

	
<c:choose>
<c:when test="${showaccpanel == 'true'}">
<meta http-equiv="Refresh" content="<c:out value='${refreshInterval}'/>; ">
<table align=center border=0 width=100% cellspacing=0 cellpadding=0>
<tr>
<td align="center">
<jsp:include page="/webclient/fault/jsp/accPanel.jsp"/>
</td>
</tr>
</table>
</c:when>
<c:otherwise>
<table align=center border=0 width=100% cellspacing=0 cellpadding=0>
<TR class="accBg">
<td class="boldText" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<fmt:message key='webclient.alarm.accpanel.title'/></td>
<td align="right"><a class="txtReport" href="/fault/accPanel.do?showaccpanel=true"><img src="/webclient/common/images/<c:out value ='${selectedskin}'/>/down.gif" hspace="2" border="0" valign="bottom"></a></td>
</TR>
</table>
</c:otherwise>
</c:choose>
</body>

</html>
