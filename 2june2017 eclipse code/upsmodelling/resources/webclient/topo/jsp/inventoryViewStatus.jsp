<%-- $Id: inventoryViewStatus.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<c:if test="${!empty success}">
  <td height="20" align="center" class="responseText">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
    <td width="20%" align="right"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"></td>
    <td width="80%" class="responseText" nowrap><c:out value="${success}"/></td>
    </tr>
   </table>
  </td>
</c:if>

<c:if test="${!empty processed}">
  <td height="20" align="center" class="responseText">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
    <td width="20%" align="right"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"></td>
    <td width="80%" class="responseText" nowrap><c:out value="${processed}"/></td>
    </tr>
   </table>
  </td>
</c:if>

<c:if test="${!empty unauthorized}">
  <td height="20" align="center" class="errorText">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
    <td width="20%" align="right"><img src="/webclient/common/images/error_icon.gif" hspace="5" border="0"></td>
    <td width="80%" class="errorText" nowrap><c:out value="${unauthorized}"/></td>
    </tr>
   </table>
</td>
</c:if>

<c:if test="${!empty insufficient}">
  <td height="20" align="center" class="responseText">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
    <td width="20%" align="right"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"></td>
    <td width="80%" class="responseText" nowrap><c:out value="${insufficient}"/></td>
    </tr>
   </table>
  </td>
</c:if>

<c:if test="${!empty notinitialized}">
  <td height="20" align="center" class="responseText">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
    <td width="20%" align="right"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"></td>
    <td width="80%" class="responseText"><c:out value="${notinitialized}"/></td>
    </tr>
   </table>
  </td>
</c:if>

<c:if test="${!empty failure}">
  <td height="20" align="center" class="responseText">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr> 
    <td width="20%" align="right"><img src="/webclient/common/images/negativeRes.gif"  hspace="5" border="0"></td>
    <td width="80%" class="errorText" nowrap><c:out value="${failure}"/></td>
    </tr>
   </table>
  </td>
</c:if>
