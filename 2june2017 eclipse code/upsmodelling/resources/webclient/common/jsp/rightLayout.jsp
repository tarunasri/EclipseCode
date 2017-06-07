<%-- $Id: rightLayout.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<%@page contentType="text/html;charset=UTF-8"%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key="webclient.mainviewpage.title"/></title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
</head>
<BODY>

<table width="70%" height="100%" border="0" cellpadding="0" cellspacing="0">
<tr class="tabsBg">
  <td align="left" valign="top" height="1">
    <tiles:insert attribute="Tab"/>
  </td>
</tr>
<tr>
  <td align="left" valign="top">
    <tiles:insert attribute="MainPage"/>
  </td>
</tr>
</table>

</BODY>
</html>
