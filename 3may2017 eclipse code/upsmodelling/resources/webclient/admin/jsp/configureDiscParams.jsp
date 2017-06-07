<%-- $Id: configureDiscParams.jsp,v 1.4 2007/10/19 13:03:05 gnanasekar Exp $ --%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.discovery.title'/></title>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="Javascript" src="/webclient/admin/js/discoveryConfiguration.js" type="text/javascript"></script>
<%@include file="/webclient/admin/jspf/discoveryConfiguration.jspf" %>
</head>

<body onload="initialparameters()">
<html:form action="/DiscConfiguration">

 
        <table border=0 cellspacing=0 cellpadding=0 width=100%>
	<tr>
		<td>
                    <table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>
                        <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.discovery.subtitle'/></h1></td>
        		<td align="right"></td>
                     </tr>
                    </table>
                </td>

    </tr>
        </table>

 <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <c:if test="${!empty successMsg}">
        <tr align="center">  
            <td class="responseText"><img height="15" src="/webclient/common/images/tick.gif" width="15" hspace="4"><c:out value="${successMsg}"/></td>
          </tr>

       </c:if>

    <tr> 
      <td> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
              <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px" /></td>
              <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.discovery.commonparameters'/></span></td>
              <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="5px" height="1px" /></td>
        </tr>
              
        <tr>
              <td class="generalCurveLeft">&nbsp;</td>
              <td valign="top">
        <table width="100%" border="0" align="left" cellpadding="4" cellspacing="0">
          <tr> 
            <td height="30" colspan="2" class="text"><html:checkbox property="autoDiscovery" name="DiscForm" onclick="javascript:confirmDisc()"/><fmt:message key='webclient.admin.discovery.autodiscovery'/></td>
            <td width="48%" class="text">&nbsp;</td>
          </tr>
          <tr> 
            <td height="30" colspan="2" class="text"><html:checkbox property="discoverLocalNet" name="DiscForm"/><fmt:message key='webclient.admin.discovery.enablelocalnetworks'/>
               </td>
            <td class="text">&nbsp;</td>
          </tr>
<input type="hidden" name="enablelog" value="true">
          <tr> 
            <td height="30" colspan="2" class="text"><html:checkbox property="reDiscovery" name="DiscForm"/><fmt:message key='webclient.admin.discovery.rediscover.alreadydiscovered'/></td>
            <td class="text">&nbsp; </td>
          </tr>
          <tr> 
            <td nowrap width="18%" class="text"><fmt:message key='webclient.admin.discovery.discoveryinterval'/></td>
            <td width="34%"><html:text property="discInterval" name="DiscForm" styleClass="formStyleSmall"/>&nbsp;<span class=text><fmt:message key='webclient.admin.discovery.discoveryinterval.units'/></span></td>
            <td class="text">&nbsp;</td>
          </tr>
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
      <td>
<br>



<table width="100%" border="0" cellspacing="1" cellpadding="2">
         <tr> 
          <td width="52%">

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
              <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px" /></td>
              <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.discovery.snmpproperties'/></span></td>
              <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="5px" height="1px" /></td>
        </tr>
              
        <tr>
              <td class="generalCurveLeft">&nbsp;</td>
              <td valign="top" >

        <table width="100%" border="0" align="left" cellpadding="4" cellspacing="0" >
          <tr> 
            <td height="30" colspan="4"> 
              <html:checkbox property="snmpDiscovery" onclick="javascript:toggleSnmp()"/>
              <span class ="text"><fmt:message key='webclient.admin.discovery.snmpdiscovery'/></span></td>
          </tr>
          <c:choose>
            <c:when test="${DiscForm.map.snmpDiscovery == 'false'}">
              <c:set var="snmpPropStyle" value="formStyleSmallDisabled"/>
              <c:set var="snmpPropdisabled" value="true"/>
            </c:when>
            <c:otherwise>
              <c:set var="snmpPropStyle" value="formStyleSmall"/>
              <c:set var="snmpPropdisabled" value="false"/>
            </c:otherwise>
          </c:choose>
          <tr> 
            <td nowrap height="30" class="text"><fmt:message key='webclient.admin.discovery.snmptimeout'/></td>
     <td nowrap><html-el:select property="snmpTimeout" name="DiscForm">
     <option value=0 <c:if test="${DiscForm.map.snmpTimeout == '0'}">selected='true'</c:if>>0</option>
     <option value=1 <c:if test="${DiscForm.map.snmpTimeout == '1'}">selected='true'</c:if>>1</option>
     <option value=2 <c:if test="${DiscForm.map.snmpTimeout == '2'}">selected='true'</c:if>>2</option>
     <option value=3 <c:if test="${DiscForm.map.snmpTimeout == '3'}">selected='true'</c:if>>3</option>
     <option value=4 <c:if test="${DiscForm.map.snmpTimeout == '4'}">selected='true'</c:if>>4</option>
     <option value=5 <c:if test="${DiscForm.map.snmpTimeout == '5'}">selected='true'</c:if>>5</option>
     <option value=6 <c:if test="${DiscForm.map.snmpTimeout == '6'}">selected='true'</c:if>>6</option>
     <option value=7 <c:if test="${DiscForm.map.snmpTimeout == '7'}">selected='true'</c:if>>7</option>
     <option value=8 <c:if test="${DiscForm.map.snmpTimeout == '8'}">selected='true'</c:if>>8</option>
     <option value=9 <c:if test="${DiscForm.map.snmpTimeout == '9'}">selected='true'</c:if>>9</option>
