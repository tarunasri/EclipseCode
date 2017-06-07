<%-- $Id: addExampleHeader.jsp,v 1.2 2007/09/14 10:47:13 gnanasekar Exp $ --%>
<HEAD>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
</HEAD>

<table width="100%" class="pageHeaderStr" border="0" cellpadding="0" cellspacing="0">
        <tr>
               <c:choose>
                   <c:when test='${empty mapProps.label}'>
                       <TD width="15%" nowrap>
                           <h1><fmt:message key='webclient.map.view.header'><fmt:param value="${displayName}"/></fmt:message></h1>
                       </TD>
                   </c:when>
                   <c:otherwise>
                       <TD  width="15%" nowrap>
                          <h1><fmt:message key='webclient.map.view.header'><fmt:param value="${mapProps.label}"/></fmt:message></h1>
                       </TD>
                   </c:otherwise>
                   </c:choose>

                   <td width="50%" align="left" nowrap class="boldText">[&nbsp;<fmt:message key='webclient.map.view.header.count'><fmt:param value="${objectsInViewCount}"/></fmt:message>&nbsp;]</td>  

                   <td></td>
           </TR>
</TABLE>