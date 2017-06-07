<%-- $Id: DeviceTypesList.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<script>
function setValue(selIndex)
{
    var idx = selIndex;
    var typesListForm = document.typesList;
    var len = typesListForm.elements.length;
    var selectedType = '';
    for ( var i=0; i < len; i++)
    {
        formElement = typesListForm.elements[i];
        if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
        {
            if(selectedType == '')
            {
                selectedType = formElement.value;
            }
            else
            {
                selectedType += ',' + formElement.value;
            }
        }
    }
    window.opener.document.AddPollingObject.elements["AddPollingObject["+idx+"].Props"].value=selectedType;
    window.close();
}
</script>

<form name="typesList">
    <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="htableBorder">
     <tr class="tableHeaders">
    <td colspan="2"  class="boldWhiteText" nowrap><fmt:message key='webclient.perf.addpo.selecttype'/></td>
    <td align="right"><input type="submit" class="button" value='<fmt:message key='webclient.perf.addpo.submit'/>'  name=Submit2 onclick="setValue(<c:out value='${selectedIndex}'/>)"></td>
    </tr>
    <c:forEach var="type" items="${DeviceTypes}" varStatus="status">
    <c:choose>
    <c:when test="${status.count % 2 ==0}">
    <tr class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td class="text">
    <input name="rowSelection"  type="checkbox" value="<c:out value='${type.key}'/>">
    </td>
    <td class="text">
    <c:out value="${type.key}"/>
    </td>
    <td class="text">
    <c:out value="${type.value}"/>
    </td>
    </tr>
    </c:forEach>
</form>
