<%-- $Id: tabDetailsHeader.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>

 
     
<c:if test="${!empty messages}">
<tr class="propertyBg">
  <td height="20" align="center" class="responseText">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
 <c:forEach var="message" items="${messages}">
   <tr> 
   <c:choose>
    <c:when test="${message.value=='success'}">
    <td width="20%" align="right"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"></td>
    <td width="80%" class="responseText"><c:out value="${message.key}"/></td>
     </c:when>
     <c:otherwise>
    <td align="right"><img src="/webclient/common/images/cross.gif" width="15" height="15" hspace="5" border="0"></td>
    <td class="errorText"><c:out value="${message.key}"/></td>
     </c:otherwise>
    </c:choose>
    </tr>
 </c:forEach>
    </table>
   </td>
  </tr>
 </c:if>
