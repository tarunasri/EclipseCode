<%-- $Id: InvokeEventFilterForm.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/admin/jspf/EventFilterOperations.jspf" %>
<%@include file="/webclient/admin/jspf/NotificationOperations.jspf" %>

<script language="javascript" src="/webclient/common/js/validation.js"></script>

<body onload="javascript:loadForm('<c:out value='${AdvProps}'/>','<c:out value='${name}'/>','<c:out value='${selectedNotification}'/>')">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.filters.event'/></h1></td>
		<td align="right"> </td>
     </tr>
    </table>


<html:form action="/EventFilterAction" onsubmit="return submitForm()">
<html-el:hidden property="toPerform" value=""/>
<input type="hidden" name="actionToPerform" value="<c:out value='${actionToPerform}'/>">
<input type="hidden" name="selitems" value="">
<input type="hidden" name="AdvProps" value="">
<input type="hidden" name="selNotifications" value="">
<input type="hidden" name="oldFilterName" value=""/>

<table style="margin-bottom:10px;" width="70%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.filters.addeventfilter'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

<table>
<tr>
<td>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr height="30">
<td width="1%" class="text"></td>
<td width="30%" height="25" class="text"><fmt:message key='webclient.admin.filters.name'/></td>
<td width="25%"><html-el:text styleClass="formStyle" property="name" readonly="${readOnly}"/><span class="mandatory">&nbsp;*</span>&nbsp;<span  class="textSmall"><fmt:message key='webclient.fault.customview.mandatory.message'/></span></td>
<td width="45%"></td>
</tr>

<tr> 
    <td>&nbsp;</td>
    <td height="30" class="text"><fmt:message key='webclient.admin.filters.source'/></td>
    <td><html:text styleClass="formStyle" property="source"/></td>
    <td></td>
 </tr>
      
  <tr> 
    <td>&nbsp;</td>
    <td height="30" class="text"><fmt:message key='webclient.admin.filters.severity'/></td>
    <td><html:text styleClass="formStyle" property="stringseverity"/></td>
    <td></td>
  </tr>

  <tr height="30" id="msg"> 
    <td width="1%" class="text"><img src="/webclient/common/images/spacer.gif" width="10" height="10"></td>
    <td width="12%" height="25" class="text"><fmt:message key='webclient.admin.filters.text'/></td>
    <td width="87%"><html:text styleClass="formStyle" property="text"/></td>
  </tr>
  <tr height="30" id="category"> 
    <td>&nbsp;</td>
    <td height="25" class="text"><fmt:message key='webclient.admin.filters.category'/></td>
    <td><html:text styleClass="formStyle" property="category"/></td>
  </tr>
  <tr height="30" id="domain"> 
    <td>&nbsp;</td>
    <td height="25" class="text"><fmt:message key='webclient.admin.filters.domain'/></td>
    <td><html:text styleClass="formStyle" property="domain"/></td>
  </tr>
  <tr height="30" id="nwk"> 
    <td>&nbsp;</td>
    <td height="25" class="text"><fmt:message key='webclient.admin.filters.network'/></td>
    <td><html:text styleClass="formStyle" property="network"/></td>
  </tr>
  <tr height="30" id="node"> 
    <td>&nbsp;</td>
    <td height="25" class="text"><fmt:message key='webclient.admin.filters.node'/></td>
    <td><html:text styleClass="formStyle" property="node"/></td>
  </tr>
  <tr height="30" id="entity"> 
    <td>&nbsp;</td>
    <td height="25" class="text"><fmt:message key='webclient.admin.filters.entity'/></td>
    <td><html:text styleClass="formStyle" property="entity"/></td>
  </tr>

</table>
<br>

