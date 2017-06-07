<%-- $Id: otherFailures.jsp,v 1.2 2007/10/16 09:53:41 gnanasekar Exp $ --%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
  <c:choose>
    <c:when test="${empty otherFailures}">
     <tr>
       <td height="30" colspan="3"> 
         <table width="100%" border="0" align="center" cellpadding="5" cellspacing="1">
          <tr> 
           <td height="50" align="center" class="responseText"><fmt:message key='webclient.fault.alarmdetails.otherfailures.noalarm'/></td></tr>
          </table>
         </td></tr> 
    </c:when>
    <c:otherwise>
     <tr>
       <td height="25" colspan="3" class="header2"> 
       <table width="100%" border="0" cellspacing="0" align="left" cellpadding="2" class="botBorder">
     
          <tr class="propertyLeftBg"> 
           <td width="25%" height="20"><span class="boldText"><fmt:message key='webclient.fault.details.properties.entity'/></span></td>
           <td width="20%"><span class="boldText"><fmt:message key='webclient.fault.details.properties.severity'/></span></td>
           <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.message'/></span></td>
          </tr>
     
      <c:forEach var="failures" items="${otherFailures}" >
       <tr> 

        <c:forEach var="entity" items="${failures.key}">

          <td height="20" align="left"><span class="text">   

           <a href="/fault/AlarmDetails.do?method=traversePage&tab=tabOne&entity=<c:out value='${entity}'/>"><c:out value="${entity}"/> </a></span></td>

        </c:forEach>

       <c:forEach var="otherValues" items="${failures.value}">
          <td align="left"><span class="text"><c:out value="${otherValues.value}"/></span></td>        
       </c:forEach>
      </tr>
       
      
     </c:forEach>
    </table>
  </c:otherwise>
  </c:choose>

</table>
</td>

<%@include file="/webclient/fault/jspf/alarmDetailsFooter.jspf" %>
