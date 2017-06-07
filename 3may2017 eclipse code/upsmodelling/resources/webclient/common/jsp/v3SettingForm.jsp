<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page contentType="text/html;charset=UTF-8"%>
<%@ page language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="javascript" src="/webclient/common/js/validation.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2">
function validateEntry()
{
   if(document.V3ParameterForm.targetHost.value=="")
   {
      alert('<fmt:message key="webclient.common.v3ui.emptyhost"/>');
      document.V3ParameterForm.targetHost.focus();
      return false;
   }
   var portNumber = trimAll(document.V3ParameterForm.targetPort.value);
   if(portNumber=="")
   {
      alert('<fmt:message key="webclient.common.v3ui.emptyport"/>');
      document.V3ParameterForm.targetPort.focus();
      return false;
   }
   
   if(isNaN(portNumber))
   {
      alert('<fmt:message key="webclient.common.v3ui.invalidport"/>');
      document.V3ParameterForm.targetPort.focus();
      return false;
   }
   
   
   if(document.V3ParameterForm.v3userName.value=="")
   {
      alert('<fmt:message key="webclient.common.v3ui.emptyusername"/>');
      document.V3ParameterForm.v3userName.focus();
      return false;
   }

   if(document.V3ParameterForm.securityLevel.value!="NoAuth,NoPriv")
   {
      if(document.V3ParameterForm.authpwd.value=="")
      {
         alert('<fmt:message key="webclient.common.v3ui.emptyauthpwd"/>');
         document.V3ParameterForm.authpwd.focus();
         return false;
      }
   }
   if(document.V3ParameterForm.securityLevel.value=="Auth,Priv")
   {
      if(document.V3ParameterForm.privpwd.value=="")
      {
         alert('<fmt:message key="webclient.common.v3ui.emptyprivpwd"/>');
         document.V3ParameterForm.privpwd.focus();
         return false;
      }
   }
   return true;
}

function setSecurityLevel(selectedSecurity)
{
   if(selectedSecurity=="NoAuth,NoPriv")
   {
      document.V3ParameterForm.authprotocol.disabled=true;
      document.V3ParameterForm.authpwd.disabled=true;
      document.V3ParameterForm.privprotocol.disabled=true;
      document.V3ParameterForm.privpwd.disabled=true;
      document.V3ParameterForm.authprotocol.value="";
      document.V3ParameterForm.authpwd.value="";
      document.V3ParameterForm.privprotocol.value="";
      document.V3ParameterForm.privpwd.value="";
   }
   if(selectedSecurity=="Auth,NoPriv")
   {
      document.V3ParameterForm.authprotocol.disabled=false;
      document.V3ParameterForm.authpwd.disabled=false;
      document.V3ParameterForm.privprotocol.disabled=true;
      document.V3ParameterForm.privpwd.disabled=true;
      document.V3ParameterForm.privprotocol.value="";
      document.V3ParameterForm.privpwd.value="";
   }
   if(selectedSecurity=="Auth,Priv")
   {
      document.V3ParameterForm.authprotocol.disabled=false;
      document.V3ParameterForm.authpwd.disabled=false;
      document.V3ParameterForm.privprotocol.disabled=true;
      document.V3ParameterForm.privpwd.disabled=false;
      document.V3ParameterForm.privprotocol.value="CBC-DES";
   }
}

function init(level)
{
   if(level == 'Auth,NoPriv')
   {
      document.V3ParameterForm.authprotocol.disabled=false;
      document.V3ParameterForm.authpwd.disabled=false;
      document.V3ParameterForm.privprotocol.disabled=true;
      document.V3ParameterForm.privpwd.disabled=true;
      document.V3ParameterForm.privprotocol.value="";
      document.V3ParameterForm.privpwd.value="";
   }
   else if(level == 'Auth,Priv')
   {
      document.V3ParameterForm.authprotocol.disabled=false;
      document.V3ParameterForm.authpwd.disabled=false;
      document.V3ParameterForm.privprotocol.disabled=true;
     document.V3ParameterForm.privpwd.disabled=false;
     document.V3ParameterForm.privprotocol.value="CBC-DES";
   }
   else
   {
      document.V3ParameterForm.authprotocol.disabled=true;
      document.V3ParameterForm.authpwd.disabled=true;
      document.V3ParameterForm.privprotocol.disabled=true;
      document.V3ParameterForm.privpwd.disabled=true;
      document.V3ParameterForm.authprotocol.value="";
      document.V3ParameterForm.authpwd.value="";
      document.V3ParameterForm.privprotocol.value="";
      document.V3ParameterForm.privpwd.value="";
   }
}

