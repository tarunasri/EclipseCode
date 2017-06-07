<%-- $Id: Threshold.jsp,v 1.5 2010/10/29 13:47:12 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><c:out value="${title}"/></title>

<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="Javascript" SRC="/webclient/perf/js/thresholdForm.js" type="text/javascript"></script>

<script>

function selectThreshold(tName)
{
    //var tName = thisForm.thresholdData.option.selected;
    //alert("The selected item is "+tName);
    var action = document.ThresholdObject.actionToPerform.value
  	location.href = '/perf/ThresholdDetails.do?toPerform=showThreshold&threshName='+tName +'&actionToPerform='+action;
}


function validateandSubmit()
{

    var name = trimAll(document.ThresholdObject.name.value);
    if(name == "")
    {
        alert('<fmt:message key="webclient.perf.threshold.name.empty"/>');
        document.ThresholdObject.name.focus();
        return false;
    }
    
    var category = trimAll(document.ThresholdObject.category.value);
    if(category == "")
    {
        alert('<fmt:message key="webclient.perf.threshold.category.empty"/>');
        document.ThresholdObject.category.focus();
        return false;
    }

    var kindVal = document.ThresholdObject.kind.value;

    if(kindVal == "long" || kindVal =="percentage")
    {   
        
        var threshVal = trimAll(document.ThresholdObject.thresholdValue.value);
        if(threshVal == "")
        {
            alert('<fmt:message key="webclient.perf.threshold.threshval.empty"/>');
            document.ThresholdObject.thresholdValue.focus();
            return false;
        }
        checkNum = parseInt(threshVal);
        if(isNaN(checkNum) || checkNum!=threshVal )
        {
            alert('<fmt:message key="webclient.perf.threshold.threshval.integer"/>');
            document.ThresholdObject.thresholdValue.focus();
            return false;
        }
        var rearmValue = trimAll(document.ThresholdObject.rearmValue.value);
        if(rearmValue == "")
        {
            alert('<fmt:message key="webclient.perf.threshold.rearmval.empty"/>');
            document.ThresholdObject.rearmValue.focus();
            return false;
        }
        checkNum = parseInt(rearmValue);
        if(isNaN(checkNum) || checkNum!=rearmValue )
        {
            alert('<fmt:message key="webclient.perf.threshold.rearmval.integer"/>');
            document.ThresholdObject.rearmValue.focus();
            return false;
        }
       
        

    }
    else if(kindVal == "string")   
    {
        var allAllow = trimAll(document.ThresholdObject.allowed.value);
        if(allAllow == "")
        {
            alert('<fmt:message key="webclient.perf.threshold.allowed.empty"/>');
            document.ThresholdObject.allowed.focus();
            return false;
        }
        var disAllow = trimAll(document.ThresholdObject.disAllowed.value);
        if(disAllow == "")
        {
            alert('<fmt:message key="webclient.perf.threshold.disall.empty"/>');
            document.ThresholdObject.disAllowed.focus();
            return false;
        }
    }
    if(kindVal == "percentage")   
    {
        var oidData = trimAll(document.ThresholdObject.oid.value);
        if(oidData == "")
        {
            alert('<fmt:message key="webclient.perf.threshold.oid.empty"/>');
            document.ThresholdObject.oid.focus();
            return false;
        }
    }
    return true;      
}

function submitTheForm1()
{
    //var val = document.ThresholdObject.actionToPerform.value;
    document.ThresholdObject.actionToPerform.value="modifyThreshold";
    document.ThresholdObject.toPerform.value="modifyThreshold";
    //window.location.href = window.location.href+toPerform="modifyThreshold";
    document.ThresholdObject.submit();
}


</script>

</head>



<body onload="javascript:loadtheForm()">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.perf.threshold.header'/></h1></td>
		<td align="right"><span class="mandatory">*</span> <span  class="textSmall"> <fmt:message key='webclient.perf.mandatory.message'/></span> &nbsp;</td>
        </tr>
        </table>
 
