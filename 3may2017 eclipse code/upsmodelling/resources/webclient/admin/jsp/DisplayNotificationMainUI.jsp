<%-- $Id: DisplayNotificationMainUI.jsp,v 1.4 2008/12/05 09:19:24 venkatramanan Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/admin/jspf/NotificationOperations.jspf" %>

<body onload="listNotifications('<c:out value='${selectedNotifications}'/>')"> 

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.filters.notifications'/>
</h1></td>
	        <td align="right">
<table class="headerInclude" cellspacing="0" cellpadding="0"  border=0 width="95%">
<tr><td width="10"></td>
<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr height="25"> 
    <td nowrap class="text"><b>&nbsp;&nbsp;<fmt:message key='webclient.admin.notifications.actions'/> :</b></td>
    <td >
    <select style="width:150" styleClass="formStyle" onchange="javascript:listNotifications(this.options[this.options.selectedIndex].value)">
<option value="Suppress Action"
<c:if test="${selectedNotifications == 'Suppress Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.suppressaction'/>

<option value="Run Command Action"
<c:if test="${selectedNotifications == 'Run Command Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.runcmdaction'/>
<option value="Send Trap Action"
<c:if test="${selectedNotifications == 'Send Trap Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.sendtrapaction'/>
<option value="Send Email Action"
<c:if test="${selectedNotifications == 'Send Email Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.sendemailaction'/>
<option value="Custom Filter"
<c:if test="${selectedNotifications == 'Custom Filter'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.customfilteraction'/>
</select>
    </td>
    <td nowrap align="right" class="text"><b><fmt:message key='webclient.admin.notifications.add'/> :</b> &nbsp;&nbsp;<a href="javascript:suppressAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.suppress'/></a> &nbsp;&nbsp;| &nbsp;&nbsp;<a href="javascript:runCmdAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.runcmd'/></a> &nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:sendTrapAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.sendtrap'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:sendEmailAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.sendemail'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:customFilterAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.customfilter'/></a>&nbsp;&nbsp;
    </td>
  </tr>
</table>
</td></tr></table>

</td>
        
        </tr>
</table>

<%--table cellspacing="0" cellpadding="0"  border=0 width="95%">
<tr><td width="10"></td>
<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr class="header2Bg" height="25"> 
    <td nowrap class="text"><b>&nbsp;&nbsp;<fmt:message key='webclient.admin.notifications.actions'/> :</b></td>
    <td width="15%">
    <select style="width:150" styleClass="formStyle" onchange="javascript:listNotifications(this.options[this.options.selectedIndex].value)">
<option value="Suppress Action"
<c:if test="${selectedNotifications == 'Suppress Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.suppressaction'/>

<option value="Run Command Action"
<c:if test="${selectedNotifications == 'Run Command Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.runcmdaction'/>
<option value="Send Trap Action"
<c:if test="${selectedNotifications == 'Send Trap Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.sendtrapaction'/>
<option value="Send Email Action"
<c:if test="${selectedNotifications == 'Send Email Action'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.sendemailaction'/>
<option value="Custom Filter"
<c:if test="${selectedNotifications == 'Custom Filter'}">
selected="true"
</c:if>
/><fmt:message key='webclient.admin.notifications.customfilteraction'/>
</select>
    </td>
    <td nowrap align="right" class="text"><b><fmt:message key='webclient.admin.notifications.add'/> :</b> &nbsp;&nbsp;<a href="javascript:suppressAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.suppress'/></a> &nbsp;&nbsp;| &nbsp;&nbsp;<a href="javascript:runCmdAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.runcmd'/></a> &nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:sendTrapAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.sendtrap'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:sendEmailAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.sendemail'/></a>&nbsp;&nbsp; | &nbsp;&nbsp;<a href="javascript:customFilterAction('add','')" class="mnuText"><fmt:message key='webclient.admin.notifications.customfilter'/></a>&nbsp;&nbsp;
    </td>
  </tr>
</table>
</td></tr></table--%>
<br>

