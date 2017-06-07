<%-- $Id: MapTreeViewWidget.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>
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
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<c:forEach var="map" items="${maps}" varStatus="status">

<c:if test="${status.count == 1}">
<tr><td class="dgeneralTBHeader" height="22">&nbsp;<c:out value="${map.displayName}"/><td></tr>
        <c:set var="lists" value="${map.list}" />
         <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
		 <tr><td align="left">
		 <ul style="display:block; padding:4px 0px 0px 0px; margin:4px 0px 4px 4px; ">
                  <li style="background-image:url(webclient/common/images/arrow.gif); list-style: none; padding-left:10px;  background-repeat:no-repeat; background-position:0px 4px; "><a href="<c:out value="${list1.url}" />"><c:out value="${list1.displayName}" /></a></li>
		   </ul>
				  </td></tr>
  </c:forEach></c:if></c:forEach>
</table>
