<%-- $Id: EditWidget.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>
<html>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/HomePageFunctions.jspf" %>
<head>
</head>
<body>
<script>




</script>
<c:choose>
<c:when test='${dataToReturn == null}'>
<fmt:message key="webclient.dashboard.editwidget.nodata"/>
</c:when>
<c:otherwise>
<form id="criteriaFormId" name="criteriaForm" method="post" action="/editWidget.do?method=update&associationId=<c:out value='${associationId}'/>" onsubmit="javascript:return saveEdit(<c:out value='${associationId}'/>,<c:out value='${currentDashboard}'/>,<c:out value="${columnWidth}"/>);">

<div class="editHeader"><fmt:message key="webclient.dashboard.editwidget.header"/></div>
<table width="100%" cellspacing="0" cellpadding="3" border="0" align="center" style="margin-top: 7px; margin-bottom: 7px;" id="wEdit_302">
  <tbody>
<tr>
<td nowrap="" width="10%" valign="middle" align="left" style="padding-left: 10px;"><fmt:message key="webclient.dashboard.editwidget.form.label.name"/></td>
<td>
<input name="widgetName" type="text" style="text-align: left;border:1px solid #7992b8;" class="editInputBdrd" onfocus="this.className='inputFocusText'" onblur="this.className='dateBox';" value="<fmt:message key='${widgetDetail.NAME}'/>"/></td>
</tr>
<c:forEach var="property" items='${dataToReturn}'>
<tr>
      <td nowrap="" width="10%" valign="middle" align="left" style="padding-left: 10px;">
<fmt:message key="${property.PROPNAME}"/>
</td>
<%
Vector options = new Vector();
%>
<c:choose>
<c:when test="${property.PROPNAME == 'period' || property.PROPNAME == 'dataToShow' || property.PROPNAME == 'graphType'}">
<td>
<c:if test="${property.PROPNAME == 'period'}">
<%
options.add("Yesterday");
options.add("Today");
options.add("Last 7 Days");
options.add("Last 30 Days");
request.setAttribute("listValues",options);
%>
</c:if>
<c:if test="${property.PROPNAME == 'dataToShow'}">
<%
options.clear();
options.add("DataCollectionRate");
options.add("StatusPollingRate");
options.add("TrapRate");
options.add("EventRate");
options.add("AlertRate");
request.setAttribute("listValues",options);
%>
</c:if>
<c:if test="${property.PROPNAME == 'graphType'}">
<%
options.clear();
options.add("Area");
options.add("Line");
request.setAttribute("listValues",options);
%>
</c:if>
<select name="<c:out value='${property.PROPNAME}'/>">
<c:forEach var="options" items="${listValues}">
<c:choose>
<c:when test="${options == property.PROPVALUE}">
<option selected value="<c:out value='${property.PROPVALUE}'/>"><fmt:message key='${property.PROPVALUE}'/></option>
</c:when>
<c:otherwise>
<option value="<c:out value='${options}'/>"><fmt:message key="${options}"/></option>
</c:otherwise>
</c:choose>
</c:forEach>
</select>
</td>
</c:when>
<c:otherwise>
<c:choose>
<c:when test="${property.PROPNAME == 'refreshInterval'}">
<td>
<input name="<c:out value='${property.PROPNAME}'/>" type="text" style="text-align: left;border:1px solid #7992b8;" class="editInputBdrd" onfocus="this.className='inputFocusText'" onblur="this.className='dateBox';" value="<c:out value='${property.PROPVALUE}'/>"  onkeypress="return checkIsNumeric(event);"/></td>
</c:when>
<c:otherwise>
<td>
<input name="<c:out value='${property.PROPNAME}'/>" type="text" style="text-align: left;border:1px solid #7992b8;" class="editInputBdrd" onfocus="this.className='inputFocusText'" onblur="this.className='dateBox';" value="<c:out value='${property.PROPVALUE}'/>"/></td>
</c:otherwise>
</c:choose>
</tr>
</c:otherwise>
</c:choose>
</c:forEach>
  </tbody>
</table>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="editFooter">
  <tbody>
    <tr>
      <td align="center" style="padding-top: 2px; padding-bottom: 2px;"><input type="submit" class="button" value='<fmt:message key="webclient.dashboard.editwidget.form.button.save"/>'/>
        <input type="button" class="button" value='<fmt:message key="webclient.dashboard.editwidget.form.button.cancel"/>' onclick="javascript:cancelEdit(<c:out value='${associationId}'/>,<c:out value='${currentDashboard}'/>,<c:out value='${columnWidth}'/>) "/>
      </td>
    </tr>
  </tbody>
</table>
</form>
</c:otherwise>
</c:choose>

</body>
</html>
