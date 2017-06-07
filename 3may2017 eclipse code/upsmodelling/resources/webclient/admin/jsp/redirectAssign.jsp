
<%-- $Id: --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<body>
<script language="JavaScript" type="text/JavaScript">
//top.window.opener.parent.location.href="/admin/GroupAdmin.do?success="+'<c:out value="${success}"/>'+"&failure="+'<c:out value="${failure}"/>'+"&unauthorized="+'<c:out value="${unauthorized}"/>';
top.window.opener.parent.location.reload();
//top.window.opener.location.reload();
//top.window.opener.parent.leftFrame.location.reload();
//top.window.opener.parent.statusFrame.location.reload();
//top.window.opener.parent.mainFrame.location.reload();
window.close();

</script>
</body>
</html>
