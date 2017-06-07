<%-- $Id: criteriaBasedDiscovery.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.discovery.title'/></title>
<%@include file="/webclient/admin/jspf/discoveryConfiguration.jspf" %>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
</head>

<body>
<form name="CriteriaBasedDiscovery" action="/admin/SaveCriteriaBasedDiscovery.do" onSubmit="return false;" >

  <table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
    <tr> 
        <td>
        <table border=0 cellspacing=0 cellpadding=0 width=100%>
	<tr>
		<td>
                    <table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                        <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.discovery.criteriabased.title'/></h1></td>
        		<td align="right"></td>
                     </tr>
                    </table>
        </td>
    </tr>
    <tr> 
      <td>

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
              <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px" /></td>
              <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.runtimeadmin.disccriteria.link'/></span></td>
              <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="5px" height="1px" /></td>
        </tr>
              
        <tr>
              <td class="generalCurveLeft">&nbsp;</td>
              <td valign="top">

        <table width="100%" border="0" align="left" cellpadding="2" cellspacing="0">
          <tr> 
            <td height="30" colspan="3" nowrap class="text" align="center"><fmt:message key='webclient.admin.discovery.criteriabased.message'/>
            <td class="text" nowrap valign="bottom"><img src="/webclient/common/images/tick.gif" align="middle"><fmt:message key='webclient.admin.discovery.criteriabased.allowcriteria'/> &nbsp; &nbsp;<img src="/webclient/common/images/del.gif" align="middle"><fmt:message key='webclient.admin.discovery.criteriabased.disallowcriteria'/></td>
                </tr>

       <c:if test="${!empty successMsg}">
          <tr align="center">  
              <td class="responseText" colspan="4"><img src="/webclient/common/images/tick.gif" hspace="4"><c:out value="${successMsg}"/></td>
          </tr>

       </c:if>

          <tr> 
         <c:choose>
           <c:when test="${action != 'modCriteria'}">     
            <td width="22%" class="text"> <input type="checkbox" name="allowCrit" ><fmt:message key='webclient.admin.discovery.criteriabased.allowcriteria'/></td>
            <td width="22%" height="50" class="text"> 
              <select name="propName" class="formStyle" style="width:130">
                <option value="name" selected>name</option>
                <option value="type">type</option>
                <option value="ipAddress">ipAddress</option>
                <option value="sysOID">sysOID</option>
                <option value="isSNMP">isSNMP</option>
              </select> 
            </td>
            <td width="26%" class="text"> <input name="propValue" type="text" class="formStyle"></td>
            <td width="30%" align="left"> 
                <input name="add" type="button" class="button" value="<fmt:message key='webclient.admin.discovery.criteriabased.add'/>" onclick="javascript:performOperation('addCriteria')"> 
                <input name="cancel" type="reset" class="button" value="<fmt:message key='webclient.common.reset.button'/>" > 
            </td>
           </c:when>     
           <c:otherwise>     
            <td width="22%" class="text"><input type="checkbox" name="allowCrit" <c:if test="${modCriteria == 'true'}">checked</c:if>><fmt:message key='webclient.admin.discovery.criteriabased.allowcriteria'/></td><input type="hidden" name="propName" value="<c:out value='${modName}'/>">
            <td width="26%" class="text"><c:out value="${modName}"/></td>  
            <td width="26%" class="text"><input name="propValue" type="text" class="formStyle" value='<c:out value="${modValue}"/>'></td>
            <td width="30%" align="left"> 
                <input name="add" type="button" class="button" value="<fmt:message key='webclient.admin.discovery.criteriabased.modify'/>" onclick="javascript:performOperation('modCriteria')"> 
                <input name="cancel" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:history.back(-1)"> 
            </td>


           </c:otherwise>     
         </c:choose>

          </tr>
          <tr>
                <td width="22%">&nbsp;</td>
                <td width="26%">&nbsp;</td>
                <td class="textSmall" colspan="2"><fmt:message key='webclient.admin.discovery.criteriabased.infomessage'/></td>
          </tr>      

                <input type="hidden" name="actionToPerform" value="">
                <input type="hidden" name="action" value="">
                <input type="hidden" name="modCriteria" value="<c:out value='${modCriteria}'/>">
                <input type="hidden" name="modName" value="">
                <input type="hidden" name="modValue" value="">
          <tr> 
            <td align="center" valign="bottom" class="text"><fmt:message key='webclient.admin.discovery.criteriabased.allowcriteria'/></td>
            <td height="50" valign="bottom" class="text"><fmt:message key='webclient.admin.discovery.criteriabased.propertyname'/></td>
            <td valign="bottom" class="text"><fmt:message key='webclient.admin.discovery.criteriabased.propertyvalue'/></td>
            <td align="left">&nbsp;</td>
          </tr>

           <c:if test="${empty allowCriteria && empty disAllowCriteria}">      
               <tr> 
                  <td align="center" class="text">-</td>
                  <td height="25" class="text">-</td>
                  <td class="text">-</td>
                  <td class="text">&nbsp;</td>
                </tr> 
          </c:if>    
              
           <c:set var="acName" value=""/>
           <c:set var="acValue" value=""/>     
           <c:forEach var="prop" items="${allowCriteria}">     
                
                <input type="hidden" name="acName" value="<c:out value='${prop.key}'/>">
                <input type="hidden" name="acValue" value="<c:out value='${prop.value}'/>">
                <tr> 
                  <td align="center" class="text"><img src="/webclient/common/images/tick.gif"></td>
                  <td height="25" class="text"><c:out value="${prop.key}"/></td>
                  <td class="text"><c:out value="${prop.value}"/></td>
                  <td align="left" class="text"> <a href="javascript:modifyCriteria(true,'<c:out value="${prop.key}"/>','<c:out value="${prop.value}"/>')"><fmt:message key='webclient.admin.discovery.criteriabased.modify'/></a> | <a href="javascript:deleteCriteria('true','<c:out value="${prop.key}"/>')"><fmt:message key='webclient.admin.discovery.criteriabased.delete'/></a></td>
               </tr>
          </c:forEach> 


           <c:forEach var="prop" items="${disAllowCriteria}">     
                <input type="hidden" name="dcName" value="<c:out value='${prop.key}'/>">
                <input type="hidden" name="dcValue" value="<c:out value='${prop.value}'/>">
                <tr> 
                  <td align="center" class="text"><img src="/webclient/common/images/del.gif"></td>
                  <td height="25" class="text"><c:out value="${prop.key}"/></td>
                  <td class="text"><c:out value="${prop.value}"/></td>
                  <td align="left" class="text"> <a href="javascript:modifyCriteria(false,'<c:out value="${prop.key}"/>','<c:out value="${prop.value}"/>')"><fmt:message key='webclient.admin.discovery.criteriabased.modify'/></a> | <a href="javascript:deleteCriteria('false','<c:out value="${prop.key}"/>')"><fmt:message key='webclient.admin.discovery.criteriabased.delete'/></a></td>
                </tr>
             </c:forEach> 

        </table>
</td>
              <td class="generalCurveRight">&nbsp;</td>
              </tr>
              <tr>
              <td class="generalCurveLeftBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px" /></td>
              <td class="generalCurveBottom"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px" /></td>
              <td class="generalCurveRightBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px" /></td>
              </tr>
              </table>
</td>
    </tr>
    <tr> 
      <td height="1">&nbsp;</td>
      <td height="1">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>
