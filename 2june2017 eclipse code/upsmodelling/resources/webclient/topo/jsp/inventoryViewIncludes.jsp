<%-- $Id: inventoryViewIncludes.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<title><fmt:message key='webclient.topo.inventorylist.title'><fmt:param value="${param.displayName}"/></fmt:message></title>

<script language="javascript" SRC="/webclient/common/js/navigation.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listrowselection.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listview.js"></SCRIPT>
<script language="JavaScript" SRC="/webclient/common/js/DefaultMenuProperties.js"></script>
<script language="JavaScript" SRC="/webclient/common/js/PopupMenuAPI.js"></script>
<%@include file="/webclient/topo/jspf/inventoryViewOperations.jspf" %>