<table cellspacing="0" cellpadding="0"  border=0 width="100%">
<tr><td width="10">&nbsp;&nbsp;</td>
<td>
<table width="100%" class="notificationTable" cellspacing="0" cellpadding="2">

  <tr>
    <td width="10">&nbsp;</td>
    <td align="center" class="text">&nbsp;</td>
    <td class="text" nowrap></td>        
    <td></td>
    <td>&nbsp;</td>
  </tr>      

  <tr>
    <td align="center" class="text">&nbsp;</td>
        <td colspan="3" nowrap><span class="boldText"><fmt:message key='webclient.admin.notifications.operations'/> : </span>&nbsp;&nbsp;
<select style="width:140px;" onchange="javascript:openNotificationWindow(this.options[this.options.selectedIndex].value);">
<option value="New Notification"><span class="text"><fmt:message key='webclient.admin.notifications.newnotification'/>...</span></option>
<option value="-----"><span class="adminLink">--------</span></option>
<option value="suppress"><span class="adminLink"><fmt:message key='webclient.admin.notifications.suppressaction'/></span></option>
<option value="runcmd"><span class="adminLink"><fmt:message key='webclient.admin.notifications.runcmdaction'/></span></option>
<option value="sendTrap"><span class="adminLink"><fmt:message key='webclient.admin.notifications.sendtrapaction'/></span></option>
<option value="sendEmail"><span class="adminLink"><fmt:message key='webclient.admin.notifications.sendemailaction'/></span></option>
<option value="customFilter"><span class="adminLink"><fmt:message key='webclient.admin.notifications.customfilteraction'/></span></option>
</select>
</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>

   <tr>
    <td>&nbsp;</td>
    <td align="center" class="text">&nbsp;</td>
    <td class="text" nowrap></td>        
    <td></td>
    <td>&nbsp;</td>
  </tr>      
         

  <tr> 
    <td>&nbsp;</td>    
    <td width="20%" align="center" class="text"><b><fmt:message key='webclient.admin.filters.availablenotif'/></b></td>
    <td width="16%">&nbsp;</td>
    <td width="24%" align="center" class="text"><b><fmt:message key='webclient.admin.filters.associatednotif'/></b></td>
    <td width="40%">&nbsp;</td>
  </tr>
<tr> 
    <td>&nbsp;</td>
    <td><html:select size="6" style="height:auto;width:170px" styleClass="formStyle" multiple="true" property="AvailableActions" onclick="javascript:setAvailableNotificationsFlag();">
        <c:forEach var="actionList" items="${Notifications}" varStatus="status">
	 <option value='<c:out value="${NotificationType[actionList.key]}"/>' <c:if test="${actionList.key eq selectedNotification}">selected</c:if>> <c:out value="${actionList.key}"/></option> 
<%--   <html-el:option value="${NotificationType[actionList.key]}"><c:out value="${actionList.key}"/></html-el:option>--%>
        </c:forEach>
        </html:select>
    </td>

    <td align="center" valign="middle">&nbsp;&nbsp; <input type=button class="button" value="&nbsp;&nbsp;>>&nbsp;&nbsp;" onclick="addNotification()"/>
&nbsp;&nbsp;<p></p>
 <input type=button class="button" value="&nbsp;&nbsp;<<&nbsp;&nbsp;" onclick="removeNotification()"/>&nbsp;
    </td>    

    <td><html-el:select size="6" style="height:auto;width:170px" styleClass="formStyle" multiple="true" property="SelectedActions" onclick="javascript:setSelectedNotificationsFlag();">
        <c:forEach var="actionList" items="${SelectedNotifications}" varStatus="status">
<%--   <html-el:option value="${NotificationType[actionList]}"><c:out value="${actionList}"/></html-el:option> --%>
        <option value='<c:out value="${NotificationType[actionList]}"/>' <c:if test="${actionList eq selectedNotification}">selected</c:if>> <c:out value="${actionList}"/></option>
	
        </c:forEach>
        </html-el:select>
    </td>

    <td valign="top">
<a href="javascript:moveup()"><img title="<fmt:message key='webclient.admin.filters.moveup'/>" src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" hspace="5" border="0" align="middle"></a> 
      <p><br></p>