<option value=10 <c:if test="${DiscForm.map.snmpTimeout == '10'}">selected='true'</c:if>>10</option>  
<option value=15 <c:if test="${DiscForm.map.snmpTimeout == '15'}">selected='true'</c:if>>15</option>
<option value=20 <c:if test="${DiscForm.map.snmpTimeout == '20'}">selected='true'</c:if>>20</option>
 
</html-el:select>
&nbsp;<span class=text><fmt:message key='webclient.admin.discovery.snmptimeout.units'/></span></td>
            <td>&nbsp;</td>
          </tr>
          <tr>
          <td nowrap width="37%" class="text" height="30"><fmt:message key='webclient.admin.discovery.snmpretries'/></td>
          <td width="25%"><html-el:select property="snmpRetries" name="DiscForm">
          <option value=0 <c:if test="${DiscForm.map.snmpRetries == '0'}">selected='true'</c:if>>0</option>
          <option value=1 <c:if test="${DiscForm.map.snmpRetries == '1'}">selected='true'</c:if>>1</option>
          <option value=2 <c:if test="${DiscForm.map.snmpRetries == '2'}">selected='true'</c:if>>2</option>
          <option value=3 <c:if test="${DiscForm.map.snmpRetries == '3'}">selected='true'</c:if>>3</option>
          <option value=4 <c:if test="${DiscForm.map.snmpRetries == '4'}">selected='true'</c:if>>4</option>
          <option value=5 <c:if test="${DiscForm.map.snmpRetries == '5'}">selected='true'</c:if>>5</option>
          <option value=6 <c:if test="${DiscForm.map.snmpRetries == '6'}">selected='true'</c:if>>6</option>
          <option value=7 <c:if test="${DiscForm.map.snmpRetries == '7'}">selected='true'</c:if>>7</option>
          <option value=8 <c:if test="${DiscForm.map.snmpRetries == '8'}">selected='true'</c:if>>8</option>
          <option value=9 <c:if test="${DiscForm.map.snmpRetries == '9'}">selected='true'</c:if>>9</option>
          <option value=10 <c:if test="${DiscForm.map.snmpRetries == '10'}">selected='true'</c:if>>10</option>
          </html-el:select>
          </td>
          <td width="38%" class="text">&nbsp;</td>
          </tr>
          <tr> 
            <td height="25" class="text"><fmt:message key='webclient.admin.discovery.snmpport'/></td>
            <td><html-el:text property="snmpPort" name="DiscForm" styleClass="${snmpPropStyle}" disabled="${snmpPropdisabled}"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap height="25" class="text"><fmt:message key='webclient.admin.discovery.readcommunity'/></td>
            <td><html-el:text property="readCommunity" name="DiscForm" styleClass="${snmpPropStyle}" disabled="${snmpPropdisabled}"/></td>
            <td>&nbsp;</td>
          </tr>

            <c:choose>
                <c:when test="${DiscForm.map.snmpv3Discovery == 'false'}">
                  <c:set var="v3Fieldstyle" value="formStyleSmallDisabled"/>
                  <c:set var="v3Fielddisabled" value="true"/>
                </c:when>
                <c:otherwise>
                  <c:set var="v3Fieldstyle" value="formStyleSmall"/>
                  <c:set var="v3Fielddisabled" value="false"/>
                </c:otherwise>
            </c:choose>    
          <tr> 
            <td height="25" colspan="3" class="text"><html:checkbox property="snmpv3Discovery" onclick="javascript:toggleSnmpv3()"/><fmt:message key='webclient.admin.discovery.snmpv3'/></td>
          </tr>
          <tr id="user" style="hide"> 
            <td width="29%" height="30" class="text"><fmt:message key='webclient.admin.discovery.username'/></td>
            <td><html-el:text property="v3UserName" name="DiscForm" styleClass="${v3Fieldstyle}" disabled="${v3FieldDisabled}"/></td>
            <td>&nbsp;</td>
          </tr>
          <tr id="context" style=hide> 
            <td height="30" class="text"><fmt:message key='webclient.admin.discovery.contextname'/></td>
            <td><html-el:text property="v3ContextName" name="DiscForm" styleClass="${v3Fieldstyle}" disabled="${v3FieldDisabled}"/></td>
            <td>&nbsp;</td>
          </tr>
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
        
        <td width="48%" valign="top"> 

        <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
              <td class="generalCurveLeftTop"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px" /></td>
              <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.discovery.icmpproperties'/></span></td>
              <td class="generalCurveRightTop"><img src="/webclient/common/images/spacer.gif" width="5px" height="1px" /></td>
        </tr>
              
        <tr>
              <td class="generalCurveLeft">&nbsp;</td>
              <td valign="top">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
          <tr> 
            <td height="30" colspan="3"> 
              <html:checkbox property="icmpDiscovery" name="DiscForm" onclick="toggleIcmp()"/><span class="text"><fmt:message key='webclient.admin.discovery.icmpdiscovery'/></span></td>
          </tr>
          <tr> 
            <td nowrap width="33%" height="30" class="text"><fmt:message key='webclient.admin.discovery.pingtimeout'/></td>
            <td width="33%" nowrap><html-el:select property="pingTimeout" name="DiscForm">
     <option value=0 <c:if test="${DiscForm.map.pingTimeout == '0'}">selected='true'</c:if>>0</option>
     <option value=1 <c:if test="${DiscForm.map.pingTimeout == '1'}">selected='true'</c:if>>1</option>
     <option value=2 <c:if test="${DiscForm.map.pingTimeout == '2'}">selected='true'</c:if>>2</option>
     <option value=3 <c:if test="${DiscForm.map.pingTimeout == '3'}">selected='true'</c:if>>3</option>
     <option value=4 <c:if test="${DiscForm.map.pingTimeout == '4'}">selected='true'</c:if>>4</option>
     <option value=5 <c:if test="${DiscForm.map.pingTimeout == '5'}">selected='true'</c:if>>5</option>
     <option value=6 <c:if test="${DiscForm.map.pingTimeout == '6'}">selected='true'</c:if>>6</option>
     <option value=7 <c:if test="${DiscForm.map.pingTimeout == '7'}">selected='true'</c:if>>7</option>
     <option value=8 <c:if test="${DiscForm.map.pingTimeout == '8'}">selected='true'</c:if>>8</option>
     <option value=9 <c:if test="${DiscForm.map.pingTimeout == '9'}">selected='true'</c:if>>9</option>
