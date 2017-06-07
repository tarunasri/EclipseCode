<%-- $Id: SimpleTree.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tree" uri="http://www.adventnet.com/webclient/tree-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el"  %>

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/treeSelection.js"></SCRIPT>

<%--
<%@ taglib uri="http://www.adventnet.com/webclient/tree-tags" prefix="tree"%>
<%@ taglib prefix="core" uri="http://java.sun.com/jstl/core" %>
<link href="styles/style.css" rel="stylesheet" type="text/css">

--%>
<body>
<table cellspacing="0" cellpadding="0" border="0">


 <tree:simpleTree dataSource="TreeModel" treeNodeRenderer="com.adventnet.nms.webclient.common.WebTreeRenderer" showRootNode="false" showLines="false" openFirstChild="true" >

      <tr nowrap>

        <c:url var="link" value="${expand_collapse_link}">
           <c:param name="nodeClicked" value="${NODEID}"/>
        </c:url>

        <c:set var="level" value="${NODE_LEVEL}"/>
        <c:choose>
           <c:when test="${level != '0'}">
              <td nowrap height="23">
           </c:when>
           <c:otherwise>
              <td nowrap height="25" class="treeHeader">
           </c:otherwise>
        </c:choose>
        <c:choose>
           <c:when test="${level != '0'}">
           <img src="/webclient/common/images/trans.gif" width="4" height="1">
              <c:forEach var="image" items="${pageScope[\"TREE-IMAGES\"]}" varStatus="status">
                 <c:choose>
                    <c:when test="${image == 'ME'}">
                       <a href='<c:out value="${link}"/>&<c:out value="${querystring}"/>'><img src="/webclient/common/images/minus.gif" alt="Expand/Collapse Item" border="0" align="absmiddle"></a>
                    </c:when>
                    <c:when test="${image == 'MC'}">
                       <a href='<c:out value="${link}"/>&<c:out value="${querystring}"/>'><img src="/webclient/common/images/minus.gif" alt="Expand/Collapse Item" border="0" align="absmiddle"></a>
                    </c:when>
                    <c:when test="${image == 'PE'}">
                       <a href='<c:out value="${link}"/>&<c:out value="${querystring}"/>'><img src="/webclient/common/images/plus.gif"  border="0" align="absmiddle"></a>
                    </c:when>
                    <c:when test="${image == 'PC'}">
                       <a href='<c:out value="${link}"/>&<c:out value="${querystring}"/>'><img src="/webclient/common/images/plus.gif" border="0" align="absmiddle"></a>
                    </c:when>
                    <c:when test="${image == 'E'}">
                       <img src="/webclient/common/images/trcont.png" width="24" border="0" height="24" align="absmiddle">
                    </c:when>
                    <c:when test="${image == 'L'}">
                       <img src="/webclient/common/images/trend.png" width="24" border="0" height="24" align="absmiddle">
                    </c:when>
                    <c:when test="${image == 'V'}">
                       <img src="/webclient/common/images/trvline.png" width="24" border="0" height="24" align="absmiddle">
                    </c:when>
                    <c:when test="${image == 'S'}">
                    <c:choose>
                       <c:when test="${ status.last }">
          <img src='/webclient/common/images/treedot.gif' border="0" width="15" align="absmiddle">
                       </c:when>
                       <c:otherwise>
                        <img src="/webclient/common/images/trans.gif" border="0" width="9" height="15" align="absmiddle">
                       </c:otherwise>
                     </c:choose>
                    </c:when>
                 </c:choose>
              </c:forEach>
           </c:when>
        </c:choose>

        <c:choose>
         <c:when test="${NODE_LEVEL != '0'}">

          <c:url var="treelink" value="${ACTION_LINK}">
             <c:param name="selectedNode" value="${NODEID}"/>
             <c:param name="selectedTab" value="${selectedTab}"/>
             <c:param name="viewId" value="${NODEID}"/>
             <c:param name="displayName" value="${DISPLAY_NAME}"/>
             <c:param name="nodeClicked" value="${NODEID}"/>
          </c:url>

	  <c:choose>
            <c:when test="${selectedNode == NODEID}">
             <a name='<c:out value="${NODEID}"/>' class="boldText" href='<c:out value="${treelink}"/>'> <c:out value="${DISPLAY_NAME}"/></a>
            </c:when>
            <c:otherwise> 
             <a name='<c:out value="${NODEID}"/>' class="text" href='<c:out value="${treelink}"/>'> <c:out value="${DISPLAY_NAME}"/></a>
            </c:otherwise> 
          </c:choose>
         </c:when>
        </c:choose>

      </td>
    </tr>

</tree:simpleTree>


<%--
<tree:simpleTree dataSource="Tree_Model" treeNodeRenderer="com.adventnet.webclient.components.tree.XmlTreeNodeRenderer">
	<tr>
		<td nowrap height="24">
			<core:url var="link" value="${pageContext.request.requestURL}">
				<core:param name="nodeClicked" value="${NODEID}"/>
				<core:param name="normal" value="true"/>
			</core:url>
			<core:forEach var="image" items="${pageScope[\"TREE-IMAGES\"]}">
				<core:choose>
					<core:when test="${image == 'ME'}">
						<a href='<core:out value="${link}"/>'><img src="images/tree/trminusend.png" alt="Expand/Collapse Item" width="24" height="24" border="0" align="absmiddle"></a>
					</core:when>
					<core:when test="${image == 'MC'}">
						<a href='<core:out value="${link}"/>'><img src="images/tree/trminuscont.png" alt="Expand/Collapse Item" width="24" height="24" border="0" align="absmiddle"></a>
					</core:when>
					<core:when test="${image == 'PE'}">	
						<a href='<core:out value="${link}"/>'><img src="images/tree/trplusend.png" width="24" border="0" height="24" align="absmiddle"></a>
					</core:when>
					<core:when test="${image == 'PC'}">	
						<a href='<core:out value="${link}"/>'><img src="images/tree/trpluscont.png" width="24" border="0" height="24" align="absmiddle"></a>
					</core:when>
					<core:when test="${image == 'E'}">	
						<a href='<core:out value="${link}"/>'><img src="images/tree/trcont.png" width="24" border="0" height="24" align="absmiddle"></a>
					</core:when>
					<core:when test="${image == 'L'}">	
						<a href='<core:out value="${link}"/>'><img src="images/tree/trend.png" width="24" border="0" height="24" align="absmiddle"></a>
					</core:when>
					<core:when test="${image == 'V'}">	
						<a href='<core:out value="${link}"/>'><img src="images/tree/trvline.png" width="24" border="0" height="24" align="absmiddle"></a>
					</core:when>
					<core:when test="${image == 'S'}">
						<img src="images/tree/trans.gif" border="0" width="15" height="15" align="absmiddle">
					</core:when>	
				</core:choose>
			</core:forEach>
			<core:if test = "${IMAGE_ICON != null && IMAGE_ICON ne \"\"}">
				<img src='<core:out value="${IMAGE_ICON}"/>' border="0" align="absmiddle">
			</core:if>	
			<a href='<core:out value="${ACTION_LINK}"/>' class="menuitem"><core:out value="${DISPLAY_NAME}"/></a>
			</font>
		</td>
	</tr>
</tree:simpleTree>
--%>
</table>
