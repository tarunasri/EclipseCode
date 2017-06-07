<%-- $Id: LoadAlertFilterForm.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<html>
<head><title><fmt:message key='webclient.admin.filters.loadalertfilters'/></title></head>

<%@include file="/webclient/admin/jspf/NotificationOperations.jspf" %>

<html:form action="/LoadAlertFilterAction" onsubmit="return validate()">
    <table border=0 class="dbborder1" cellspacing="0" cellpadding="2" width="100%" align="center">

        <tr height=25 class="header2Bg">
            <td colspan="2" align="center" valign="middle" class="boldText" nowrap><c:out value="Load from File"/></td>
        </tr>
        
        <tr colspan="2" height="10"><td></td></tr>

        <tr>
            <td width="50%" align="center"><span class="boldText"><fmt:message key='webclient.admin.filters.filename'/></span></td>
            <td align="center"><html-el:text styleClass="formStyle" property="FileName"/></td>
        </tr>

        <tr colspan="2" height="5"><td></td></tr>

        <tr class="reportsOddRow" height="30">
            <td align="right"><input type="submit" class="button" value="<fmt:message key='webclient.admin.filters.submitbutton'/>"/></td>
            <td><input type="button" class="button" value="<fmt:message key='webclient.admin.filters.cancelbutton'/>" onclick="javascript:window.close();"/></td>
        </tr>
    </table>
</html:form>
</html>
