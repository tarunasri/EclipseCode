<!--$Id: MibForm.jsp,v 1.3 2007/10/09 08:34:04 sumitha Exp $-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<title>Mib Browser</title>
<link href="/webclient/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" SRC="/webclient/common/js/listview.js" type="text/javascript"></script>
<%@include file="/webclient/admin/jsp/JS.jsp" %>
</head>
<body>
<form action="/admin/GetOID.do">
<input type=hidden value="<c:out value='${requestid}'/>"/>
    <input type=hidden name="method" value="loadMIB"/>
    <SELECT NAME="mib" SIZE=10 class="txtGlobal">
	<c:forEach items="${mibs}" var="prop" varStatus="index">
		<OPTION><c:out value='${prop}' /></OPTION>
	</c:forEach>
    </SELECT>
	<input type="submit" value="Submit" name="Submit">
</form>
</body>
</head>