<html:form action="/ThresholdDetails"  >

<table style="margin-bottom:10px;" width="60%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;">
<span class="generalTitle">
<c:choose>
    <c:when test="${actionToPerform eq 'addThresholdForm'}">
    <fmt:message key='webclient.perf.thresholds.add.header'/>
    </c:when>
     <c:when test="${actionToPerform eq 'deleteThreshold'}">
    <fmt:message key='webclient.perf.thresholds.delete.header'/>
    </c:when>
    <c:otherwise>
    <fmt:message key='webclient.perf.thresholds.modify.header'/>
    </c:otherwise>
    </c:choose>
</span>
</td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="/webclient/common/images/spacer.gif" width="3" height="15"></td>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">

  <c:set var="isReadOnly" value="${actionToPerform ne 'addThresholdForm'}" /> 
<c:set var="isDisabled" value="${actionToPerform eq 'deleteThreshold'}" /> 

  <input type="hidden" name="toPerform" value="<c:out value='${actionToPerform}'/>"/>
  <input type="hidden" name="actionToPerform" value="<c:out value='${actionToPerform}'/>" />

  <c:if test="${actionToPerform ne 'addThresholdForm'}">

  <tr> 
    <td height="12" colspan="4"></td>
  </tr>
  <tr align="left"> 
    <td  height="25" align="left" width="185" ><span class="pageHeader">
    <fmt:message key='webclient.perf.thresholds.available'/></span> </td>
    <td  height="25" align="left"  >

  <select  class="formstyle" name="thresholdData" onchange="selectThreshold(this.options[this.selectedIndex].value);">
    <c:forEach var="tName" items="${nameData}"> 
    <option value='<c:out value="${tName}"/>' <c:if test="${tName==threshName}"> selected </c:if>> 
   <c:out value="${tName}"/></option> </c:forEach> </select> </td>
   <td colspan="2" align="left" class="text">&nbsp;</td>  
  </tr>
  </c:if> 

  <tr> 
    <td height="12" colspan="4"></td>
  </tr>
 
  <%-- Added for bg color top --%>
 
  <tr align="left" valign="top"> 
    <td colspan="3" nowrap > <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr align="left" valign="top"> 
          <td colspan="5" nowrap > <div id="pageL" style="display:block"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
               
                <tr > 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.kind'/></td>
                  <td align="left" class="text">
                <c:choose>
             <c:when test="${actionToPerform ne 'addThresholdForm'}">
         <html-el:text property="kind" name="ThresholdObject" styleClass="formstyle" disabled="${isDisabled}" readonly="${isReadOnly}" />
            </c:when>
            <c:otherwise>
        <html-el:select property="kind" name="ThresholdObject" styleClass="formstyle" onclick="ShowReqTab(this.options[this.selectedIndex].value)">
                      <html-el:option value="long">long</html-el:option>
                      <html-el:option value="string">string</html-el:option>
                      <html-el:option value="percentage">percentage</html-el:option>
                    </html-el:select>
 </c:otherwise>
     </c:choose>
