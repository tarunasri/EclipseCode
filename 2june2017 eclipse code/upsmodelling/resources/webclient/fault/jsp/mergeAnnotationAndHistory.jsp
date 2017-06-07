<%-- $Id: mergeAnnotationAndHistory.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

 <table width="98%" border="0" align="left" cellpadding="1" cellspacing="0">
     <tr> 
      <td width="50%" class="header2Bg" height="25"><span class="header2"><fmt:message key='webclient.fault.alarmdetails.merge.header'/></span></td>
	  
    <td class="header2Bg" align="left"><span class="text"><a href="/fault/AlarmDetails.do?method=traversePage&tab=tabTwo&entity=<c:out value="${entity}"/>&view=default"><fmt:message key='webclient.fault.alarmdetails.tab.viewannotationandhistory.message'/></a></span></td>
  </tr>
  

     <tr> 
       <td height="30" colspan="3" class="header2"><table width="100%" class="botBorder" border="0" align="left" cellpadding="2" cellspacing="0">

       <tr class="propertyLeftBg"> 
          <td width="28%" height="20"><span class="header3"><fmt:message key='webclient.fault.details.properties.time'/></span></td>
          <td><span class="header3"><fmt:message key='webclient.fault.details.properties.owner'/></span></td>
          <td width="60%"><span class="header3"><fmt:message key='webclient.fault.details.properties.message'/></span></td></tr>

    <c:choose>
      <c:when test="${empty mergedNotes}">
         <tr>
             <td height="20"><span class="text">-</span></td>
             <td height="20"><span class="text">-</span></td>
             <td height="20"><span class="text">-</span></td></tr>
       </c:when>
      <c:otherwise>
         <c:forEach var="notes" items="${mergedNotes}">
            <tr>
              <td height="20" align="left"><span class="text"><c:out value="${notes.modTime}"/></span></td>
              <td height="20" align="left"><span class="text"><c:out value="${notes.who}"/></span></td>
              <td height="20" align="left"><span class="text"><c:out value="${notes.notes}" escapeXml="false"/></span></td></tr>
         </c:forEach>
      </c:otherwise>
    </c:choose>
    </table></td>
  </tr>
</table></td>

<%@include file="/webclient/fault/jspf/alarmDetailsFooter.jspf" %>



