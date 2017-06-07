<%-- $Id: redirectPage.jsp,v 1.3 2010/10/29 13:47:05 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<body>
<script language="JavaScript" type="text/JavaScript">
alert('<c:out value="${result}"/>');
window.close();
</script>
</body>
</html>
