<%-- $Id: sendEmailActionForm.jsp,v 1.5 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/admin/jspf/NotificationOperations.jspf" %>
<html>
<head>
<title><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.sendemailaction'/></title>
</head>
<script language="javascript" src="/webclient/common/js/validation.js"></script>


<c:choose>
<c:when test="${openInNewWindow == 'false'}">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap">
<a href="/admin/NotificationProfiles.do"><h1><fmt:message key='webclient.admin.filters.notifications'/></h1></a>
</td>
	        <td align="right">
<table class="headerInclude" cellspacing="0" cellpadding="0"  border=0 width="95%">
<tr><td width="10"></td>
<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr height="25"> 
    <td nowrap class="text"></td>
    <td >    </td>
    <td nowrap align="right" class="text"><b><fmt:message key='webclient.admin.notifications.add'/> :</b> &nbsp;&nbsp;<a href="javascript:suppressAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.suppress'/></a> &nbsp;&nbsp;| &nbsp;&nbsp;<a href="javascript:runCmdAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.runcmd'/></a> &nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:sendTrapAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.sendtrap'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:sendEmailAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.sendemail'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:customFilterAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.customfilter'/></a>&nbsp;&nbsp;
    </td>
  </tr>
</table>
</td></tr></table>
</td>
        
        </tr>
</table>


<html:form action="/ConfigureSendEMailAction" onsubmit="return validateEMailForm()">
<html-el:hidden property="toPerform" value="${toPerform}"/>
<html-el:hidden property="openInNewWindow" value="${openInNewWindow}"/>

	
	 <table style="margin-bottom:10px;" width="60%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >


<table border=0 class="dbborder1" cellspacing="0" cellpadding="3" width="100%" align="left">

<tr height=25 class="header2Bg"><td colspan="3" align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.sendemailaction'/></td></tr>

<tr class="reportsEvenRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.notifname'/></span></td>
<td width="50%" align="center"><html-el:text styleClass="formStyle" property="NotificationName" readonly="${readOnly}"/></td>
<td width="20%"><label/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.smtpaccount'/></span></td>
<td align="center"><html:select styleClass="formStyle" property="SMTPAccount">
			<c:forEach var="account" items="${smtpAccounts}">
			    <html-el:option value="${account}"/>
			</c:forEach>
		</html:select></td>
<td><input type="button" class="button" onclick="javascript:location.href='/admin/MailServerSettingsadmin.do?method=defaults&returnPageVal=NPSendEmail';" value='<fmt:message key="webclient.admin.notifications.managesmtp"/>'/>
</td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.subject'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Subject"/></td>
    <td>
<html:select style="width:100" styleClass="formStyle" name="EMailActionForm" property="appendToSubject" onchange="javascript:appendEMailSubject(this.options[this.options.selectedIndex].value)">
<html:option value=""><span class="text"><fmt:message key='webclient.admin.notifications.subjectheaders'/></span></html:option>
<html:option value="--------"></html:option>
<html:option value="category"/>
<html:option value="entity"/>
<html:option value="text"/>
<html:option value="message"/>
<html:option value="severity"/>
<html:option value="source"/>
<html:option value="groupName"/>
</html:select>
</td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.message'/></span></td>
<td align="center"><html:textarea rows="6" styleClass="formStyle" property="Message"/></td>
<td>
<html:select style="width:100" styleClass="formStyle" name="EMailActionForm" property="appendToMessage" onchange="javascript:appendMessageBody(this.options[this.options.selectedIndex].value)">
<html:option value=""><span class="text"><fmt:message key='webclient.admin.notifications.messageheaders'/></span></html:option>
<html:option value="--------"/>
<html:option value="category"/>
<html:option value="entity"/>
<html:option value="text"/>
<html:option value="message"/>
<html:option value="severity"/>
<html:option value="source"/>
<html:option value="groupName"/>
</html:select>
</td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.attachment'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Attachment"/></td>
<td><label/></td>
</tr>

<c:set var="colspan" value="3"/>
<c:set var="className" value="reportsOddRow"/>
<%@include file="/webclient/admin/jspf/SeparateThreadDetails.jspf" %>

<tr>
<td colspan="3" align="center">
<input type="submit" class="button" value="<fmt:message key='webclient.admin.filters.submitbutton'/>"/>
<input type="button" class="button" value="<fmt:message key='webclient.admin.filters.cancelbutton'/>" onclick="javascript:location.href='/admin/NotificationProfiles.do';"/>
</td>
</tr>
</table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</html:form>
</c:when>


<c:otherwise>
<html:form action="/ConfigureSendEMailAction" onsubmit="return validateEMailForm()">
<html-el:hidden property="toPerform" value="${toPerform}"/>
<html-el:hidden property="openInNewWindow" value="${openInNewWindow}"/>
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >


<table border=0 class="dbborder1" cellspacing="0" cellpadding="3" width="100%" align="left">

<tr height=25 class="header2Bg"><td colspan="3" align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.sendemailaction'/></td></tr>

<tr class="reportsEvenRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.notifname'/></span></td>
<td width="50%" align="center"><html-el:text styleClass="formStyle" property="NotificationName" readonly="${readOnly}"/></td>
<td width="20%"><label/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.smtpaccount'/></span></td>
<td align="center"><html:select styleClass="formStyle" property="SMTPAccount">
			<c:forEach var="account" items="${smtpAccounts}">
			    <html-el:option value="${account}"/>
			</c:forEach>
		</html:select></td>
<td><input type="button" class="button" onclick="javascript:location.href='/admin/MailServerSettingsadmin.do?method=defaults&returnPageVal=FilterSendEmail';" value='<fmt:message key="webclient.admin.notifications.managesmtp"/>'/>
</td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.subject'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Subject"/></td>
    <td>
<html:select style="width:100" styleClass="formStyle" name="EMailActionForm" property="appendToSubject" onchange="javascript:appendEMailSubject(this.options[this.options.selectedIndex].value)">
<html:option value=""><span class="text"><fmt:message key='webclient.admin.notifications.subjectheaders'/></span></html:option>
<html:option value="--------"></html:option>
<html:option value="category"/>
<html:option value="entity"/>
<html:option value="text"/>
<html:option value="message"/>
<html:option value="severity"/>
<html:option value="source"/>
<html:option value="groupName"/>
</html:select>
</td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.message'/></span></td>
<td align="center"><html:textarea rows="6" styleClass="formStyle" property="Message"/></td>
<td>
<html:select style="width:100" styleClass="formStyle" name="EMailActionForm" property="appendToMessage" onchange="javascript:appendMessageBody(this.options[this.options.selectedIndex].value)">
<html:option value=""><span class="text"><fmt:message key='webclient.admin.notifications.messageheaders'/></span></html:option>
<html:option value="--------"/>
<html:option value="category"/>
<html:option value="entity"/>
<html:option value="text"/>
<html:option value="message"/>
<html:option value="severity"/>
<html:option value="source"/>
<html:option value="groupName"/>
</html:select>
</td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="30%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.attachment'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Attachment"/></td>
<td><label/></td>
</tr>

<c:set var="colspan" value="3"/>
<c:set var="className" value="reportsOddRow"/>
<%@include file="/webclient/admin/jspf/SeparateThreadDetails.jspf" %>

<tr>
<td colspan="3" align="center">
<input type="submit" class="button" value="<fmt:message key='webclient.admin.filters.submitbutton'/>"/>
<input type="button" class="button" value="<fmt:message key='webclient.admin.filters.cancelbutton'/>" onclick="javascript:window.close();"/>
</td>
</tr>
</table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</html:form>
</c:otherwise>


</c:choose>

</html>
