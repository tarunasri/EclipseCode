<%-- $Id: DeviceOIDsList.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<script>
function setValue(selIndex)
{
    var idx = selIndex;
    var oidListForm = document.oidList;
    var len = oidListForm.elements.length;
    var selectedOID = '';
    for ( var i=0; i < len; i++)
    {
        formElement = oidListForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
            if(selectedOID == '')
            {
                selectedOID = formElement.value;
            }
            else
            {
                selectedOID += ',' + formElement.value;
            }
        }
    }
    window.opener.document.AddPollingObject.elements["AddPollingObject["+idx+"].Props"].value=selectedOID;
    window.close();
}
</script>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<form name="oidList">
    <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="htableBorder">
     <tr class="tableHeaders">
    <td colspan="2" class="boldWhiteText" nowrap><fmt:message key='webclient.perf.addpo.selectoid'/></td>
    <td align="right"><input type="submit" class="button" value='<fmt:message key='webclient.perf.addpo.submit'/>'  name=Submit2 onclick="setValue(<c:out value='${selectedIndex}'/>)"></td>
    </tr>
    <c:forEach var="oid" items="${DeviceOIDs}" varStatus="status">
    <c:choose>
    <c:when test="${status.count % 2 ==0}">
    <tr class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td class="text">
    <input name="rowSelection"  type="checkbox" value="<c:out value='${oid.value}'/>">
    </td>
    <td class="text">
    <c:out value="${oid.key}"/>
    </td>
    <td class="text">
    <c:out value="${oid.value}"/>
    </td>
    </tr>
    </c:forEach>
</form>
