<%-- $Id: reDirect.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script>
function loadurl(url)
{
top.location.href=url;
}
</script>
<%
String dispName = request.getParameter("displayName");
if(dispName == null)
{
  dispName = (String)request.getAttribute("displayName");
}
String encodedDispname = "";
if(dispName != null)
{
  encodedDispname = java.net.URLEncoder.encode(dispName,"UTF-8");
}
request.setAttribute("encodedDispname",encodedDispname);
%>
<body onload="javascript:loadurl('/fault/AlarmView.do?viewId=<c:out value="${viewId}"/>&isAscending=<c:out value="${isAscending}"/>&FROM_INDEX=<c:out value="${FROM_INDEX}"/>&PAGE_NUMBER=<c:out value="${PAGE_NUMBER}"/>&viewLength=<c:out value="${viewLength}"/>&failure=<c:out value="${failure}"/>&displayName=<c:out value="${encodedDispname}"/>&success=<c:out value="${success}"/>&unauthorized=<c:out value="${unauthorized}"/>')">
</body>


