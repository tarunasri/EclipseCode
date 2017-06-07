<%-- $Id: sendTrapActionForm.jsp,v 1.5 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<title><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.sendtrapaction'/></title>
</head>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/admin/jspf/NotificationOperations.jspf" %>

<script language="javascript" src="/webclient/common/js/validation.js"></script>


<script>
    function hideVarbinds()
    {
        document.getElementById('varbindRow').className='hide';
        document.getElementById('hideVarbindRow').className='';
    }
    function showVarbinds()
    {
        document.getElementById('varbindRow').className='';
        document.getElementById('hideVarbindRow').className='hide';
    }
</script>
<body onload="javascript:loadTrapForm()">

<c:choose>
<c:when test="${openInNewWindow == 'false'}">

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


<html:form action="/ConfigureSendTrapAction" onsubmit="return validateTrapForm()">
<html-el:hidden property="toPerform" value="${toPerform}"/>
<html-el:hidden property="openInNewWindow" value="${openInNewWindow}"/>
<input type="hidden" name="varbinds" value="">

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

<table border=0 class="dbborder1" cellspacing="0" cellpadding="3" width="100%" align="center">

<tr height=25 class="header2Bg"><td colspan="3" align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.sendtrapaction'/></td></tr>

<tr class="reportsEvenRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.name'/></span></td>
<td align="center"><html-el:text styleClass="formStyle" property="NotificationName" readonly="${readOnly}"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.trapdest'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="TrapDestination"/></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.port'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Port"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.community'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Community"/></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.sysuptime'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="SysUpTime"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td align="left"><span class="boldText">
<html-el:radio property="V1_V2" value="v1" onclick="javascript:disableTheFields()"/><fmt:message key='webclient.admin.notifications.v1'/></span></td>
<td align="center"><span class="boldText"><html-el:radio property="V1_V2" value="v2c" onclick="javascript:disableTheFields()"/><fmt:message key='webclient.admin.notifications.v2c'/></span></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.enterprise'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Enterprise"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.gt'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="GT"/></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.st'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="ST"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.trapoid'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="TrapOID"/></td>
</tr>

<tr id="varbindRow" class="hide" height="22">

    <td colspan="2"><span class="boldText"><a href="javascript:hideVarbinds()"><fmt:message key='webclient.admin.filters.hidevarbind'/> >></a></span>&nbsp;<br>

<table class="notificationTable" width="100%" cellpadding="3" cellspacing="0">
<tr colspan="2"><td></td></tr>
<tr>
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.varbinds'/></span></td>
<td align="center"><html:select style="height:auto" size='4' multiple="true" styleClass="formStyle" property="VariableBindings" onchange="javascript:fillProperties()">
<c:forEach var="vb" items="${varbindsList}" varStatus="status">
    <html-el:option value="${vb}"/>
</c:forEach>
</html:select>
</td>
</tr>
<tr height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.oid'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="OIDValue"/></td>
</tr>
<tr height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.oidtype'/></span></td>
<td align="center"><html:select styleClass="formStyle" property="SNMPType">
<html-el:option value="STRING"/>
<html-el:option value="IPADDRESS"/>
<html-el:option value="OPAQUE"/>
<html-el:option value="OBJID"/>
<html-el:option value="INTEGER"/>
<html-el:option value="GAUGE"/>
<html-el:option value="COUNTER"/>
<html-el:option value="TIMETICKS"/>
</html:select>
</td>
</tr>

<tr height="22">
<td align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.oidval'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="SNMPVal"/></td>
</tr>
<tr height="22"><td align="right">
    </td><td align="center"><input type="button" class="button" value=" <fmt:message key='webclient.admin.notifications.oidadd'/> " onclick="javascript:addVariableBindings()"/>&nbsp;
<input type="button" class="button" value="<fmt:message key='webclient.admin.notifications.oidmodify'/>" onclick="javascript:modifyVariableBindings()"/>&nbsp;
<input type="button" class="button" value="<fmt:message key='webclient.admin.notifications.varbinddelete'/>" onclick="javascript:deleteVariableBindings()"/></td></tr>
<tr colspan="2"><td></td></tr>
</table>
</td></tr>


<tr id="hideVarbindRow" class="reportsEvenRow" height="22">
<td colspan="2"><span class="boldText"><a href="javascript:showVarbinds()"><fmt:message key='webclient.admin.filters.showvarbind'/> >></a></span><br></td>
</tr>

