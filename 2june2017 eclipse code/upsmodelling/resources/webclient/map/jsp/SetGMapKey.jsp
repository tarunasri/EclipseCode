<%--$Id: SetGMapKey.jsp,v 1.2 2010/10/29 13:47:10 swaminathap Exp $--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>




<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td align="middle">

			<table class="tabBtmLine" border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr><td class="header2"><fmt:message key='webclient.gmap.keyform.title'/>
				</td></tr>
			</table>

			<div style="height:10px;"></div>

			<form action="/map/GMapAction.do?parameter=saveGMapKey&selectedTab=Maps&viewId=<c:out value='${param.viewId}'/>&firstChild=<c:out value='${param.firstChild}'/>&swipe=<c:out value='${param.swipe}'/>&nodeClicked=<c:out value='${param.nodeClicked}'/>&selectedNode=<c:out value='${selectedNode}'/>&displayName=<c:out value='${param.displayName}'/>" method="POST" >
				<table border="0" align="center" cellpadding="0" cellspacing="10">
					<tr>
						<td colspan="2" align="center" class="edited"><a href="http://www.google.com/apis/maps/signup.html" target="_blank"><fmt:message key="webclient.gmap.keyform.signup"/></a></td>
					</tr>
					<tr>
						<td colspan="2" align="center" class="header3"><fmt:message key="webclient.gmap.keyform.key"/></td>
					</tr>
					<td align="center"><input type="text" style="width:500px" name="GoogleMapKey" />
						<tr><td colspan="2" align="center"><input name="Submit" type="submit" id="Submit" style="width:200px;" value="<fmt:message key="webclient.gmap.keyform.submit" />" ></td>
						</tr>
					</table>
				</form>
			</td>
	</tr></table>
