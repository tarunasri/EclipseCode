<%-- $Id: authAuditListHeader.jsp,v 1.3 2007/10/08 09:12:43 gnanasekar Exp $ --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<script language="javascript" src="/webclient/admin/js/AuditTrailsOperations.js">
</script>
<table border=0 cellspacing=0 cellpadding="2">
<tr>              <td align="left">
             <input name="Submit" type="submit" class="button" value="<fmt:message key='webclient.admin.authaudit.clear'/>" onclick="javascript:clearAudit('/admin/AuthAuditOperations.do?methodCall=clearAudit&viewId=AuthAudit','<fmt:message key="webcliemt.admin.authaudit.operations.clear.noauditerror"/>','<fmt:message key="webclient.admin.auditaudit.operations.deleteaudit.confirm"/>');" >
            </td>
<td>
&nbsp;&nbsp;<input name="Submit1" type="submit" class="button" value="<fmt:message key='webclient.common.listview.header.operations.search'/>" onclick="javascript:loadSearchPage('<c:out value='${viewId}'/>');" >
            </tr>
</table>
