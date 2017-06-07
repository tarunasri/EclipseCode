<%-- $Id: EventParserConfigurationForm.jsp,v 1.3 2007/09/18 14:20:26 gnanasekar Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/admin/jspf/EventParserAdmin.jspf" %>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>Event Parsers</h1></td>
		<td align="right"> </td>
     </tr>
    </table>

<form name="EventParserConfigurationForm" method="POST" action="/admin/EventParserConfiguration.do">
    <input type="hidden" name="toPerform"/>

 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle">
<c:choose> <c:when test="${title== 'addEPForm'}" > <fmt:message key="webclient.fault.eventparser.link.add"/>
        </c:when> <c:when test="${title == 'modifyEPForm'}" > <fmt:message key="webclient.fault.eventparser.link.modify"/>
        </c:when>
        <c:otherwise> 
        </c:otherwise> 
        </c:choose> 

</span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

   <table width="98%" border="0" celllspacing="2" cellpadding="0" align="center">
    <tr> 
      <td height="25" class="text" > <fmt:message key='webclient.fault.eventparser.name'/></td>
      <td><html:text name="EventParserConfigurationForm" property="name" styleClass="formStyle"/></td>
      <td>&nbsp; </td>
      <td>&nbsp; </td>
    </tr>
    <tr> 
      <td height="30" class="text" valign="bottom" width="150"><b><fmt:message key='webclient.fault.eventparser.fieldname'/></b></td>
      <td class="text" valign="bottom"><b><fmt:message key='webclient.fault.eventparser.matchstring'/></b></td>
      <td class="text" valign="bottom"><b><fmt:message key='webclient.fault.eventparser.tokenizerstring'/></b></td>
      <td class="text" valign="bottom"><b><fmt:message key='webclient.fault.eventparser.outputstring'/></b> 
      </td>
    </tr>
    <tr> 
      <td height="1" class="hline" colspan="4"><img src="/webclient/common/images/trans.gif" height="1" width="1"/></td>
    </tr>
    <tr> 
      <td height="25" class="text" valign="top"> <fmt:message key='webclient.fault.eventparser.event.message'/> 
      </td>
      <td align="left" class="text"> <html:textarea name="EventParserConfigurationForm" property="textMatch" styleClass="formStyle" style="width:200" rows="4"/> 
      </td>
      <td align="left" class="text"> <html:textarea name="EventParserConfigurationForm" styleClass="formStyle" property="textTok" style="width:200" rows="4"/> 
      </td>
      <td align="left" class="text"> <html:textarea name="EventParserConfigurationForm" property="textDefn" styleClass="formStyle" style="width:200" rows="4"/> 
      </td>
    </tr>
    <tr> 
      <td height="25" class="text"> <fmt:message key='webclient.fault.eventparser.event.category'/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="categoryMatch" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="categoryTok" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle"property="categoryDefn" style="width:200"/> 
      </td>
    </tr>
    <tr> 
      <td height="25" class="text"><fmt:message key='webclient.fault.eventparser.event.domain'/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="domainMatch" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="domainTok" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="domainDefn" style="width:200"/> 
      </td>
    </tr>
    <tr> 
      <td height="25" class="text"><fmt:message key='webclient.fault.eventparser.event.network'/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="networkMatch" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="networkTok" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="networkDefn" style="width:200"/> 
      </td>
    </tr>
    <tr> 
      <td height="25" class="text"> <fmt:message key='webclient.fault.eventparser.event.node'/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="nodeMatch" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="nodeTok" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm"  styleClass="formStyle" property="nodeDefn" style="width:200"/> 
      </td>
    </tr>
    <tr> 
      <td height="25" class="text"> <fmt:message key='webclient.fault.eventparser.event.failureobject'/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="entityMatch" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="entityTok" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="entityDefn" style="width:200"/> 
      </td>
    </tr>
    <tr> 
      <td height="25" class="text"> <fmt:message key='webclient.fault.eventparser.event.source'/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="sourceMatch" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="sourceTok" style="width:200"/> 
      </td>
      <td> <html:text name="EventParserConfigurationForm" styleClass="formStyle" property="sourceDefn" style="width:200"/> 
      </td>
    </tr>
    <tr> 
      <td height="25" class="text"><fmt:message key='webclient.fault.eventparser.event.severity'/> 
      </td>
      <td> <html-el:select style="width:200" styleClass="formStyle" property="severityMatch" name="EventParserConfigurationForm"> 
        <c:forEach var="list" items="${severityListIn}"> <html-el:option value="${list}"><c:out value="${list}"/></html-el:option> 
        </c:forEach> </html-el:select> </td>
      <td class="text"> &nbsp;&nbsp;&nbsp; </td>
      <td> <html-el:select style="width:200" styleClass="formStyle" name="EventParserConfigurationForm" property="severityDefn"> 
        <c:forEach var="list" items="${severityListOut}"> <html-el:option value="${list}"><c:out value="${list}"/></html-el:option> 
        </c:forEach> </html-el:select> </td>
    </tr>
    <html-el:hidden name="EventParserConfigurationForm" property="rowCount"/> 
    <html-el:hidden name="EventParserConfigurationForm" property="enable"/> <c:choose> 
    <c:when test="${EventParserConfigurationForm.map.rowCount == 0}"> 
    <tr> 
      <td height="25" colspan="4" class="greyBg"><span class="header2"> <a href="javascript:provideUserPropertiesField()"><fmt:message key='webclient.fault.eventparser.moreprops.add'/></a></span></td>
    </tr>
    </c:when> <c:when test="${EventParserConfigurationForm.map.rowCount != 0}"> 
    <tr> 
      <td height="25" colspan="4" class="greyBg"><a name="userProp"></a><span class="header2"><fmt:message key='webclient.fault.eventparser.moreprops'/></span></td>
    </tr>
    </c:when> <c:otherwise> </c:otherwise> </c:choose> <c:if test="${EventParserConfigurationForm.map.rowCount != 0}"> 
    <tr> 
      <td height="25" class="text" valign="bottom"><b><fmt:message key='webclient.fault.eventparser.fieldname'/></b></td>
      <td height="25" class="text" valign="bottom"><b><fmt:message key='webclient.fault.eventparser.matchstring'/></b></td>
      <td height="25" class="text" valign="bottom"><b><fmt:message key='webclient.fault.eventparser.tokenizerstring'/></b></td>
      <td height="25" class="text" valign="bottom"><b><fmt:message key='webclient.fault.eventparser.outputstring'/></b></td>
    </tr>
	<tr> 
      <td height="1" class="hline" colspan="4"><img src="/webclient/common/images/trans.gif" height="1" width="1"/></td>
    </tr>
    <c:forEach begin="0" end="${EventParserConfigurationForm.map.rowCount-1}" varStatus="status"> 
    <tr> 
      <td height="25" class="text"><html-el:text property="userPropsName" styleClass="formStyle" value="${EventParserConfigurationForm.map.userPropsName[status.index]}" style="width:95%"/></td>
      <td height="25" class="text"><html-el:text property="userPropsMatchString" styleClass="formStyle" value="${EventParserConfigurationForm.map.userPropsMatchString[status.index]}" style="width:200"/></td>
      <td height="25" class="text"><html-el:text property="userPropsTokString" styleClass="formStyle" value="${EventParserConfigurationForm.map.userPropsTokString[status.index]}" style="width:200"/></td>
      <td height="25" class="text"><html-el:text property="userPropsDefnString" styleClass="formStyle" value="${EventParserConfigurationForm.map.userPropsDefnString[status.index]}" style="width:200"/></td>
    </tr>
    </c:forEach> 
    <tr> 
      <td height="25" class="text"> <input name="morebutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.morebutton.text'/>" onClick="more()"> 
        <input name="fewerbutton" type="button" class="button" value="<fmt:message key='webclient.common.searchcomponent.fewerbutton.text'/>" onClick="fewer()"> 
      </td>
      <td colspan="3" align="left" class="text">&nbsp;</td>
    </tr>
    </c:if> 
    <tr> 
      <td height="25" colspan="4">&nbsp;</td>
    </tr>
    <tr class="header2Bg"> 
      <td class="liteBlueBg" colspan="4" align="center" height="30"> <input type="button" name="Save" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>"  class="button" onClick="saveEventParser()"/> 
        <input type="reset" name="Reset" value="<fmt:message key='webclient.fault.event.customview.button.clear'/>" class="button" /> 
        <input type="button" name="Cancel" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onClick="javascript:location.href='/admin/EventParser.do';" class="button"/> 
      </td>
      <c:forEach var="parser" items="${eventParsersList}"> <c:forEach var="list" items="${parser}"> 
      <input type="hidden" name="nameOfParsers" value="<c:out value='${list.key}'/>"/>
      </c:forEach> </c:forEach> <html-el:hidden name="EventParserConfigurationForm" property="modifyParserName" value="${param.parserName}"/> 
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
</form>
</html>
