<%-- $Id: accPieChart.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.fault.alarm.accpanel.piechart.title'/></title>
</head>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<body>
<form name="accPanel" action="<c:out value='${acc_link}'/>" method="post">
<table width="100%" border="0" align="center" cellspacing="0">
    <tr>
     <td height="20" valign="bottom" align="right" class="text">  
      <select height='20' name="selCategory" class="text" onchange="javascript:document.accPanel.submit()">
         <c:forEach var="list" items="${categoryList}">
          <option value="<c:out value='${list}'/>" <c:if test="${list == category}">selected</c:if>><c:out value="${list}"/></option>
         </c:forEach>
      </select>
     </td>
  </tr>

  <tr> 
    <td align="center" colspan="2">
      <img src="<c:out value='${filepath}'/>" border="0" usemap="#<c:out value='${filepath}'/>">
    </td>
  </tr>

</table>
</form>
</body>
</html>
