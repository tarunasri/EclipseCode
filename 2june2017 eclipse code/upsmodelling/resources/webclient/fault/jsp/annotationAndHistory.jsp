<%-- $Id: annotationAndHistory.jsp,v 1.2 2007/10/16 09:53:06 gnanasekar Exp $ --%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<table width="100%" border="0" cellspacing="0" cellpadding="1" align="left">
  <tr > 
    <td width="50%" height="25" class="annotationHeaderBg"><fmt:message key='webclient.fault.alarmdetails.viewannotation.header'/></td>

<c:if test="${isUserPermittedToViewAnnotation  && isUserPermittedToViewHistory }">

    <td align="left" class="annotationHeaderBg"><span class="text"><a href="/fault/AlarmDetails.do?method=traversePage&entity=<c:out value="${entity}"/>&tab=tabTwo&view=merge"><fmt:message key='webclient.fault.alarmdetails.viewannotation.merge.link'/></a></span></td>
</c:if>
  </tr><tr>
  <td height="30" colspan="2" class="header2"><table width="100%" border="0" align="left" CLASS="botBorder" cellpadding="2" cellspacing="0">
      <c:choose>
        <c:when test="${!empty annFailure}">
          <tr>
             <td height="20" align="center"><span class="text"><c:out value="${annFailure}"/></span></td>
          </tr>  
        </c:when>
      <c:otherwise>

      <tr> 
        <td width="25%" height="20"><span class="header3"><fmt:message key='webclient.fault.details.properties.time'/></span></td>
        <td><span class="header3"><fmt:message key='webclient.fault.details.properties.owner'/></span></td>
        <td width="61%"><span class="header3"><fmt:message key='webclient.fault.details.properties.message'/></span></td>
      </tr>
      <c:choose> 
        <c:when test="${empty annotationValue}"> 
           <tr> 
             <td height="20" class="text">-</td>
             <td class="text">-</td>
             <td class="text">-</td>
           </tr>
        </c:when> 
       <c:otherwise>
	   <c:set var="style" value="boldText" /> 
           <c:forEach var="alertAnn" items="${annotationValue}"> 
             <tr> 
              <td height="20" align="left"><span class=<c:out value="${style}"/>><c:out value="${alertAnn.modTime}"/></span></td>
              <td height="20" align="left"><span class=<c:out value="${style}"/>><c:out value="${alertAnn.who}"/></span></td>
              <td height="20" align="left"><span class=<c:out value="${style}"/>><c:out value="${alertAnn.notes}" escapeXml="false"/></span></td>
  	   <c:set var="style" value="text" />
             </tr>
           </c:forEach> 
        </c:otherwise> 
      </c:choose> 
   </c:otherwise>
  </c:choose>

      </tr> 
    </table></td></tr>
	<tr>
          <td colspan="2" height="20"></td>
	</tr>
   <tr> 
      <td height="25" colspan="2" class="annotationHeaderBg"><fmt:message key='webclient.fault.alarmdetails.viewhistory.header'/></td>
   </tr>
   <tr> 
    <td height="30" colspan="2" class="header2"><table width="100%" border="0" class="botBorder" align="left" cellpadding="2" cellspacing="0">
        <c:choose>
          <c:when test="${!empty hisFailure}">
             <tr>
               <td height="20" align="center"><span class="text"><c:out value="${hisFailure}"/></span></td>
             </tr>  
          </c:when>
        <c:otherwise>

        <tr> 
          <td width="25%" height="20"><span class="header3"><fmt:message key='webclient.fault.details.properties.time'/></span></td>
          <td width="61%"><span class="header3"><fmt:message key='webclient.fault.details.properties.message'/></span></td>
        </tr>

        <c:choose> 
          <c:when test="${empty alertHistory}"> 
            <tr> 
               <td height="20"><span class="text">-</span></td>
               <td><span class="text">-</span></td>
            </tr>
          </c:when> 
          <c:otherwise> 
             <c:forEach var="alertHis" items="${alertHistory}"> 
               <tr> 
                <td height="20" align="left"><span class="text"><c:out value="${alertHis.modTime}"/></span></td>
                <td height="20" align="left"><span class="text"><c:out value="${alertHis.notes}" escapeXml="false"/></span></td>
               </tr>
             </c:forEach> 
          </c:otherwise> 
        </c:choose> 

       </c:otherwise>
      </c:choose>
       </table>
      </td>
  </tr>
</table>
</td>


<%@include file="/webclient/fault/jspf/alarmDetailsFooter.jspf" %>
