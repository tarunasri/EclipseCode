<%-- $Id: TabComponent.jsp,v 1.10 2010/10/29 13:47:02 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/feedbackValidation.jspf" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/common/jspf/ModalPopup.jspf" %>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Properties"%>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/treeSelection.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/validation.js"></SCRIPT>
<%
Properties props = (Properties) request.getAttribute("tabIdVsselectedNames");
for(Enumeration keys=props.keys();keys.hasMoreElements();)
{
	String key = (String)keys.nextElement();
	String value = props.getProperty(key);
	value = URLEncoder.encode(value,"UTF-8");
	props.setProperty(key,value);
}
%>
<table class="headerBg1" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
  	<td width="5%" valign="bottom"><img class="headerLogo" src="/webclient/common/images/spacer.gif"></td>
    <td valign="bottom">
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="top" colspan="3"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td class="toplinks" valign="top" align="right" nowrap style="padding-top:2px;" ><a href="javascript:openWindow('/ChangePassword.do','ChangePassword','430','280')">
                  <fmt:message key='webclient.common.changepassword.link.name'/>
                  </a> | <a href="javascript:openWindow('/skinSelection.do','SkinSelection','380','250')">
                  <fmt:message key='webclient.common.skinselection.personalise'/>
                  </a> | <a href="/help/index.html" target="_blank" >
                  <fmt:message key='webclient.common.helplink'/>
                  </a> | <a href="/Logout.do" target="_top">
                  <fmt:message key='webclient.common.logout.link'/>
                  </a> [
                  <span class="boldTxt"><c:out value="${userName}"/></span>
                  ]&nbsp;&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr>
          <td valign="bottom" align="left"><table  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td><div id="tabsJ">
                    <ul>
                      <%
        request.setAttribute("supportTabSelected",request.getParameter("supportlink"));
%>
                      <c:forEach var="nodeId" items="${Tabs}" varStatus="loopstatus">
                        <c:choose>
                          <c:when test="${ nodeId == selectedTab }">
                            <c:choose>
                              <c:when test="${supportTabSelected == 'yes'}">
                                <li> 
                              </c:when>
                              <c:otherwise>
                                <li id="current"> 
                              </c:otherwise>
                            </c:choose>
                            <c:url var="link" value="${tabIdVsselectedURL[nodeId]}">
                              <c:param name="selectedTab" value="${nodeId}"/>
                              <c:param name="viewId" value="${selectedIds[nodeId]}"/>
                            </c:url>
                            <%--c:set var="link" value="${tabIdVsselectedURL[nodeId]}?selectedTab=${nodeId}&viewId=${selectedIds[nodeId]}&displayName=${tabIdVsselectedNames[nodeId]}"/--%>
		<c:set var="i18nval">
		<fmt:message key='webclient.common.tabname.${tabProps[nodeId]}'/>
		</c:set>
		<c:set var="i18nkey" value='webclient.common.tabname.${tabProps[nodeId]}'/>
			<c:choose>
			<c:when test='${i18nkey eq i18nval}'>
			<a href='<c:out value="${link}&displayName=${tabIdVsselectedNames[nodeId]}"/>' nowrap> <span>
			<c:out value='${tabProps[nodeId]}'/>
			</c:when>
			<c:otherwise>
                            <a href='<c:out value="${link}&displayName=${tabIdVsselectedNames[nodeId]}"/>' nowrap> <span>
                            <fmt:message key='webclient.common.tabname.${tabProps[nodeId]}'/>
			</c:otherwise>
			</c:choose>
                            </span></a>
                            </li>
                          </c:when>
                          <c:otherwise>
                            <li>
                              <c:url var="link" value="${tabIdVsselectedURL[nodeId]}">
                                <c:param name="selectedTab" value="${nodeId}"/>
                                <c:param name="viewId" value="${selectedIds[nodeId]}"/>
                              </c:url>
                              <%--c:set var="link" value="${tabIdVsselectedURL[nodeId]}?selectedTab=${nodeId}&viewId=${selectedIds[nodeId]}&displayName=${tabIdVsselectedNames[nodeId]}"/--%>
		<c:set var="i18nval">
		<fmt:message key='webclient.common.tabname.${tabProps[nodeId]}'/>
		</c:set>
		<c:set var="i18nkey" value='webclient.common.tabname.${tabProps[nodeId]}'/>
			<c:choose>
			<c:when test='${i18nkey eq i18nval}'>
			<a href='<c:out value="${link}&displayName=${tabIdVsselectedNames[nodeId]}"/>' nowrap> <span>
			<c:out value='${tabProps[nodeId]}'/>
			</c:when>
			<c:otherwise>
                            <a href='<c:out value="${link}&displayName=${tabIdVsselectedNames[nodeId]}"/>' nowrap> <span>
                            <fmt:message key='webclient.common.tabname.${tabProps[nodeId]}'/>
			</c:otherwise>
			</c:choose>

                              </span></a></li>
                          </c:otherwise>
                        </c:choose>
                      </c:forEach>
                    </ul>
                  </div></td>
              </tr>
            </table></td>
          <td style="padding-bottom:7px;" align="right"><table  border="0" cellspacing="0" cellpadding="0">
              <tr>
                <form name="ssearchForm" action="/topo/topoAdvancedSearch.do" method="GET" onsubmit='return simpleSearch()'>
                  <td>
                  <td>
	<input class="searchBox1" onBlur="if(this.value=='')this.value='<fmt:message key="webclient.common.search.find"/>...';" onfocus="if(this.value=='<fmt:message key="webclient.common.search.find"/>...')this.value='';" value='<fmt:message key="webclient.common.search.find"/>...' type="text" name="simpleSearchName"></td>
                  <td><input class="searchBut1" type="button" name="Submit" value="" onClick="javascript:simpleSearch();"></td>
                  <td nowrap style="padding-left:10px; padding-right:10px;"><a href="/topo/topoAdvancedSearch.do?ComplexSearchView=Topology&viewId=Network%20Database.CompleteView&searchAction=/topoAdvancedSearch.do&selectedTab=Network%20Database">
                    <fmt:message key="webclient.common.search.adv"/>
                    </a></td>
                  <input type="hidden" name="requestid" value="SNAPSHOT">
                  <input type="hidden" name="showMenus" value="false">
                  <input type="hidden" name="selectedNode" value="Network Database.CompleteView">
                  <input type="hidden" name="selectedTab" value="Network Database">
	          <input type="hidden" name="ssimpleSearch" value="yes">	
	  	</form>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td colspan="2" class="strip"><img src="/webclient/common/images/spacer.gif"></td>
  </tr>
</table>
