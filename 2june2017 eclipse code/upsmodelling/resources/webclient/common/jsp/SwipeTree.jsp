<%-- $Id: SwipeTree.jsp,v 1.8 2008/12/06 07:01:10 aravinds Exp $ --%>

<%@ taglib uri="http://www.adventnet.com/webclient/tree-tags" prefix="tree"%>
<link href="styles/style.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<body>

<table width="98%" cellspacing="0" cellpadding="0" border="0">

	<tree:swipeTree dataSource="TreeModel" treeNodeRenderer="com.adventnet.nms.webclient.common.WebTreeRenderer" showRootNode="false" showLines="false" >      
	<tr >
	<c:set var="treeDisplayName" value="${DISPLAY_NAME}" scope="request"/>
	<%
	String disp = (String) request.getAttribute("treeDisplayName");
	disp = java.net.URLEncoder.encode(disp,"UTF-8");
	request.setAttribute("encodedDisplayName",disp);
	%>
	<c:remove var="treeDisplayName" scope="request"/>
        <c:choose>
        <c:when test="${selectedNode == NODEID  }">
                <td nowrap height="20" align="left" class="selNode">
        </c:when>
        <c:otherwise>
		<td nowrap height="20" align="left">
        </c:otherwise>
        </c:choose>
       <c:choose>
         <c:when test="${NODE_LEVEL != '0'}">
        <c:choose>   
          <c:when test ="${NODE_LEVEL == '1'}">
		<c:url var="urllink" value="${ACTION_LINK}">
             	    <c:param name="selectedTab" value="${selectedTab}"/>
             	    <c:param name="viewId" value="${NODEID}"/>
            	    <c:param name="firstChild" value="false"/>
                    <c:param name="swipe" value="true"/>
             	    <c:param name="nodeClicked" value="${NODEID}"/>
             	    <c:param name="selectedNode" value="${NODEID}"/>
           	</c:url>

		   <%--c:set var="link" value="${ACTION_LINK}?selectedTab=${selectedTab}&viewId=${NODEID}&displayName=${encodedDisplayName}&firstChild=false&swipe=true&nodeClicked=${NODEID}&selectedNode=${NODEID}"/--%>
         </c:when>
        <c:otherwise>
	    <c:url var="urllink" value="${ACTION_LINK}">
                <c:param name="selectedTab" value="${selectedTab}"/>
                <c:param name="viewId" value="${NODEID}"/>
                <c:param name="swipe" value="true"/>
                <c:param name="nodeClicked" value="${NODEID}"/>
                <c:param name="selectedNode" value="${NODEID}"/>
            </c:url>
			<%--c:set var="link" value="${ACTION_LINK}?selectedTab=${selectedTab}&viewId=${NODEID}&displayName=${encodedDisplayName}&swipe=true&nodeClicked=${NODEID}&selectedNode=${NODEID}"/--%>

        </c:otherwise> 
     </c:choose>
	
	<c:set var="link" value="${urllink}&displayName=${encodedDisplayName}"/>

			<c:forEach var="image" items="${pageScope[\"TREE-IMAGES\"]}" varStatus="status">
				<c:choose>
					<c:when test="${image == 'ME'}">
						<a href='<c:out value="${link}"/>'><img src="/webclient/common/images/arrow_treeexpand.gif" alt="Expand/Collapse Item"  border="0" align="absmiddle"></a>
					</c:when>
					<c:when test="${image == 'MC'}">
						<a href='<c:out value="${link}"/>'><img src="/webclient/common/images/arrow_treeexpand.gif" alt="Expand/Collapse Item"  border="0" align="absmiddle"></a>
					</c:when>
					<c:when test="${image == 'PE'}">	
						<a href='<c:out value="${link}"/>'><img src="/webclient/common/images/arrow.gif"  border="0" align="absmiddle"></a>
					</c:when>
					<c:when test="${image == 'PC'}">	
						<a href='<c:out value="${link}"/>'><img src="/webclient/common/images/arrow.gif"  border="0"  align="absmiddle"></a>
					</c:when>
					<c:when test="${image == 'E'}">	
						<a href='<c:out value="${link}"/>'><img src="/webclient/common/images/trcont.png"  border="0"  align="absmiddle"></a>
					</c:when>
					<c:when test="${image == 'L'}">	
						<a href='<c:out value="${link}"/>'><img src="/webclient/common/images/dots.gif"  border="0" align="absmiddle"></a>
					</c:when>
					<c:when test="${image == 'V'}">	
						<a href='<c:out value="${link}"/>'><img src="/webclient/common/images/trvline.png" width="24" border="0" height="24" align="absmiddle"></a>
					</c:when>
					<c:when test="${image == 'S'}">

                    <c:choose>
                       <c:when test="${ status.last }">
                          <img src='/webclient/common/images/dots.gif' border="0"  align="absmiddle">
                       </c:when>
                       <c:otherwise>
                          <img src="/webclient/common/images/trans.gif" border="0" align="absmiddle">
                       </c:otherwise>
                     </c:choose>

					
					</c:when>	
				</c:choose>
			</c:forEach>

	       <c:choose>
              <c:when test="${selectedNode == NODEID  }">
                 <a name='<c:out value="${NODEID}"/>' class="txtGlobalBold" href='<c:out value="${link}"/>'> <c:out value="${DISPLAY_NAME}"/></a>
        
              </c:when>
              <c:otherwise> 
                  <a name='<c:out value="${NODEID}"/>' class="txtGlobal" href='<c:out value="${link}"/>'> <c:out value="${DISPLAY_NAME}"/></a>
              </c:otherwise> 
           </c:choose>
         </c:when>
      </c:choose>

  </td>
</tr>
</tree:swipeTree>
</table>