<option value=10 <c:if test="${DiscForm.map.pingTimeout == '10'}">selected='true'</c:if>>10</option>
<option value=15 <c:if test="${DiscForm.map.pingTimeout == '15'}">selected='true'</c:if>>15</option>
<option value=20 <c:if test="${DiscForm.map.pingTimeout == '20'}">selected='true'</c:if>>20</option>

</html-el:select>
 
&nbsp;<span class=text><fmt:message key='webclient.admin.discovery.pingtimeout.units'/></span></td>
            <td width="34%">&nbsp;</td>
          </tr>
          <tr> 
            <td nowrap height="30" class="text"><fmt:message key='webclient.admin.discovery.pingretries'/></td>
            <td width="33%">
           <html-el:select property="pingRetries" name="DiscForm">

     <option value=0 <c:if test="${DiscForm.map.pingRetries == '0'}">selected='true'</c:if>>0</option>
     <option value=1 <c:if test="${DiscForm.map.pingRetries == '1'}">selected='true'</c:if>>1</option>
     <option value=2 <c:if test="${DiscForm.map.pingRetries == '2'}">selected='true'</c:if>>2</option>
     <option value=3 <c:if test="${DiscForm.map.pingRetries == '3'}">selected='true'</c:if>>3</option>
     <option value=4 <c:if test="${DiscForm.map.pingRetries == '4'}">selected='true'</c:if>>4</option>
     <option value=5 <c:if test="${DiscForm.map.pingRetries == '5'}">selected='true'</c:if>>5</option>
     <option value=6 <c:if test="${DiscForm.map.pingRetries == '6'}">selected='true'</c:if>>6</option>
     <option value=7 <c:if test="${DiscForm.map.pingRetries == '7'}">selected='true'</c:if>>7</option>
     <option value=8 <c:if test="${DiscForm.map.pingRetries == '8'}">selected='true'</c:if>>8</option>
     <option value=9 <c:if test="${DiscForm.map.pingRetries == '9'}">selected='true'</c:if>>9</option>
