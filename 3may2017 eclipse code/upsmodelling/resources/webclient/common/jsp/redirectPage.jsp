<%-- $Id: redirectPage.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script>
function loadurl(url)
{
   url = url +"&success="+'<c:out value="${success}"/>'+"&failure="+'<c:out value="${failure}"/>'+"&unauthorized="+'<c:out value="${unauthorized}"/>';
   var redirect = '<c:out value="${redirect}"/>';
   if(redirect == "true")
   {
      top.window.opener.parent.location.href=url;
      window.close();
   }
   else
   {
      top.location.href=url;
   }
}
</script>
<body onload="javascript:loadurl('<c:out value='${loadURL}'/>')">
</body>