<a href="javascript:movedown()"><img title="<fmt:message key='webclient.admin.filters.movedown'/>" src="/webclient/common/images/<c:out value = "${selectedskin}"/>/down.gif" hspace="5" border="0" align="middle"></a> 

    </td>

  </tr>
  <tr height="35"> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="center">&nbsp;<input type="button" class="formStyleCheckBox" value="&nbsp;&nbsp;<fmt:message key="webclient.admin.notifications.configure"/>&nbsp;&nbsp;"  onclick="javascript:configureNotifications()"/></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

</td>
</tr>
</table>

<br>

</td>


<td width="20%" valign="top" align="right"></td></tr>
</table>



  <html-el:hidden name="AddEventFilterForm" property="rowCount"/>
      
  <c:choose>
     <c:when test="${AddEventFilterForm.map.rowCount == 0}">    
        <table width="72%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
        <td width="1%" class="text"><img src="/webclient/common/images/spacer.gif" width="10" height="10"></td>
        <td width="99%" height="25" class="rowtbborder"><fmt:message key='webclient.admin.filters.toadd'/> <fmt:message key='webclient.admin.filters.customproperties'/>
        <a href="javascript:userProperties()"> <img border="0" src="/webclient/common/images/<c:out value = "${selectedskin}"/>/down.gif" hspace="5" align="absmiddle" > </td>
       <td width=" align="absmiddle"34%">&nbsp;</td>
       </tr>
       </table>
     </c:when>
  </c:choose>      

               
      
   <c:if test="${AddEventFilterForm.map.rowCount != 0}">      
       <table width="72%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
        <td width="1%" class="text"><img src="/webclient/common/images/spacer.gif" width="10" height="10"></td>
        <td width="99%" height="20" class="rowtbborder"><fmt:message key='webclient.admin.filters.customproperties'/></td>
       <td width=" align="absmiddle"34%">&nbsp;</td>
       </tr>
       </table>
       <table width="72%" border="0" cellspacing="0" cellpadding="0">
       <tr> 
       <td width="2%" class="text"><img src="/webclient/common/images/spacer.gif" width="10" height="10"></td>
       <td width="46%" height="25" class="text"><b><fmt:message key='webclient.admin.filters.attribute'/></b></td>
       <td width="52%" class="text"><b><fmt:message key='webclient.admin.filters.value'/></b></td>
       </tr>
       <tr> 
                    
       <c:forEach begin="0" end="${AddEventFilterForm.map.rowCount-1}" varStatus="status"> 
       <tr height="30"> 
       <td>&nbsp;</td>
       <td height="24" class="text"> <html-el:text property="userPropsName" styleClass="formStyle" value="${AddEventFilterForm.map.userPropsName[status.index]}"/></td>
      <td><html-el:text property="userPropsValue" styleClass="formStyle" value="${AddEventFilterForm.map.userPropsValue[status.index]}"/></td>
       </tr>
       </c:forEach>       
 
       <tr> 
           <td height="25">&nbsp;</td>
           <td colspan="2" class="text"> 
           <input name="morebutton" type="button" class="button" value="<fmt:message key='webclient.admin.filters.morebutton'/>" onClick="more()"> &nbsp;
           <input name="fewerbutton" type="button" class="button" value="<fmt:message key='webclient.admin.filters.fewerbutton'/>" onClick="fewer()">
           </td>
       </tr>
</table>
   </c:if>    


<br>
<table width="72%" border="0" cellspacing="0" cellpadding="0">
  <tr > 
    <td height="1" width="10" ><img src="/webclient/common/images/spacer.gif"  width="10" height="20"></td>
    <td height="24" colsapn="4" align="center" class="header2Bg"><input type="submit" class="button" value="<fmt:message key='webclient.admin.filters.submitbutton'/>" /> 
    <input type="button" class="button" value="<fmt:message key='webclient.admin.filters.cancelbutton'/>" onclick="javascript:location.href='/admin/EventFilters.do';"/> </td>
    </td>
  </tr>
</table>
</td>
          <td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</html:form>
