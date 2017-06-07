<%-- $Id: MainLayout.jsp,v 1.6 2010/10/29 13:47:02 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<html>
<head>
<title>
<fmt:message key="webclient.mainwindow.title"/>
</title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script type="text/javascript" src="/webclient/common/js/importxml.js"></script>
<script type="text/javascript">
	function toggleTree(obj,obj1) {
	var treeStatus='hide';
	var el = document.getElementById(obj);
	var ch = document.getElementById(obj1);
	if ( el.style.display != 'none' ) {
	el.style.display = 'none';
	document.getElementById('hideandshow').className='hidenav';
	}
	else {
	el.style.display = '';
	document.getElementById('hideandshow').className='shownav';
	treeStatus='show';
	}
	var url='/setTreeStatus.do?treeStatus='+treeStatus;
	getHtml(url,"treeStatusResult");
	}
	function treeStatusResult(response)
	{
	}
</script>
<script language="javascript" src="/webclient/common/js/general.js" type="text/javascript"/>
</head>
<body >
<%
        String selectedTab = "";
        selectedTab = (String)request.getParameter("selectedTab");
        if(selectedTab == null || selectedTab.equals(""))
        {
                selectedTab = (String)request.getAttribute("selectedTab");
        }
        if(selectedTab == null || selectedTab.equals(""))
        {
                selectedTab = (String)request.getSession().getAttribute("selectedTab");
        }
        request.setAttribute("currentTab",selectedTab);
%>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><tiles:insert attribute="Tab"/></td>
  </tr>
  <tr>
    <td valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
          <%
          	request.setAttribute("supportTabSelected",request.getParameter("supportlink"));
          %>
		<c:if test="${supportTabSelected != 'yes'}">
		<c:choose>
		<c:when test="${currentTab != 'Home'  && currentTab !='report'}">
		<!--leftside start-->
			<c:choose>
			<c:when test="${TreeNavigationMenu=='show'}">
			<td valign="top" class="leftSide" id="tree" >
			</c:when>					
			<c:otherwise>
					<td valign="top" class="leftside" id="tree" style="display:none;">			
			</c:otherwise>
			</c:choose>

		<img style="clear:both;" border="0" src="/common/images/spacer.gif" class="leftWidth">
		<tiles:insert attribute="Tree"/>
		
<table style="clear:both;" width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="5" ><img src="/webclient/common/images/corner2-1.gif" width="5px" height="5px"></td>
			<td align="left" valign="top" nowrap class="alarmLeftBdrTop" ><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
			<td width="5" height="5" ><img src="/webclient/common/images/corner2-2.gif" width="5px" height="5px"></td>
		  </tr>
		  <tr>
			<td class="alarmLeftBdrLeft"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
			<td valign="top" class="whiteBg"><iframe src="/fault/accPanel.do" class="alarmSummaryFrame" marginheight="0" marginwidth="0" frameborder="0" ></iframe></td>
			<td class="alarmLeftBdrRight"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
		  </tr>
		  <tr>
			<td class="generalCurveLeftBot"><img src="/webclient/common/images/corner2-4.gif" width="1px" height="1px"></td>
			<td class="alarmLeftBdrBottom"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
			<td class="generalCurveRightBot"><img src="/webclient/common/images/corner2-3.gif" width="5px" height="5px"></td>
		  </tr>
		</table>
		</td>	
		<td class="navhide_show_bg" valign="top">
		
			<div style="width: 8px; padding-top: 150px">
		    <div onClick="javascript:toggleTree('tree','hideandshow')">
		    <div id="hideandshow" class="<c:out value='${TreeNavigationMenu}'/>nav"> <img height="1" align="absmiddle" width="8" id="showHideImg" title="Hide Left Navigation" alt="Hide Left Navigation" src="/common/images/spacer.gif" /> </div>
		    </div>
		    </div>
		</td>
		
		<!--left side end-->
		</c:when>
		<c:otherwise>
		</c:otherwise>
		</c:choose>
		</c:if>
		
		
        <td valign="top" class="mainFrame" ><tiles:insert attribute="MainPage"/></td>
		
		
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top">
    <tiles:insert attribute="Footer"/>
    </td>
  </tr>
</table>
</body>
</html>
