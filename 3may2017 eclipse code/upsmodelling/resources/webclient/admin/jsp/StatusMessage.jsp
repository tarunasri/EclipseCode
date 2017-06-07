<?xml version="1.0" encoding="ISO-8859-1" ?>
<!-- $Id: StatusMessage.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script>
function composeMail()
{
	window.location.href="/admin/ReportToAdventNet.do";
}

</script>

<body onLoad="composeMail();" >
<br><br><br><br><br><br><br><br><br>
<center><i><span style="color: #003399;font-family"><fmt:message key='webclient.admin.mgmtgui.loadingmsg'/></span></i></center>
</body>