</script>
<html>
   <head>
      <title><fmt:message key="webclient.common.v3ui.v3parameters"/></title>
      <%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
      <script language="javascript" SRC="/webclient/common/js/CustomizeColumns.js"></script>
   </head>
   <body class="popupbg" onload="javascript:init('<c:out value="${V3ParameterForm.map.securityLevel}"/>')">
   <form name="V3ParameterForm" action="/setV3Parameters.do" onSubmit="return validateEntry()">
      <input type="hidden" name="actionToPerform" value='<c:out value="${actionToPerform}"/>'>
      <input type="hidden" name="pageHeader" value='<c:out value="${pageHeader}"/>'>
         <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="header1Bg">
               <td height="30" class="header1" colspan="4"> &nbsp;<c:out value="${pageHeader}"/></td>
            </tr>
	    <tr align="left">
	       <td height="20" colspan="4"/>
	    </tr>
	    <c:if test="${!empty result}">
	       <tr align="left">
                 <td height="20" colspan="4" class="errorText" align="center"><c:out value="${result}"/></td>
               </tr>
	    </c:if>
	    <tr align="left">
	       <td height="30" class="text"><fmt:message key='webclient.common.v3ui.targethost'/>
	       <c:choose>
	       <c:when test="${textStatus == 'disabled'}">
	       <td><input type="text" name="targetHost" disabled value='<c:out value="${V3ParameterForm.map.targetHost}"/>'></td>
	       </c:when>
	       <c:otherwise>
	       <td><input type="text" name="targetHost" value='<c:out value="${V3ParameterForm.map.targetHost}"/>'></td>
	       </c:otherwise>
	       </c:choose>
	       <td height="30" class="text"><fmt:message key='webclient.common.v3ui.targetport'/>
	       <c:choose>                                                                                                                   <c:when test="${textStatus == 'disabled'}">
	       <td><input type="text" name="targetPort" disabled value='<c:out value="${V3ParameterForm.map.targetPort}"/>'></td>
	       </c:when>                                                                                                                    <c:otherwise> 
	       <td><input type="text" name="targetPort" value='<c:out value="${V3ParameterForm.map.targetPort}"/>'></td>
	       </c:otherwise>
               </c:choose>
	    </tr>
	    <tr align="left">
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.userName'/>
	       <c:choose>
	       <c:when test="${textStatus == 'disabled'}">
               <td><input type="text" name="v3userName"  disabled value='<c:out value="${V3ParameterForm.map.v3userName}"/>'></td>
	       </c:when>
	       <c:otherwise>
	        <td><input type="text" name="v3userName"  value='<c:out value="${V3ParameterForm.map.v3userName}"/>'></td> 
	       </c:otherwise>
	       </c:choose>
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.securityLevel'/>
               <td>
	       <select name="securityLevel" class="txtTableHeader" <c:if test="${textStatus eq 'disabled'}">disabled</c:if> onchange="javascript:setSecurityLevel(this.options[this.selectedIndex].value)">
	          <option value="NoAuth,NoPriv" <c:if test="${V3ParameterForm.map.securityLevel eq 'NoAuth,NoPriv'}">selected='true'</c:if> >NoAuth,NoPriv</option>
		  <option value="Auth,NoPriv" <c:if test="${V3ParameterForm.map.securityLevel eq 'Auth,NoPriv'}">selected='true'</c:if> >Auth,NoPriv</option>
		  <option value="Auth,Priv" <c:if test="${V3ParameterForm.map.securityLevel eq 'Auth,Priv'}">selected=='true'</c:if>>Auth,Priv</option>
	       </select>
	       </td>
            </tr>
	    <tr align="left">
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.authprotocol'/>
               <td>
	       <select name="authprotocol" class="txtTableHeader">
	          <option value="MD5" <c:if test="${V3ParameterForm.map.authprotocol eq 'MD5'}">selected='true'</c:if> >MD5</option>
		  <option value="SHA" <c:if test="${V3ParameterForm.map.authprotocol eq 'SHA'}">selected='true'</c:if> >SHA</option>
	       </select>
	       </td>
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.authpwd'/>
               <td><input type="password" name="authpwd" value='<c:out value="${V3ParameterForm.map.authpwd}"/>'></td>
            </tr>		     
	    <tr align="left">
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.privprotocol'/>
               <td><input type="text" name="privprotocol"></td>
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.privpwd'/>
	       <td><input type="password" name="privpwd" value='<c:out value="${V3ParameterForm.map.privpwd}"/>'/></td>
            </tr>
            <tr align="left">
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.centextname'/>
	       <c:choose>                                                                                                                   <c:when test="${textStatus == 'disabled'}">
               <td><input type="text" name="contextName" disabled  value='<c:out value="${V3ParameterForm.map.contextName}"/>'></td>
	       </c:when>
	       <c:otherwise>
	       <td><input type="text" name="contextName"  value='<c:out value="${V3ParameterForm.map.contextName}"/>'></td>
	       </c:otherwise>
               </c:choose>
               <td height="30" class="text"><fmt:message key='webclient.common.v3ui.engineid'/>
	       <c:choose>
	       <c:when test="${textStatus == 'disabled'}">
	       
               <td><input type="text" name="engineid"  disabled value='<c:out value="${V3ParameterForm.map.engineid}"/>'></td>
	       </c:when>
	       <c:otherwise>
	       <td><input type="text" name="engineid" value='<c:out value="${V3ParameterForm.map.engineid}"/>'></td>
	       </c:otherwise>
	       </c:choose>
            </tr>	       
	    <tr align="left">
               <td height="10" colspan="4"/>
            </tr>
				       
	    <tr align="center">
               <td align="center" colspan="4"><input type="submit" class="button" value='<c:out value="${operationButton}"/>' name="${operationButton}">&nbsp;&nbsp;&nbsp;<input class="button" value="<fmt:message key='webclient.common.v3ui.cancel'/>" type="button" name="Cancel" onclick="javascript:window.close()"></td>
            <tr>
         </table>
      </:form>
   </body>   
</html>
