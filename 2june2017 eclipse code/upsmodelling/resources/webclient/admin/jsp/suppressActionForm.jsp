<%-- $Id: suppressActionForm.jsp,v 1.4 2007/10/17 15:46:03 gnanasekar Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<title><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.suppress'/> <fmt:message key='webclient.admin.notifications.action'/></title>
</head>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/admin/jspf/NotificationOperations.jspf" %>

<body onload="javascript:loadtheForm()">




<c:choose>
<c:when test="${openInNewWindow == 'false'}">

<html:form action="/ConfigureSuppressAction" onsubmit="return validateSuppressForm()">
<html-el:hidden property="toPerform" value="${toPerform}"/>
<html-el:hidden property="openInNewWindow" value="${openInNewWindow}"/>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><a href="/admin/NotificationProfiles.do"><h1><fmt:message key='webclient.admin.filters.notifications'/></h1></a>
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
<table style="margin-bottom:10px;" width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" style="padding-right:20px;">
	
	
	
	 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table border=0 class="dbborder1" cellspacing="0" cellpadding="3" width="100%">

<tr height=25 class="header2Bg"><td colspan="2" align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.suppressaction'/></td></tr>

<tr class="reportsEvenRow" height="22">

<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.name'/></span></td>
<td align="center"><html-el:text styleClass="formStyle" property="NotificationName" readonly="${readOnly}"/></td>
</tr>

<tr class="reportsOddRow" height="22">
<td><span class="boldText"><fmt:message key='webclient.admin.notifications.suppressall'/></span></td>
    <td align="center"><html:radio property="SuppressAll" value="true" onclick="javascript:disableField()"/><span class="text"><fmt:message key='Yes'/></span>&nbsp;&nbsp;&nbsp;
<html:radio property="SuppressAll" value="false" onclick="javascript:enableField()"/><span class="text"><fmt:message key='No'/></span>
</td>  
</tr>

<tr class="reportsEvenRow" height="22">
<td><span class="boldText"><fmt:message key='webclient.admin.notifications.suppressinterval'/> ( <fmt:message key='webclient.admin.notifications.seconds'/>)</span></td>
<td align="center"><html:text styleClass="formStyle" property="SuppressInterval"/></td>
</tr>

<tr class="reportsOddRow" height="22">
<td colspan="2" align="center">
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

<html:form action="/ConfigureSuppressAction" onsubmit="return validateSuppressForm()">
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
<table border=0 class="dbborder1" cellspacing="0" cellpadding="3" width="100%" align="center">
<tr height=25 class="header2Bg"><td colspan="2" align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.suppressaction'/></td></tr>

<tr class="reportsEvenRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.name'/></span></td>
<td align="center"><html-el:text styleClass="formStyle" property="NotificationName" readonly="${readOnly}"/></td>
</tr>

<tr class="reportsOddRow" height="22">
<td><span class="boldText"><fmt:message key='webclient.admin.notifications.suppressall'/></span></td>
    <td align="center"><html:radio property="SuppressAll" value="true" onclick="javascript:disableField()"/><span class="text"><fmt:message key='Yes'/></span>&nbsp;&nbsp;&nbsp;
<html:radio property="SuppressAll" value="false" onclick="javascript:enableField()"/><span class="text"><fmt:message key='No'/></span>
</td>  
</tr>

<tr class="reportsEvenRow" height="22">
<td><span class="boldText"><fmt:message key='webclient.admin.notifications.suppressinterval'/> ( <fmt:message key='webclient.admin.notifications.seconds'/>)</span></td>
<td align="center"><html:text styleClass="formStyle" property="SuppressInterval"/></td>
</tr>

<tr class="reportsOddRow" height="22">
<td colspan="2" align="center">
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

</body>
</html>
