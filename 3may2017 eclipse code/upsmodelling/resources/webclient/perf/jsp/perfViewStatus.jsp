<%-- $Id: perfViewStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>


<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>


<c:if test="${!empty success}">
  <td height="20" align="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
      <td width="20%"></td>
      <td height="25" nowrap class="responseText"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"><c:out value="${success}"/></td>
    </tr>
   </table>
  </td>
</c:if>

<c:if test="${!empty failure}">
  <td height="20" align="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
      <td width="20%"></td>
      <td width="80%" class="errorText"><img src="/webclient/common/images/negativeRes.gif" width="17" height="13" hspace="5" border="0"><c:out value="${failure}"/></td>
    </tr>
   </table>
  </td>
</c:if>

<c:if test="${!empty unauthorized}">
  <td height="20" align="center">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
    <td width="20%"></td>
    <td width="80%" class="errorText"><img src="/webclient/common/images/info_icon.gif" hspace="5" border="0"><c:out value="${unauthorized}"/></td>
    </tr>
   </table>
</td>
</c:if>