<option value=10 <c:if test="${DiscForm.map.pingRetries == '10'}">selected='true'</c:if>>10</option>

</html-el:select>

</td>
            <td>&nbsp;</td>
          </tr>
	<tr>
		<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
          <tr> 
            <td height="25" colspan="3" class="header2Bg"><fmt:message key='webclient.admin.discovery.nativeproperties'/></td>
          </tr>
          <tr> 
            <td nowrap width="33%" height="30" class="text"><fmt:message key='webclient.admin.discovery.nativepingtimeout'/></td>
            <td width="33%" nowrap><html-el:select property="nativePingTimeout" name="DiscForm" >
<option value=0 <c:if test="${DiscForm.map.nativePingTimeout == '0'}">selected='true'</c:if>>0</option>
<option value=1 <c:if test="${DiscForm.map.nativePingTimeout == '1'}">selected='true'</c:if>>1</option>
<option value=2 <c:if test="${DiscForm.map.nativePingTimeout == '2'}">selected='true'</c:if>>2</option>
<option value=3 <c:if test="${DiscForm.map.nativePingTimeout == '3'}">selected='true'</c:if>>3</option>
<option value=4 <c:if test="${DiscForm.map.nativePingTimeout == '4'}">selected='true'</c:if>>4</option>
<option value=5 <c:if test="${DiscForm.map.nativePingTimeout == '5'}">selected='true'</c:if>>5</option>
<option value=6 <c:if test="${DiscForm.map.nativePingTimeout == '6'}">selected='true'</c:if>>6</option>
<option value=7 <c:if test="${DiscForm.map.nativePingTimeout == '7'}">selected='true'</c:if>>7</option>
<option value=8 <c:if test="${DiscForm.map.nativePingTimeout == '8'}">selected='true'</c:if>>8</option>
<option value=9 <c:if test="${DiscForm.map.nativePingTimeout == '9'}">selected='true'</c:if>>9</option>
<option value=10 <c:if test="${DiscForm.map.nativePingTimeout == '10'}">selected='true'</c:if>>10</option>
<option value=15 <c:if test="${DiscForm.map.nativePingTimeout == '15'}">selected='true'</c:if>>15</option>
<option value=20 <c:if test="${DiscForm.map.nativePingTimeout == '20'}">selected='true'</c:if>>20</option>

</html-el:select>

&nbsp;<span class=text><fmt:message key='webclient.admin.discovery.nativepingtimeout.units'/></span></td>
          </tr>
          <tr> 
            <td nowrap height="30" class="text"><fmt:message key='webclient.admin.discovery.nativepingretries'/></td>
            <td><html-el:select property="nativePingRetries" name="DiscForm">
<option value=0 <c:if test="${DiscForm.map.nativePingRetries == '0'}">selected='true'</c:if>>0</option>

<option value=1 <c:if test="${DiscForm.map.nativePingRetries == '1'}">selected='true'</c:if>>1</option>

<option value=2 <c:if test="${DiscForm.map.nativePingRetries == '2'}">selected='true'</c:if>>2</option>

<option value=3 <c:if test="${DiscForm.map.nativePingRetries == '3'}">selected='true'</c:if>>3</option>

<option value=4 <c:if test="${DiscForm.map.nativePingRetries == '4'}">selected='true'</c:if>>4</option>

<option value=5 <c:if test="${DiscForm.map.nativePingRetries == '5'}">selected='true'</c:if>>5</option>

<option value=6 <c:if test="${DiscForm.map.nativePingRetries == '6'}">selected='true'</c:if>>6</option>

<option value=7 <c:if test="${DiscForm.map.nativePingRetries == '7'}">selected='true'</c:if>>7</option>

<option value=8 <c:if test="${DiscForm.map.nativePingRetries == '8'}">selected='true'</c:if>>8</option>

<option value=9 <c:if test="${DiscForm.map.nativePingRetries == '9'}">selected='true'</c:if>>9</option>

<option value=10 <c:if test="${DiscForm.map.nativePingRetries == '10'}">selected='true'</c:if>>10</option>
</html-el:select>            

</td>
          </tr>
	
	  </tr>
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
    </table></td>
    </tr>

    <tr> 
      <td height="1">&nbsp;</td>
      <td height="1">&nbsp;</td>
    </tr>
              <input type="hidden" name="toPerform" value="">

    <tr>
       <td align="center">
              <input name="Submit" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" onclick="javascript:validateandSubmit()"> 
              <input name="Cancel" type="button" class="button" onclick="javascript:completeview()" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>">
        </td>
    </tr>
   </table>

</html:form>
</body>
</html>