<div id="Suppress Action" class="hide">
<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.runtimeadmin.notifications.list.link'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table cellspacing="0" cellpadding="0"  border=0 width="100%">
<tr><td width="10"></td>
<td>
    <table border=0 class="dbborder1" cellspacing="0" cellpadding="0" width="100%">

        <tr height=25 class="header2Bg">
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.name'/></td>
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.modify'/></td>    
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.delete'/></td>
        </tr>

     <c:choose>    
            <c:when test="${empty SuppressAction}">
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td align="center" colspan="3" class="boldText"><fmt:message key='webclient.admin.filters.emptysuppress'/></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
        <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
            </c:when>
            
            <c:otherwise>   
    <c:forEach var="suppress" items="${SuppressAction}" varStatus="status">
    <c:choose>
    <c:when test="${status.count%2==0}">
    <tr height="20" class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr height="20" class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td align="center" width="40%">
    <span class="text"><c:out value="${suppress}"/></span>
    </td>
    <td width="30%" align="center">
    <a class="adminLink" href ="javascript:suppressAction('modify','<c:out value='${suppress}'/>')"><img src="/webclient/common/images/edit.gif" border="0"></a>
    </td>
    <td width="30%" align="center">
     <a class="adminLink" href ="javascript:suppressAction('delete','<c:out value='${suppress}'/>')"><img src="/webclient/common/images/cross.gif" border="0"></a>
    </td>
    </tr>
    </c:forEach>
        </c:otherwise>
    </c:choose>    
    </table>
</td></tr></table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</div>


<div id="Run Command Action" class="hide">
<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.runtimeadmin.notifications.list.link'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table cellspacing="0" cellpadding="0"  border=0 width="100%">
<tr><td width="10"></td>
<td>
<table border=0 class="dbborder1" cellspacing="0" cellpadding="0" width="100%">

        <tr height=25 class="header2Bg">
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.name'/></td>
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.modify'/></td>    
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.delete'/></td>
        </tr>

     <c:choose>    
            <c:when test="${empty RunCmd}">
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td align="center" colspan="3" class="boldText"><fmt:message key='webclient.admin.filters.emptyruncmd'/></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
        <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
            </c:when>
            
            <c:otherwise>   
        <c:forEach var="cmd" items="${RunCmd}" varStatus="status">
    <c:choose>
    <c:when test="${status.count%2==0}">
    <tr height="25" class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr height="25" class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td align="center" width="40%">
    <span class="text"><c:out value="${cmd}"/></span>
    </td>

    <td width="30%" align="center">
    <a class="adminLink" href ="javascript:runCmdAction('modify','<c:out value='${cmd}'/>')"><img src="/webclient/common/images/edit.gif" border="0"></a>
    </td>
    <td width="30%" align="center">
     <a class="adminLink" href ="javascript:runCmdAction('delete','<c:out value='${cmd}'/>')"><img src="/webclient/common/images/cross.gif" border="0"></a>
    </td>
    </tr>
    </c:forEach>
    </c:otherwise>    
    </c:choose>    
    </table>
</td></tr></table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</div>

<div id="Send Trap Action" class="hide">
<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.runtimeadmin.notifications.list.link'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table cellspacing="0" cellpadding="0"  border=0 width="100%">
<tr><td width="10"></td>
<td>
<table border=0 class="dbborder1" cellspacing="0" cellpadding="0" width="100%">

        <tr height=25 class="header2Bg">
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.name'/></td>
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.modify'/></td>    
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.delete'/></td>
        </tr>

     <c:choose>    
            <c:when test="${empty SendTrap}">
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td align="center" colspan="3" class="boldText"><fmt:message key='webclient.admin.filters.emptysendtrap'/></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
        <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
            </c:when>
            
            <c:otherwise>   
    <c:forEach var="trap" items="${SendTrap}" varStatus="status">
    <c:choose>
    <c:when test="${status.count%2==0}">
    <tr height="25" class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr height="25" class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td align="center" width="40%">
    <span class="text"><c:out value="${trap}"/></span>
    </td>
    <td width="30%" align="center">
    <a class="adminLink" href ="javascript:sendTrapAction('modify','<c:out value='${trap}'/>')"><img src="/webclient/common/images/edit.gif" border="0"></a>
    </td>
    <td width="30%" align="center">
     <a class="adminLink" href ="javascript:sendTrapAction('delete','<c:out value='${trap}'/>')"><img src="/webclient/common/images/cross.gif" border="0"></a>
    </td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    </table>
