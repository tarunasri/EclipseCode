<%-- $Id: MatchCriteria.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<script>
function setValue1(selIndex)
{
    var idx = selIndex;
    var criteriaForm = document.CriteriaForm;
    var len = criteriaForm.elements.length;
    var selectedVal = '';
    for ( var i=0; i < len; i++)
    {
        formElement = criteriaForm.elements[i];

        if (formElement.type == "radio" && formElement.name == "rowSelection" && formElement.checked == true)
        {
            selectedVal = formElement.value;
            if(formElement.value == "type" || formElement.value=="sysOID")
            {
                window.opener.document.AddPollingObject.elements["selectOption"+idx].style.visibility="visible";
            }
            else
            {
                window.opener.document.AddPollingObject.elements["selectOption"+idx].style.visibility="hidden";
            }
        }
    }

    window.opener.document.AddPollingObject.elements["AddPollingObject["+idx+"].Criteria"].value=selectedVal;
    window.opener.document.AddPollingObject.elements["AddPollingObject["+idx+"].Props"].value="";
    window.close();
}
</script>

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%--
<%@include file="/webclient/perf/jspf/addPollingObjects.jspf" %>
--%>
<form name="CriteriaForm">
    <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="htableBorder">
     <tr class="tableHeaders">
    <td class="boldWhiteText" nowrap><fmt:message key='webclient.perf.addpo.selectmatchcriteria'/></td>
    <td align="right"><input type="submit" class="button" value='<fmt:message key='webclient.perf.addpo.submit'/>'  name=Submit2 onclick="setValue1(<c:out value='${selectedIndex}'/>)"></td>
    </tr>
    <c:forEach var="crit" items="${CriteriaList}" varStatus="status">
    <c:choose>
    <c:when test="${status.count % 2 ==0}">
    <tr class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td class="text" colspan="2">
    <input name="rowSelection"  type="radio" value="<c:out value='${crit}'/>">
    <c:out value="${crit}"/>
    </td>
    </tr>
    </c:forEach>
</form>
