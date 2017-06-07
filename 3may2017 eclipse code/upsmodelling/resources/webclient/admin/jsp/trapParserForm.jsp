<%-- $Id: trapParserForm.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.fault.trapparser.title'/></title>
</head>

<script language="Javascript" SRC="/webclient/admin/js/trapParserAdmin.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script>

function resetTheForm()
{
	document.TrapParserForm.type[0].checked = true;
	disableTheFields();
}

</script>
<%@include file="/webclient/admin/jspf/trapParserAdmin.jspf" %>

<body onload="javascript:loadtheForm()">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<c:if test="${actionToPerform == 'addTrapParser'}">
               <fmt:message key='webclient.fault.trapparser.addparsers.title'/>
               </c:if>    

               <c:if test="${actionToPerform == 'modifyTrapParser'}">
<fmt:message key='webclient.fault.trapparser.modifyparsers.title'/> - <c:out value='${TrapParserForm.map.name}'/>
               </c:if>     
</h1></td>
</tr>
</table>

<html:form action="/SaveTrapParserForm">
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
          <input type="hidden" name="toPerform" value="">
          <input type="hidden" name="actionToPerform" value="<c:out value='${actionToPerform}'/>">
	  <input type="hidden" name="toDelParser" value="<c:out value='${duplicateParser}'/>"> 
          <tr> 
            <td>&nbsp;</td>    
            <td align="center" class="errorText" nowrap><html:errors/></td>
          </tr>
          <c:if test="${!empty duplicateParser}">
	  <tr>
            <td>&nbsp;</td>
            <td align="center" class="errorText"><fmt:message key='webclient.fault.trapparser.duplicateparser'/><c:out value="${duplicateParser}"/></td>
	  </tr>
	  </c:if>
          <tr> 
            <td>&nbsp;</td>
            <td valign="top"> 

