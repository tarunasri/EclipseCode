<%-- $Id: cvStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>


<script language="JavaScript">

        <c:url var="cvStatusLink" value="/mainLayout.do">
           <c:param name="selectedTab" value="Fault"/>
           <c:param name="selectedNode" value="${viewId}"/>
           <c:param name="displayName" value="${displayName}"/>
           <c:param name="action" value="${action}"/>
        </c:url>

 window.open('<c:out value="${cvStatusLink}"/>','_top')

</script>
