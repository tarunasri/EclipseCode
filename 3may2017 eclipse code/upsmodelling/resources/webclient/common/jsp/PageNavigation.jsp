<%-- $Id: PageNavigation.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@ taglib uri = "http://www.adventnet.com/webclient/component-tags" prefix="component" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%--// Form to store the current view state in hidden fields --%>
<form name="pagexform" method="POST" action='<c:out value="${action}"/>'>
        <INPUT TYPE="hidden" NAME="viewId" VALUE='<c:out value="${viewId}"/>'>
        <INPUT TYPE="hidden" NAME="isAscending" VALUE='<c:out value="${isAscending}"/>'>
        <INPUT TYPE="hidden" NAME="orderByColumn" VALUE='<c:out value="${orderByColumn}"/>'>
    	<INPUT TYPE="hidden" NAME="category" VALUE='<c:out value="${param.category}"/>'>
	    <INPUT TYPE="hidden" NAME="entity" VALUE='<c:out value="${param.entity}"/>'>
       <INPUT TYPE="hidden" NAME="displayName" VALUE='<c:out value="${param.displayName}"/>'>
         <%
           String dispName = request.getParameter("param.displayName");
           if(dispName==null)
           {
             dispName = (String)request.getAttribute("displayName");
           }
           String encodedDispname = dispName;
           if(dispName != null)
           {
              encodedDispname = java.net.URLEncoder.encode(dispName,"UTF-8");
           }
           request.setAttribute("encodedDisplayName",encodedDispname );

         %>
         <INPUT TYPE="hidden" NAME="encodedDispName" VALUE='<c:out value="${encodedDisplayName}"/>'>
<c:if test="${viewId=='Alerts'}">
<INPUT TYPE="hidden" NAME="severity" VALUE='<c:out value="${param.severity}"/>'>
</c:if>
<%--
// component tag to be placed above the hidden fields:FROM_INDEX,TO_INDEX,PAGE_NUMBER
--%>

<component:XPage totalRecords='<%=(Long)request.getAttribute("RECORDS")%>'  recordsPerPage='<%=(Integer)request.getAttribute("viewLength")%>' linksPerPage="5" forwardTo="" pageNumber='<%=(String)request.getAttribute("PAGENUMBER")%>'>
                <%@ include file="../jspf/NavigateByPage.jspf"%>
</component:XPage>
        <INPUT TYPE="hidden" NAME="FROM_INDEX" VALUE='<c:out value="${FROM_INDEX}"/>'>
        <INPUT TYPE="hidden" NAME="TO_INDEX" VALUE='<c:out value="${TO_INDEX}"/>'>
        <INPUT TYPE="hidden" NAME="PAGE_NUMBER" VALUE='<c:out value="${PAGE_NUMBER}"/>'>
        <c:choose>
        <c:when test="${viewId=='Alerts' || viewId=='Events'}">
        </c:when>
        <c:otherwise>   
            <INPUT TYPE="hidden" NAME="type" VALUE='<c:out value="${type}"/>'>  
            <INPUT TYPE="hidden" NAME="status" VALUE='<c:out value="${status}"/>'>  
        </c:otherwise>
        </c:choose>
</form>
