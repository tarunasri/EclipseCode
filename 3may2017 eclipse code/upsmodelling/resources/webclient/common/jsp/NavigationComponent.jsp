<%-- $Id: NavigationComponent.jsp,v 1.9 2010/10/29 13:47:02 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tree" uri="http://www.adventnet.com/webclient/tree-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/treeSelection.js"></SCRIPT>

<script>
function validateValues()
{
	if(eval("document.dashboard.name").value == "")
	{
		alert("Enter a valid device name");
		return false;
	}
	return true;
}

function hideTreeNodes(divName)
{
        var divElement = document.getElementById(divName);
        var dispStyle = divElement.style.display;
        document.getElementById('DiscoveryDiv').style.display='none';
        document.getElementById('SecurityDiv').style.display='none';
        document.getElementById('ConfigDiv').style.display='none';
        document.getElementById('MMDiv').style.display='none';
        document.getElementById('AdminDiv').style.display='none';
        document.getElementById('ToolsDiv').style.display='none';
       
        if(dispStyle == 'none')
        {
                divElement.style.display='';
        }
        else
        {
                divElement.style.display='none';
        }
}
</script>

<c:choose>
    <c:when test="${selectedTab == 'Home'}">
             <table style="margin-bottom:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
           <td style="padding-right:15px; padding-top:7px;" width="220" valign="top">   
        <c:forEach var="map" items="${maps}" varStatus="status"> 
        <c:set var="lists" value="${map.list}" />
        
               <table style="margin-bottom:5px;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <c:choose>  
              
                <c:when test="${status.count==1}">  
                     <tr onClick="javascript:showHide('KD','IV','<c:out value="${selectedskin}"/>');">
                     <td width="19" ><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/close-arrow.gif" name="KD1" border="0" align="absmiddle" id="KD1" style="cursor:pointer;"/></td>  
                </c:when>
              
                <c:otherwise>
                    <tr onClick="javascript:showHide('IV','KD','<c:out value="${selectedskin}"/>');">  
                    <td width="19" ><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/close-arrow.gif" name="IV1" border="0" align="absmiddle" id="IV1" style="cursor:pointer;"/></td>  
              </c:otherwise>
      
              </c:choose>        
               
                <td width="98%"  nowrap="nowrap" class="homeMenuNav boldTxt"><fmt:message key='${map.displayName}'/></td>
                <td width="3"  nowrap="nowrap" class="boldText"><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/top-right1.gif"></td>
              </tr>
              <c:choose>  
              <c:when test="${status.count==1}">   
              <tr id="KD">
              </c:when>
              <c:otherwise>
              <tr style="display:none;" id="IV">  
              </c:otherwise>
              </c:choose>        
                <td class="homeMenuBg"><img src="/webclient/common/images/spacer.gif" width="1" height="1"></td>
		<td valign="top" id="homeMenuBg" class="homeMenuBg">
			<div style="overflow:auto; height: 120px;">
				<ul >

                                <c:forEach var="list1" items="${lists}" varStatus="loopstatus"> 
				  <li><a href="<c:out value="${list1.url}" />"><c:out value="${list1.displayName}" /></a></li>
                                 </c:forEach> 
			 </ul>
			 <div>
				</td>
                <td class="homeMenuBg"><img src="/webclient/common/images/spacer.gif" width="1" height="1"></td>
              </tr>
              <tr>
                <td><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/bot-left1.gif" ></td>
                <td class="homeMenuNav"><img src="/webclient/common/images/spacer.gif" height="1" width="1" border="0"  /></td>
                <td><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/bot-right1.gif"></td>
              </tr>
            </table>

 </c:forEach>  
</c:when> 



<c:otherwise> 

<table width="100%" border="0" cellpadding="0" cellspacing="0">

        <tr>
          <td>
	
	
	<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td ><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/leftsiteL.gif" border="0" width="5" height="27"></td>
          <td  nowrap class="generalCurveTopLeftBg" style="padding-right:10px;"><fmt:message key='${tabProps[selectedTab]}' /></td>
          <td ><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/leftsiteR.gif" border="0" width="5" height="27"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding whiteBg" >
        <c:choose>
           <c:when test='${Treetype =="SimpleTree"}'>
               <jsp:include page="/webclient/common/jsp/SimpleTree.jsp" /> 
           </c:when>
		   
          <c:when test='${Treetype =="HideRootTree"}'>
                <jsp:include page="/webclient/common/jsp/HideRootTree.jsp" />
           </c:when>
		   
          <c:when test='${Treetype =="HideLinesTree"}'>
                <jsp:include page="/webclient/common/jsp/HideLinesTree.jsp" />
           </c:when>
           <c:otherwise>
             <jsp:include page="/webclient/common/jsp/SwipeTree.jsp" />
           </c:otherwise>
  </c:choose>
</td>
 <td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
<%-- The Tree model has been moved to a new file SimpleTree.jsp file --%>

<%--
      <tree:simpleTree dataSource="TreeModel" treeNodeRenderer="com.adventnet.nms.webclient.common.WebTreeRenderer" showRootNode="false" showLines="false" openFirstChild="true" nodeToOpen="path">

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

--%>

</td>
</tr>

</table>
</c:otherwise>
</c:choose>











<%--
    <tr height="17"><td colspan="2"> </td></tr>
    <c:forEach var="map" items="${maps}" > 
    <tr> 
    <c:set var="lists" value="${map.list}" />
    <td colspan="2" height="26" class="leftHeader"><fmt:message key='${map.displayName}'/></td>
    
    </tr>

    <c:forEach var="list1" items="${lists}" varStatus="loopstatus"> 
    <c:choose> 
    <c:when test="${loopstatus.count % 2 ==0}" > 
    <tr>
    <td height=24 nowrap class="txtGlobal"><img src="/webclient/common/images/dots.gif"  border="0" align="absmiddle">&nbsp;&nbsp; <a class="txtGlobal" href="<c:out value="${list1.url}" />"><c:out value="${list1.displayName}" /></a> 
     </td>
     </tr>
     </c:when> 
    
     <c:otherwise> 
     <tr> 
     <td height=17 nowrap class="txtGlobal" > <img src="/webclient/common/images/dots.gif"  border="0"> &nbsp;&nbsp;<a  class="txtGlobal" href="<c:out value="${list1.url}" />"><c:out value="${list1.displayName}" /></a> 
     </td>
     </tr>
     </c:otherwise> 
     </c:choose>        
     </c:forEach> 

    </c:forEach>  
  </table>  
--%>