<table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
            <table width="100%" border="0" align="left" cellpadding="2" cellspacing="0">
                <tr> 
                  <td width="5%" valign="bottom" class="text">&nbsp;</td>
                  <td width="19%" height="30" class="text"><fmt:message key='webclient.fault.trapparser.parsername'/></td>
                  <td colspan="3" align="left" class="text"> 
                      <c:choose>
                       <c:when test="${actionToPerform == 'modifyTrapParser'}">
                           <html-el:hidden property="name" value="${TrapParserForm.map.name}"/>
                           <c:out value="${TrapParserForm.map.name}"/>
                       </c:when>
                       <c:otherwise>
                         <html:text property="name" styleClass="formStyle"/> 
                       </c:otherwise>
                      </c:choose>
                  </td>
                </tr>

                <tr> 
                  <td class="liteBlueBg">&nbsp;</td>
                  <td height="25" colspan="4" class="liteBlueBg"><span class="header2"><fmt:message key='webclient.fault.trapparser.matchcriteria'/></span></td>
                </tr>

                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.trapparser.nodes'/></td>
                  <td colspan="3" align="left" class="text">
                   <html:text property="nodes" styleClass="formStyle"/>
                </tr>

                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.trapparser.group'/></td>
                  <td colspan="3" align="left" class="text">
                   <html:text property="groups" styleClass="formStyle"/>
                </tr>

                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text">&nbsp;</td>
                  <td colspan="3" align="left" class="text">&nbsp;</td>
                </tr>

                <tr> 
                  <td height="25" class="greyBg">&nbsp; </td>
                  <td height="25" class="greyBg">
                      <html-el:radio property="type" value="${snmpV1}" onclick="javascript:resetTheForm()"/>
                       <span class="text"><fmt:message key='webclient.fault.trapparser.v1'/></span></td>
                  <td height="25" class="greyBg">&nbsp;</td>
                  <td colspan="2" align="left" class="greyBg">&nbsp;&nbsp;
                      <html-el:radio property="type" value="${snmpV2}" onclick="javascript:disableTheFields()"/>
                    <span class="text"><fmt:message key='webclient.fault.trapparser.v2'/></span></td>
                </tr>

                <tr> 
                  <td height="25" class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.trapparser.enterprise'/></td>
                  <td width="26%" align="left" class="text">
                      <html:text property="enterprise" styleClass="formStyle"/></td>
                  <td width="16%" align="right" class="text"><fmt:message key='webclient.fault.trapparser.trapoid'/>&nbsp;&nbsp;</td>
                  <td width="34%" align="left" class="text">
                      <html:text property="trapOid" styleClass="formStyle"/></td>
                </tr>
                <tr> 
                  <td height="25" class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.trapparser.gt'/></td>
                  <td align="left" class="text"><html:text property="GT" styleClass="formStyle"/></td>
                 <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td height="25" class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.trapparser.st'/></td>
                  <td align="left" class="text"><html:text property="ST" styleClass="formStyle"/></td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                 
                <tr> 
                  <td height="25" class="text" colspan="5">&nbsp;</td>
                </tr>

                <tr> 
                  <td height="25" class="liteBlueBg">&nbsp;</td>
                  <td height="25" colspan="4" class="liteBlueBg"><span class="header2"><fmt:message key='webclient.fault.trapparser.eventprop'/></span></td>
                </tr>

                <tr> 
                  <td height="25" class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.customview.field.severity'/></td>
                  <td align="left">
                      <html-el:select style="width:110" styleClass="formStyle" name="TrapParserForm" property="severity">

                        <c:forEach var="list" items="${severityList}" varStatus="status">

                             <html-el:option value="${status.index + 1}"><c:out value='${list}'/></html-el:option>

                        </c:forEach>

                    </html-el:select></td>
                  <td align="left" class="text">&nbsp;</td>
                  <td align="left" class="text">&nbsp;</td>
                </tr>
                      
                <tr> 
                  <td height="25" class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.event.text'/></td>
                  <td align="left" class="text"><html:textarea property="textDefn" styleClass="formStyle" style="width:250" rows="4"/></td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
               </tr>
               <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="25" class="text"><fmt:message key='webclient.fault.event.source'/></td>
                  <td align="left" class="text"><html:text property="sourceDefn" styleClass="formStyle"/></td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
               </tr>

               <tr> 
                 <td class="text">&nbsp;</td>
                 <td height="27" class="text"><fmt:message key='webclient.fault.event.entity'/></td>
                 <td align="left" class="text"><html:text property="entityDefn" styleClass="formStyle"/></td>
                 <td colspan="2" align="left" class="text">&nbsp;</td>
               </tr>

               <tr> 
                 <td class="text">&nbsp;</td>
                 <td height="25" class="text"><fmt:message key='webclient.fault.event.category'/></td>
                 <td align="left" class="text"><html:text property="categoryDefn" styleClass="formStyle"/></td>
                 <td colspan="2" align="left" class="text">&nbsp;</td>
               </tr>

               <tr> 
                 <td class="text">&nbsp;</td>
                 <td height="25" class="text"><fmt:message key='webclient.fault.event.groupName'/></td>
                 <td align="left" class="text"><html:text property="groupDefn" styleClass="formStyle"/></td>
                 <td colspan="2" align="left" class="text">&nbsp;</td>
               </tr>
        
               <tr> 
                 <td class="text">&nbsp;</td>
                 <td height="25" class="text"><fmt:message key='webclient.fault.event.node'/></td>
                 <td align="left" class="text"><html:text property="nodeDefn" styleClass="formStyle"/></td>
                 <td colspan="2" align="left" class="text">&nbsp;</td>
               </tr>

               <tr> 
                 <td height="25" colspan="5">&nbsp;</td>
               </tr>

                <c:choose>
                   <c:when test="${TrapParserForm.map.rowCount == 0}">    

                    <tr> 
                       <td height="25" class="greyBg"> <p>&nbsp;</p></td>
                       <td height="25" colspan="4" class="greyBg"><span class="header2">
                         <a href="javascript:userProperties()"><fmt:message key='webclient.fault.trapparser.moreprops.add'/></a>
                      </span></td>
                     </tr>

                   </c:when>
                   <c:when test="${TrapParserForm.map.rowCount != 0}">      
                     <tr> 
                        <td height="25" class="greyBg"> <p>&nbsp;</p></td>
                        <td height="25" colspan="4" class="greyBg"><a name="userProp"></a><span class="header2"><fmt:message key='webclient.fault.trapparser.moreprops'/></span></td>
                     </tr>
                   </c:when>      
                   <c:otherwise>
                   </c:otherwise>
               </c:choose>      

               <html-el:hidden name="TrapParserForm" property="rowCount"/>
               <html-el:hidden name="TrapParserForm" property="enable"/>
      
               <c:if test="${TrapParserForm.map.rowCount != 0}">      

                   <tr> 
                     <td class="text">&nbsp;</td>
                     <td height="25" class="text"><fmt:message key='webclient.fault.trapparser.userpropname'/></td>
                     <td colspan="3" align="left" class="text"><fmt:message key='webclient.fault.trapparser.matchcriteria'/></td>
                   </tr>
                    
                  <c:forEach begin="0" end="${TrapParserForm.map.rowCount-1}" varStatus="status">       
                         
                   <tr> 
                      <td class="text">&nbsp;</td>
                      <td height="25" class="text">
                          <html-el:text property="userPropsName" styleClass="formStyle" value="${TrapParserForm.map.userPropsName[status.index]}"/></td>
                      <td colspan="3" align="left" class="text">
                          <html-el:text property="userPropsValue" styleClass="formStyle" value="${TrapParserForm.map.userPropsValue[status.index]}"/></td>
                   </tr>      

                   </c:forEach>       

                  <tr> 
                     <td class="text">&nbsp;</td>
                     <td height="25" class="text">
                         <input name="morebutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>" onClick="more()"> 
                         <input name="fewerbutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>" onClick="fewer()"> 
                     </td>
                     <td colspan="3" align="left" class="text">&nbsp;</td>
                  </tr>

               </c:if>    

              <tr> 
                <td height="25" colspan="5">&nbsp;</td>
              </tr>
              <tr class="header2Bg"> 
                <td class="liteBlueBg">&nbsp;</td>
                <td class="liteBlueBg">&nbsp;</td>
                <td colspan="3" align="left" class="liteBlueBg"> 
                 <input name="Save" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" onclick="javascript:submitTheForm()"> 
                 <input name="Reset" type="reset" class="button" value="<fmt:message key='webclient.fault.event.customview.button.clear'/>" onclick="javascript:resetTheForm()"> 
                 <input name="Cancel" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/admin/TrapParser.do';"> 
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
</td>
 
       </tr>
       <tr> 
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
       </tr>
  </table>
</html:form>
</body>
</html>
