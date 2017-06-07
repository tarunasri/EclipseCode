<%-- $Id: inventoryHeaderInclude.jsp,v 1.3 2008/11/21 14:56:20 aravinds Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%
String disp = (String) request.getAttribute("displayName");
disp = java.net.URLEncoder.encode(disp,"UTF-8");
request.setAttribute("encodedDisplayName",disp);
%>

<table class="headerInclude" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <c:if test="${showMenus ne 'false'}">
    <td align="left" nowrap>&nbsp;
      <a class="menuText" href="/topo/topoCVAction.do?ComplexSearchView=Topology&viewId=<c:out value='${viewId}'/>&searchAction=topoCVAction.do&ORNotSupported=true&actionToPerform=create">
      <fmt:message key='webclient.topo.inventorylist.operations.addcv'/>
      </a>
    </td>  
    <td width="10" align="center" class="menuText"> 
      &nbsp;| 
    </td>
    
    <td align="left" nowrap>
    <c:set var="modifyTopoCVurl" value="/topo/topoCVAction.do?ComplexSearchView=Topology&viewId=${viewId}&ORNotSupported=true&searchAction=topoCVAction.do&displayName=${encodedDisplayName}&actionToPerform=modify"/>    
      <a class="menuText" href='<c:out value="${modifyTopoCVurl}"/>'>
      <fmt:message key='webclient.topo.inventorylist.operations.modifycv'/>
      </a>
    </td>
    </c:if>
    <c:if test="${viewId != 'Network Database.CompleteView' && showMenus ne 'false'}">
                     
    <td width="10" align="center" class="menuText"> 
      &nbsp;|
    </td>
    
    <td align="left" nowrap>
      <a class="menuText" href="javascript:removeTopoCV('<c:out value="${viewId}"/>')">
      <fmt:message key='webclient.topo.inventorylist.operations.removecv'/>
      </a>
    </td>

    </c:if>
    <c:if test="${showMenus ne 'false'}"> 
    <td width="10" align="center" class="menuText"> &nbsp;| </td>

    <td align="left" nowrap><a class="menuText" href="/topo/topoAdvancedSearch.do?ComplexSearchView=Topology&viewId=<c:out value='${viewId}'/>&searchAction=topoAdvancedSearch.do"><fmt:message key='webclient.common.listview.header.operations.search'/></a></td>
    
    <td width="10" align="center" class="menuText">&nbsp;|</td>
    </c:if>
        <c:url var="printLink" value="/topo/PrintNetworkInventory.do">
           <c:param name="viewId" value="${viewId}"/>
           <c:param name="displayName" value="${encodedDisplayName}"/>
           <c:param name="viewLength" value="${viewLength}"/>
     <c:param name="FROM_INDEX" value="${startIndex}"/>
           <c:param name="isAscending" value="${isAscending}"/>
           <c:param name="orderByColumn" value="${orderByColumn}"/>
        </c:url>

    <td align="left" nowrap><a class="menuText" href="javascript:MM_openBrWindow('<c:out value="${printLink}"/>','Print','menubar=yes,toolbar=no,location=no,status=yes,scrollbars=yes,resizable=yes,width=800,height=600')"><fmt:message key='webclient.common.listview.header.operations.print'/></a></td>
    <c:if test="${showMenus ne 'false'}">
    <td width="10" align="center" class="menuText">&nbsp;|</td>
    
    <td align="left" nowrap> <a class="menuText" href="javascript:openNewWindow('<c:out value="${CUSTOMIZE_COLUMNS_ACTION}?viewId=${viewId}"/>')"><fmt:message key='webclient.common.listview.header.operations.columncustomizer'/></a></td>
   </c:if>
  </tr>
</table>