</td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr > 
                  <td class="text">&nbsp;</td>
                  <td width="180" height="30" class="text"><fmt:message key='webclient.perf.threshold.name'/></td>
                  <td align="left" class="text"> <html-el:text name="ThresholdObject" property="name"  disabled="${isDisabled}" styleClass="formStyle" readonly="${isReadOnly}"/> <font color="red" size="2" weight="300" >*</font></td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr > 
                  <td class="text">&nbsp;</td>
                  <td width="180" height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.category'/></td>
                  <td align="left" class="text"> <html-el:text name="ThresholdObject" property="category"  disabled="${isDisabled}" styleClass="formStyle" /> <font color="red" size="2" weight="300" >*</font></td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
              </table>
            </div></td>
        </tr>
        <tr align="left" valign="top"> 
          <td colspan="5" nowrap > <div id="pageLongPt" style="display:block"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td width="180" height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.severity'/></td>
                  <td align="left" class="text"> <html-el:select name="ThresholdObject" property="severity"  disabled="${isDisabled}" styleClass="formStyle"   > 
                    <c:forEach var="key" items="${severityProps}" varStatus="status"> 
                    <html-el:option value='${key.value}' > <c:out value="${key.key}"/></html-el:option> 
                    </c:forEach> </html-el:select> <font color="red" size="2" weight="300" >*</font> </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.threstype'/></td>
                  <td align="left" class="text"> <html-el:select name="ThresholdObject" property="thresholdType"  disabled="${isDisabled}" styleClass="formStyle"  > 
                    <html-el:option value='equal'><fmt:message key='webclient.perf.threshold.equal'/></html-el:option> 
                    <html-el:option value='max'><fmt:message key='webclient.perf.threshold.max'/></html-el:option> 
                    <html-el:option value='min'><fmt:message key='webclient.perf.threshold.min'/></html-el:option> 
                    </html-el:select> </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.thresval'/></td>
                  <td align="left" class="text"> <html-el:text name="ThresholdObject" property="thresholdValue"  disabled="${isDisabled}" styleClass="formStyle" /> <font color="red" size="2" weight="300" >*</font></td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.rearmval'/></td>
                  <td align="left" class="text"> <html-el:text name="ThresholdObject" property="rearmValue"  disabled="${isDisabled}" styleClass="formStyle"  /> <font color="red" size="2" weight="300" >*</font></td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.sendclr'/></td>
                  <td align="left" class="text"> <html-el:select name="ThresholdObject" property="sendClear"  disabled="${isDisabled}" styleClass="formStyle" > 
                    <html-el:option value='true'><fmt:message key='webclient.perf.threshold.true'/></html-el:option> 
                    <html-el:option value='false'><fmt:message key='webclient.perf.threshold.false'/></html-el:option> 
                    </html-el:select> </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
              </table>
            </div></td>
        </tr>
        <tr align="left" valign="top"> 
          <td colspan="5" nowrap > <div id="pageString" style="display:none"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td width="180" height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.tseverity'/></td>
                  <td align="left" class="text"> <html-el:select name="ThresholdObject" property="triggerSeverity"  disabled="${isDisabled}" styleClass="formStyle"  > 
                    <c:forEach var="key" items="${severityProps}" varStatus="status"> 
                    <html-el:option value="${key.value}"> <c:out value="${key.key}"/></html-el:option> 
                    </c:forEach> </html-el:select> </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.rseverity'/></td>
                  <td align="left" class="text"> <html-el:select name="ThresholdObject" property="resetSeverity"  disabled="${isDisabled}" styleClass="formStyle"  > 
                    <c:forEach var="key" items="${severityProps}" varStatus="status"> 
                    <html-el:option value="${key.value}"> <c:out value="${key.key}"/></html-el:option> 
                    </c:forEach> 
                    <%--
     <html-el:option value='clear'><fmt:message key='webclient.perf.threshold.critical'/></html-el:option> 
				   <html-el:option value='warning'><fmt:message key='webclient.perf.threshold.major'/></html-el:option> 
                   <html-el:option value='minor'><fmt:message key='webclient.perf.threshold.minor'/></html-el:option> 
                   <html-el:option value='major'><fmt:message key='webclient.perf.threshold.warning'/></html-el:option> 
				   <html-el:option value='critical' ><fmt:message key='webclient.perf.threshold.clear'/></html-el:option> 
                  --%>
                    </html-el:select> </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td width="180" height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.allval'/></td>
                  <td align="left" class="text"> <html-el:text name="ThresholdObject" property="allowed"  disabled="${isDisabled}" styleClass="formStyle"  />  <font color="red" size="2" weight="300" >*</font>
                  </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.disall'/></td>
                  <td align="left" class="text"> <html-el:text name="ThresholdObject" property="disAllowed"  disabled="${isDisabled}" styleClass="formStyle"  />  <font color="red" size="2" weight="300" >*</font>
                  </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
              </table>
            </div></td>
        </tr>
        <tr align="left" valign="top"> 
          <td colspan="5" nowrap> <div id="pagePercent" style="display:none"> 
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td width="180" height="25" class="text"><fmt:message key='webclient.perf.threshold.prop.objid'/></td>
                  <td align="left" nowrap  class="text"> <html-el:text name="ThresholdObject" property="oid"  disabled="${isDisabled}" styleClass="formStyle"  />  <font color="red" size="2" weight="300" >*</font>
                    <c:if test="${actionToPerform ne 'deleteThreshold'}">
                    &nbsp;&nbsp; 
                    <input type="button" class="button" value='<fmt:message key='webclient.perf.addpo.select'/>' onclick="javascript:window.open('/perf/GetSnmpOid.do?formName=ThresholdObject', 
                    'OID', 'scrollbars=yes,width=550,height=320,screenX=650,screenY=150,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=yes')">  </c:if>
                   </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
                <tr> 
                  <td class="text">&nbsp;</td>
                  <td height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.objidtype'/></td>
                  <td align="left" class="text"> <html-el:select name="ThresholdObject" property="isMultiplePolledData"  disabled="${isDisabled}" styleClass="formStyle"   > 
                    <html-el:option value='node'><fmt:message key='webclient.perf.threshold.node'/></html-el:option> 
                    <html-el:option value='interface'><fmt:message key='webclient.perf.threshold.interface'/></html-el:option> 
                    <html-el:option value='multiple'><fmt:message key='webclient.perf.threshold.multiple'/></html-el:option> 
                    </html-el:select> </td>
                  <td colspan="2" align="left" class="text">&nbsp;</td>
                </tr>
              </table>
            </div></td>
        </tr>
        <tr align="left" valign="top"> 
          <td colspan="5" nowrap > <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td class="text">&nbsp;</td>
                <td  width="180" height="30" class="text"><fmt:message key='webclient.perf.threshold.prop.message'/></td>
                <td align="left" class="text"> <html-el:text name="ThresholdObject" property="message"   disabled="${isDisabled}" styleClass="formStyle"/></td>
                <td colspan="2" align="left" class="text">&nbsp;</td>
              </tr>
              <tr> 
                <td class="text">&nbsp;</td>
                <td height="25" class="text"><fmt:message key='webclient.perf.threshold.prop.cmsg'/></td>
                <td align="left" class="text"> <html-el:text name="ThresholdObject" property="clrMessage"  disabled="${isDisabled}" styleClass="formStyle"/></td>
                <td colspan="2" align="left" class="text">&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
    <td valign="top" >&nbsp;</td>
  </tr>
  <tr> 
    <td height="8" colspan="4">&nbsp; </td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
 <tr class="header2Bg">
    <td class="liteBlueBg" width="12%">&nbsp;</td>
  
      <td align="left" class="liteBlueBg" width="88%"> <input name="rsubmit" type="submit" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" onclick="return validateandSubmit()"> 
      <input name="Reset" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.clear'/>" onclick="resetFields()"> 
      <input name="Cancel" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/perf/ConfiguredCollection.do';"> 
    </td>
  </tr>
  
</table></td>
  </tr>
</table>
</td>
    <td class="generalCurveRight">&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</html:form> 
</body>



<%
String tType = (String)request.getAttribute("threshType");
if( tType != null && tType.equals("string"))
{
%>
<script>
ShowReqTab('headerTwo')
</script>
<%
}
else if(tType != null && tType.equals("percentage"))
{   
%>
<script>
ShowReqTab('headerThree')
</script>
<%
}
%>
<%--
<html:javascript formName="ThresholdObject"/> --%>
</html>
