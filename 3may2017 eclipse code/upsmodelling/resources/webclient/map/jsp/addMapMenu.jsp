<%-- $Id: addMapMenu.jsp,v 1.3 2010/10/29 13:47:10 swaminathap Exp $ --%>
<head>
	<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
</head>
<script language="javascript">
	function removeMapCV(viewId)
	{
	if (viewId == 'ipnet.netmap')
	{
	alert('<fmt:message key="webclient.map.cv.deletesymbol.denied"/> '+ viewId);
	}
	else
	{
	var con = confirm('<fmt:message key="webclient.map.cv.deletesymbol.confirm"/> '+ viewId);
	if ( con != true)
	{
	return;
	}
	else
	{
	url = "/map/MapCVAction.do?method=deleteMap&viewId=" +viewId;  
	location.href = url;
	}
	}
	}

</script>
<table width="100%" class="pageHeaderStr" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15%" nowrap><h1>
				<c:choose>
				<c:when test='${empty mapProps.label}'>
				<fmt:message key='webclient.map.view.header'><fmt:param value="${displayName}"/></fmt:message>
				</c:when>
				<c:otherwise>
				<fmt:message key='webclient.map.view.header'><fmt:param value="${mapProps.label}"/></fmt:message>
				</c:otherwise>
				</c:choose></h1></td>
				<c:choose>
				<c:when test="${isGoogleMap != 'true'}">

				<td width="50%" align="left" nowrap class="boldText">[&nbsp;<fmt:message key='webclient.map.view.header.count'><fmt:param value="${objectsInViewCount}"/></fmt:message>&nbsp;]</td>  
				</c:when>
				<c:otherwise>
				<td width="50%" align="left" nowrap class="boldText">&nbsp;&nbsp;[&nbsp;<fmt:message key='webclient.map.message.addsymbol' />&nbsp;]&nbsp;</td>
				</c:otherwise>
				</c:choose>

				<td>
					<table class="headerInclude" width="10%" border="0" cellpadding="0" cellspacing="3">
						<tr>

							<c:if test="${mapOperations == 'true'}">

						<c:if test="${isGoogleMap != 'true'}">
							<td align="left" nowrap><a class="menuText" href = "/map/MapCVAction.do?selectedTab=Maps&viewId=<c:out value='${selectedNode}'/>&ComplexSearchView=Map&searchAction=MapCVAction&actionToPerform=addMap&displayName=<c:out value='${displayName}'/>"/><fmt:message key='webclient.map.href.addmap' /></a></td>

						<td width="10" align="center" class="textSmall">&nbsp;|</td>
							<td nowrap>
						</c:if>

						</c:if>
						<c:if test="${isGoogleMap != 'true'}">
								<c:if test="${mapOperations == 'false'}">
								<td nowrap align="center">
									</c:if>

									<a class="menuText" href = "/map/MapCVAction.do?selectedTab=Maps&ComplexSearchView=Map&OrNotSupported=true&searchAction=MapCVAction&actionToPerform=modifyMap&viewId=<c:out value='${selectedNode}'/>" ><fmt:message key='webclient.map.propsconfig.configure.map' /></a>

								</td>
						</c:if>

						<c:if test="${mapOperations == 'true'}">
						<c:if test="${isGoogleMap != 'true'}">
						<td width="10" align="left" class="textSmall"> &nbsp;|</td>
						</c:if>
								<td nowrap><a class="menuText" href = "javascript:removeMapCV('<c:out value="${selectedNode}"/>')"><fmt:message key='webclient.map.href.deletemap' /></a></td>
								<c:if test="${isGoogleMap != 'true'}">
								<td width="10" align="left" class="textSmall"> &nbsp;|</td>
								<td nowrap><a class="menuText" href = "/map/AddSymbolPage.do?selectedTab=Maps&mapName=<c:out value='${selectedNode}'/>"><fmt:message key='webclient.map.href.addsymbol' /></a></td>
								</c:if>

								<td width="10" align="left" class="textSmall"> &nbsp;|</td>		
								<td nowrap><a class="menuText" href = "/map/GMapAction.do?parameter=showGMapForm&viewId=<c:out value='${selectedNode}'/>&displayName=<c:out value='${displayName}'/>"/><fmt:message key='webclient.gmap.href.add' /></a></td>

								</c:if>

								<c:choose>
								<c:when test="${linkRequired eq 'true'}">
								<td width="10" align="left" class="textSmall"> &nbsp;|</td>
								<td  nowrap><a class="menuText" href = "/map/AddLinkPage.do?selectedTab=Maps&mapName=<c:out value='${selectedNode}'/>"><fmt:message key='webclient.map.href.addlink' /></a></td>
								<td nowrap class="menuText"> </td>
								</c:when>
								<c:otherwise>
								<td nowrap class="menuText"> </td>
								</c:otherwise>
								</c:choose>	
							</tr>
						</table>
					</td>
				</tr>
			</table>
