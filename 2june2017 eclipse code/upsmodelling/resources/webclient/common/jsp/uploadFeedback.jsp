
<%-- $Id: uploadFeedback.jsp,v 1.1.4.1 2006/04/03 19:03:31 gnanasekar Exp $ --%>



<%@page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>

<html>

<head>
<title><fmt:message key='webclient.common.upload.pagetitle'/></title>

</head>
<body bgcolor="#FFFFFF" text="#000000">
<ul><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
<br>
<br>
<center><h5>
<c:choose>
<c:when test="${OutputResult eq 'Success'}" >
    <fmt:message key="webclient.common.upload.successmsg"/>
</c:when>
<c:otherwise>
    <fmt:message key="webclient.common.upload.failuremsg" />
</c:otherwise>
</c:choose>
 </h5>
<p><br><a href="javascript:window.close();"><fmt:message key="webclient.common.window.close"/></a></p></center>

</body>
</html>