</td></tr></table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</div>

<div id="Send Email Action" class="hide">
<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.runtimeadmin.notifications.list.link'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table cellspacing="0" cellpadding="0"  border=0 width="100%">
<tr><td width="10"></td>
<td>
<table border=0 class="dbborder1" cellspacing="0" cellpadding="0" width="100%">

        <tr height=25 class="header2Bg">
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.name'/></td>
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.modify'/></td>    
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.delete'/></td>
        </tr>

     <c:choose>    
            <c:when test="${empty SendEMail}">
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td align="center" colspan="3" class="boldText"><fmt:message key='webclient.admin.filters.emptysendemail'/></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
        <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
            </c:when>
            
            <c:otherwise>   
    <c:forEach var="email" items="${SendEMail}" varStatus="status">
    <c:choose>
    <c:when test="${status.count%2==0}">
    <tr height="25" class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr height="25" class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td align="center" width="40%">
    <span class="text"><c:out value="${email}"/></span>
    </td>
     <td width="30%" align="center">
    <a class="adminLink" href ="javascript:sendEmailAction('modify','<c:out value='${email}'/>')"><img src="/webclient/common/images/edit.gif" border="0"></a>
    </td>
    <td width="30%" align="center">
     <a class="adminLink" href ="javascript:sendEmailAction('delete','<c:out value='${email}'/>')"><img src="/webclient/common/images/cross.gif" border="0"></a>
    </td>
    </tr>
    </c:forEach>
    </c:otherwise>     
    </c:choose>    
    </table>
</td></tr></table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</div>

<div id="Custom Filter" class="hide">
<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.runtimeadmin.notifications.list.link'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table cellspacing="0" cellpadding="0"  border=0 width="100%">
<tr><td width="10"></td>
<td>
<table border=0 class="dbborder1" cellspacing="0" cellpadding="0" width="100%">

        <tr height=25 class="header2Bg">
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.name'/></td>
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.modify'/></td>    
        <td align="center" valign="middle" class="boldText" nowrap><fmt:message key='webclient.admin.notifications.delete'/></td>
        </tr>

     <c:choose>    
            <c:when test="${empty CustomFilter}">
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td align="center" colspan="3" class="boldText"><fmt:message key='webclient.admin.filters.emptycustomfilters'/></td></tr>
               <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
               <tr height="22" class="reportsEvenRow"><td colspan="3"></td></tr>
        <tr height="22" class="reportsOddRow"><td colspan="3"></td></tr>
            </c:when>
            
            <c:otherwise>   
    <c:forEach var="cf" items="${CustomFilter}" varStatus="status">
    <c:choose>
    <c:when test="${status.count%2==0}">
    <tr height="25" class="reportsOddRow">
    </c:when>
    <c:otherwise>
    <tr height="25" class="reportsEvenRow">
    </c:otherwise>
    </c:choose>
    <td align="center" width="40%">
    <span class="text"><c:out value="${cf}"/></span>
    </td>
    <td width="30%" align="center">
    <a class="adminLink" href ="javascript:customFilterAction('modify','<c:out value='${cf}'/>')"><img src="/webclient/common/images/edit.gif" border="0"></a>
    </td>
    <td width="30%" align="center">
     <a class="adminLink" href ="javascript:customFilterAction('delete','<c:out value='${cf}'/>')"><img src="/webclient/common/images/cross.gif" border="0"></a>
    </td>
    </tr>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    </table>
</td></tr></table>
</td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</div>


<br>

