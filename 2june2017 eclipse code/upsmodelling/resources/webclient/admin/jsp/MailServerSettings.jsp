<%-- $Id: MailServerSettings.jsp,v 1.6 2010/10/29 13:46:54 swaminathap Exp $--%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="html"
	uri="http://jakarta.apache.org/struts/tags-html"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el"
	prefix="html-el"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="java.util.Vector"%>
<%@ page import="java.util.Hashtable"%>
<%@ page import="java.util.Properties"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>

<script language="javascript" src="/webclient/common/js/importxml.js"
	type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/dashboard.js"
	type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/validation.js"
	type="text/javascript"></script>


<%@include file="/webclient/admin/jspf/MailServerOperations.jspf"%>

<body onload="setDisplayProps()">

<table width="100%" cellspacing="0" cellpadding="0" border="0"
	class="pageHeaderStr">
	<tbody>
		<tr>
			<td nowrap="nowrap">
			<h1><fmt:message
				key='webclient.admin.mailserver.mailserversettings' /></h1>
			</td>
		</tr>
	</tbody>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<c:if test="${!empty deletefailure}">
		<tr>
			<td align="left" height="40"><img
				src="/webclient/common/images/cross.gif" hspace="4"><span
				style="" class="errorText"><c:out value="${deletefailure}" /></span></td>
		</tr>
	</c:if>
</table>

<div class="popBdr1 popupGBg1"
	style="width: 500px; z-index: 100; position: absolute; left: 400px; top: 100px;" id="addAccountDiv">
<%@include file="/webclient/admin/jspf/MailAccountForm.jspf"%>
</div>
<div id="popUpDiv"></div>



<table id='popUpPosition' width="40%" border="0" cellspacing="0"
	cellpadding="0">
	<tr>
		<td>
		<table width="100%" cellspacing="0" cellpadding="0" border="0">
			<tbody>
				<tr>
					<td width="5"><img height="5" width="5"
						src="/webclient/common/images/corner2-1.gif" /></td>
					<td nowrap="nowrap" valign="top" align="left"
						class="alarmLeftBdrTop"><img height="1" width="1"
						src="/webclient/common/images/spacer.gif" /></td>
					<td height="5" width="5"><img height="5" width="5"
						src="/webclient/common/images/corner2-2.gif" /></td>
				</tr>
				<tr>
					<td class="alarmLeftBdrLeft"><img height="1" width="1"
						src="/webclient/common/images/spacer.gif" /></td>
					<td style="padding: 4px 8px 4px 8px;" valign="top" class="whiteBg">
					<table style="clear: both; margin-bottom: 6px;" width="100%"
						border="0" cellspacing="0" cellpadding="0">
						<tr class="rowSeparator">
							<td><span class="blueLink"><img align="absmiddle"
								class="addIcon" src="/webclient/common/images/spacer.gif" /> <a
								onclick="addAccount();" style="cursor: pointer"
								href="javascript:void(0);"><fmt:message
								key='webclient.admin.mailserver.addmailaccount' /></a></td>
                                                      <c:choose>
                                                      <c:when test="${ReturnPageValue eq 'NPSendEmail'}">
                                                         <td><a href='/admin/ConfigureSendEMailAction.do?toPerform=load&actionToPerform=add&openInNewWindow=false'><fmt:message key='webclient.admin.mailserver.back'/></a></td>
                                                      </c:when>
                                                      <c:otherwise>
                                                         <c:choose>
                                                         <c:when test="${ReturnPageValue eq 'FilterSendEmail'}">
                                                         <td><a href='/admin/ConfigureSendEMailAction.do?toPerform=load&actionToPerform=add&openInNewWindow=true'><fmt:message key='webclient.admin.mailserver.back'/></a></td>
                                                         </c:when>
                                                         <c:otherwise>
                                                         <td>&nbsp;</td>
                                                         </c:otherwise>
                                                         </c:choose>
                                                      </c:otherwise>
                                                      </c:choose>
						</tr>
					</table>
					<table style="clear: both;" id="test1" class="tableBdr2"
						width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
							<table width="100%" cellspacing="0" cellpadding="2" border="0"
								align="left">
								<tbody>
									<tr class="generalTBHeader">
										<td width="80%"><fmt:message
											key='webclient.admin.mailserver.tableheader.name' /></td>
										<td width="10%"><fmt:message key='webclient.admin.mailserver.modify' /></td>
										<td width="10%"><fmt:message key='webclient.admin.mailserver.delete' /></td>
									</tr>
									<c:forEach var="details" items="${accountNames}"
										varStatus="status">

										<c:if test="${status.count%2==0}">
											<tr class="generalOddRow"
												onMouseOut="this.className='generalOddRow'"
												onMouseOver="this.className='generalHover'">
										</c:if>
										<c:if test="${status.count%2!=0}">
											<tr class="generalEvenRow"
												onMouseOut="this.className='generalEvenRow'"
												onMouseOver="this.className='generalHover'">
										</c:if>
										<td><c:out value='${details}' /></td>
										<td style="padding-right: 10px;" align="center"><img
											class="editIcon" src="/webclient/common/images/spacer.gif"
											onclick="javascript:editAccount('<c:out value="${details}"/>','<c:out value="${accountList[details]}"/>');" /></td>
										<td style="padding-right: 10px;" align="center"><img
											class="deleteIcon" src="/webclient/common/images/spacer.gif"
											onClick="javascript:deleteAccount('<c:out value="${details}"/>','<c:out value='${ReturnPageValue}' />');" /></td>

									</c:forEach>
								</tbody>
							</table>
							</td>
						</tr>
					</table>
					</td>
					<td class="alarmLeftBdrRight"><img height="1" width="1"
						src="/webclient/common/images/spacer.gif" /></td>
				</tr>
				<tr>
					<td class="generalCurveLeftBot"><img height="1" width="1"
						src="/webclient/common/images/corner2-4.gif" /></td>
					<td class="alarmLeftBdrBottom"><img height="1" width="1"
						src="/webclient/common/images/spacer.gif" /></td>
					<td class="generalCurveRightBot"><img height="5" width="5"
						src="/webclient/common/images/corner2-3.gif" /></td>
				</tr>
			</tbody>
		</table>
		</td>
	</tr>
</table>
</body>
</html>