<c:set var="colspan" value="2"/>
<c:set var="className" value="reportsOddRow"/>
<%@include file="/webclient/admin/jspf/SeparateThreadDetails.jspf" %>

<tr>
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

<html:form action="/ConfigureSendTrapAction" onsubmit="return validateTrapForm()">
<html-el:hidden property="toPerform" value="${toPerform}"/>
<html-el:hidden property="openInNewWindow" value="${openInNewWindow}"/>
<input type="hidden" name="varbinds" value="">
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

<tr height=25 class="header2Bg"><td colspan="3" align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.configure'/> <fmt:message key='webclient.admin.notifications.sendtrapaction'/></td></tr>

<tr class="reportsEvenRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.name'/></span></td>
<td align="center"><html-el:text styleClass="formStyle" property="NotificationName" readonly="${readOnly}"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.trapdest'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="TrapDestination"/></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.port'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Port"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.community'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Community"/></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.sysuptime'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="SysUpTime"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="50%" align="left"><span class="boldText">
<html-el:radio property="V1_V2" value="v1" onclick="javascript:disableTheFields()"/><fmt:message key='webclient.admin.notifications.v1'/></span></td>
<td align="center"><span class="boldText"><html-el:radio property="V1_V2" value="v2c" onclick="javascript:disableTheFields()"/><fmt:message key='webclient.admin.notifications.v2c'/></span></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.enterprise'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="Enterprise"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.gt'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="GT"/></td>
</tr>
<tr class="reportsEvenRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.st'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="ST"/></td>
</tr>
<tr class="reportsOddRow" height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.trapoid'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="TrapOID"/></td>
</tr>
<%--
<tr id="varbindRow" class="hide" height="22">

    <td colspan="2"><span class="boldText"><a href="javascript:hideVarbinds()"><fmt:message key='webclient.admin.filters.hidevarbind'/> >></a></span>&nbsp;
--%>
<tr height="22">
    <td colspan="2"><span class="boldText"><br><fmt:message key='webclient.admin.filters.varbind'/></span>&nbsp;

<table class="notificationTable" width="98%">
<tr colspan="2"><td></td></tr>
<tr>
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.varbinds'/></span></td>
<td align="center"><html:select multiple="true" styleClass="formStyle" property="VariableBindings" onchange="javascript:fillProperties()">
<c:forEach var="vb" items="${varbindsList}" varStatus="status">
    <html-el:option value="${vb}"/>
</c:forEach>
</html:select>
</td>
</tr>
<tr height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.oid'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="OIDValue"/></td>
</tr>
<tr height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.oidtype'/></span></td>
<td align="center"><html:select styleClass="formStyle" property="SNMPType">
<html-el:option value="STRING"/>
<html-el:option value="IPADDRESS"/>
<html-el:option value="OPAQUE"/>
<html-el:option value="OBJID"/>
<html-el:option value="INTEGER"/>
<html-el:option value="GAUGE"/>
<html-el:option value="COUNTER"/>
<html-el:option value="TIMETICKS"/>
</html:select>
</td>
</tr>

<tr height="22">
<td width="50%" align="left"><span class="boldText"><fmt:message key='webclient.admin.notifications.oidval'/></span></td>
<td align="center"><html:text styleClass="formStyle" property="SNMPVal"/></td>
</tr>
<tr height="22"><td align="right">
    </td><td align="center"><input type="button" class="button" value=" <fmt:message key='webclient.admin.notifications.oidadd'/> " onclick="javascript:addVariableBindings()"/>&nbsp;
<input type="button" class="button" value="<fmt:message key='webclient.admin.notifications.oidmodify'/>" onclick="javascript:modifyVariableBindings()"/>&nbsp;
<input type="button" class="button" value="<fmt:message key='webclient.admin.notifications.varbinddelete'/>" onclick="javascript:deleteVariableBindings()"/>
</td></tr>
<tr colspan="2"><td></td></tr>
</table>
</td></tr>

<%--
<tr id="hideVarbindRow" class="reportsEvenRow" height="22">
<td colspan="2"><span class="boldText"><a href="javascript:showVarbinds()"><fmt:message key='webclient.admin.filters.showvarbind'/> >></a></span></td>
</tr>
--%>

<c:set var="colspan" value="2"/>
<c:set var="className" value="reportsEvenRow"/>
<%@include file="/webclient/admin/jspf/SeparateThreadDetails.jspf" %>

<tr>
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

</html>
