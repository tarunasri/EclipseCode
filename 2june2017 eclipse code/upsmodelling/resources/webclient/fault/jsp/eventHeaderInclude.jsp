<%-- $Id: eventHeaderInclude.jsp,v 1.3 2008/11/21 14:53:15 aravinds Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%
String disp = (String) request.getAttribute("displayName");
disp = java.net.URLEncoder.encode(disp,"UTF-8");
request.setAttribute("encodedDisplayName",disp);
%>
    
<table class="headerInclude" width="10%" border="0" cellpadding="0" cellspacing="3">
  <tr>

                <td align="left" nowrap>
                     <a class="menuText" href="/fault/invokeEventCV.do?viewId=<c:out value='${viewId}'/>&actionToPerform=create"><fmt:message key='webclient.fault.customview.addcv'/></a
                ></td>
                 
		 <td width="10" align="center" class="textSmall">&nbsp;|</td>
 
                 <td align="center" nowrap>
        <c:set var="modifyCVurl" value="/fault/invokeEventCV.do?actionToPerform=modify&viewId=${viewId}&displayName=${encodedDisplayName}"/>
                     <a class="menuText" href='<c:out value="${modifyCVurl}"/>'><fmt:message key='webclient.fault.customview.modifycv'/></a></td>
                     
                     <c:if test="${viewId != 'Events'}">
                     
                 <td width="10" align="center" class="textSmall"> &nbsp;|</td>

                 <td  align="center" nowrap>
                     <a class="menuText" href="javascript:removeEventCV('<c:out value="${userName}"/>','<c:out value="${viewId}"/>')"><fmt:message key='webclient.fault.customview.removecv'/></a></td>
               </c:if>

       <td width="10" align="center" class="textSmall"> &nbsp;|</td>

	  <td align="left" nowrap><a class="menuText" href="/fault/eventAdvancedSearch.do?ComplexSearchView=Events&viewId=<c:out value='${viewId}'/>&searchAction=eventAdvancedSearch.do"><fmt:message key='webclient.common.listview.header.operations.search'/></a></td>
	  
	  <td width="10" align="center" class="menuText"> &nbsp;|</td>

        <c:url var="printLink" value="/fault/PrintNetworkEvent.do">
           <c:param name="viewId" value="${viewId}"/>
          <c:param name="actionToPerform" value="print"/>
           <c:param name="displayName" value="${encodedDisplayName}"/>
           <c:param name="viewLength" value="${viewLength}"/>
	   	   <c:param name="FROM_INDEX" value="${startIndex}"/>
           <c:param name="isAscending" value="${isAscending}"/>
           <c:param name="orderByColumn" value="${orderByColumn}"/>
		   <c:if test='${!entity}'>     
		       <c:param name="entity" value="${entity}"/>
		   </c:if>
        </c:url>

	  <td align="left" nowrap><a class="menuText" href="javascript:MM_openBrWindow('<c:out value="${printLink}"/>','Print','menubar=yes,toolbar=no,location=no,status=yes,scrollbars=yes,resizable=yes,width=850,height=600')"><fmt:message key='webclient.common.listview.header.operations.print'/></a></td>
	  
	  <td width="10" align="center" class="menuText">&nbsp;|</td>
	  
	  <td align="left" nowrap> <a class="menuText" href="javascript:openNewWindow('<c:out value="${CUSTOMIZE_COLUMNS_ACTION}?viewId=${viewId}"/>')"><fmt:message key='webclient.common.listview.header.operations.columncustomizer'/></a></td>
	  </td>

  </tr>
</table>
