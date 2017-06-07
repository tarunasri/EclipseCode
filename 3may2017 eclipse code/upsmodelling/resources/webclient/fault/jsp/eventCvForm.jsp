<%-- $Id: eventCvForm.jsp,v 1.6 2010/10/29 13:47:07 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><c:out value="${title}"/></title>

<script language="javascript" src="/webclient/common/js/DateComponent.js" type="text/javascript"></script>
<script language="javascript" src="/webclient/fault/js/fault.js" type="text/javascript"></script>

<script>
invalidDateMessage = '<fmt:message key="webclient.fault.customview.event.time.invaliddate.message"/>';
</script>

</head>
<body onLoad="javascript:eventAgeController()">

<html:form action="/eventCVAction" onsubmit="return validateEventCVForm(this);">

<span class="errorText"><html:errors/></span>

<input type=hidden name="viewId" value="<c:out value='${param.viewId}'/>">
<input type=hidden name="actionToPerform" value="<c:out value='${param.actionToPerform}'/>">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.fault.title.header'/></h1></td>
        </tr>
      </table>

<table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><c:out value="${title}"/></span></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
  <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  	<tr>
  	<td>
	<table width="100%" border="0" align="left" cellpadding="5"  cellspacing="0">
	<tr>
	<td width="20%">&nbsp;
	</td>
	<td width="30%">&nbsp;
	</td>        
        <td ><span class="mandatory">*</span>&nbsp;<span  class="textSmall"><fmt:message key='webclient.fault.customview.mandatory.message'/></span>
        </td>
        </tr>      
          <tr> 
            <td ><span class="boldText"><fmt:message key="webclient.fault.customview.customviewname"/></span></td>
            <td><html:text property="cvName" name="EventCVForm"  maxlength="100"  styleClass="formStyle"/><span class="mandatory">&nbsp*</span></td>
            <td><span class="text"><fmt:message key='webclient.fault.customview.cvname'/></span></td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.customview.field.severity"/></span></td>
            <td><table width="100%" border="0" cellspacing="0" class="nobotborder" cellpadding="0" align="left">


                <c:set var="colIndex" value="0"/>
                <c:set var="rowIndex" value="0"/>
                <c:forEach var="sev" items="${severityList}" varStatus="status" >
                    <c:choose>
                       <c:when test='${colIndex == 0}'>
                             <tr>                     
                           <c:set var="colIndex" value='${colIndex+1}'/>
                             <td>    
                             <html:multibox name="EventCVForm" property="severity"> 
                             <c:out value="${sev}"/>
                             </html:multibox>
                             <span class="text"><c:out value="${sev}"/></span>
                            </td>
                       </c:when>
                      <c:when test='${colIndex == 1}'>
                             <td>    
                             <html:multibox name="EventCVForm" property="severity"> 
                             <c:out value="${sev}"/>
                             </html:multibox>
                             <span class="text"><c:out value="${sev}"/></span>
                            </td>
                             <c:set var="colIndex" value="0"/>
                             <c:set var="rowIndex" value='${rowIndex+1}'/>
                             </tr>
                       </c:when>
                   </c:choose>
                </c:forEach>

              </table></td>
              <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.customview.field.source"/></span></td>
            <td><html:text property="source" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.customview.field.entity"/></span></td>
            <td><html:text property="entity" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.customview.field.text"/></span></td>
            <td><html:text property="text" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>


          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.customview.field.category"/></span></td>
            <td><html:text property="category" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.customview.field.node"/></span></td>
            <td><html:text property="node" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>
           
          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.customview.field.network"/></span></td>
            <td><html:text property="network" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.event.customview.field.fromtime"/></span></td>
            <td width="215"><html:text property="fromTime" styleClass="formStyle"/>
            <a href="javascript:popupWin(document.EventCVForm.fromTime,'/DateInput.do')"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/cal.gif" hspace="4" border="0" alt="<fmt:message key='webclient.fault.customview.calendarimg.alttile'/>" title="<fmt:message key='webclient.fault.customview.calendarimg.alttile'/>"></a></td>
            <td><span class="text"><fmt:message key='webclient.fault.customview.calendar.message'/></span></td>
          </tr>
          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.event.customview.field.totime"/></span></td>
            <td width="215"><html:text property="toTime" styleClass="formStyle"/>
            <a href="javascript:popupWin(document.EventCVForm.toTime,'/DateInput.do')"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/cal.gif" hspace="4"  border="0" alt="<fmt:message key='webclient.fault.customview.calendarimg.alttile'/>" title="<fmt:message key='webclient.fault.customview.calendarimg.alttile'/>"></a></td>
            <td>&nbsp;</td>
          </tr>                   

          <tr> 
            <td><span class="text"><fmt:message key="webclient.fault.event.customview.field.eventage"/></span></td>
             <td nowrap>
                <p>
                 <html:select  style="width:110" styleClass="formStyle" name="EventCVForm" property="eventAgeCategory" onchange="javascript:eventAgeController()">
                   <html:option value='any'><fmt:message key='webclient.fault.customview.age.any'/></html:option>     
                   <html:option value='RMi'><fmt:message key='webclient.fault.customview.age.minutes'/></html:option>     
                   <html:option value='RHr'><fmt:message key='webclient.fault.customview.age.hours'/></html:option>     
                   <html:option value='RDy'><fmt:message key='webclient.fault.customview.age.days'/></html:option>     
                   <html:option value='ADy == 1'><fmt:message key='webclient.fault.customview.age.today'/></html:option>     
                   <html:option value='ADy == 2'><fmt:message key='webclient.fault.customview.age.yesterday'/></html:option>     
                 </html:select>
                 <html:select  style="width:43" styleClass="formStyle" name="EventCVForm" property="operator">
                     <html:option value="<"> < </html:option>
                     <html:option value="<="> <= </html:option>
                     <html:option value=">"> > </html:option>
                     <html:option value=">="> >= </html:option>
                 </html:select>

                <html:text property="ageValue" styleClass="formStyle" style="width:30" maxlength="2"/>
                </p>
                <p><span class="text"><fmt:message key='webclient.fault.customview.age.refresh'/></span>&nbsp;&nbsp;&nbsp;<html:text property="refreshPeriod" styleClass="formStyle" style="width:30" maxlength="2"/></p>
             </td>   
               <td>
               <span class="text">     
               <p><fmt:message key='webclient.fault.customview.event.agevalue.message'/></p>   
               <p><fmt:message key='webclient.fault.customview.event.refreshperiod.message'/></p>   
                </span>    
               </td>     
          </tr>

          <tr> 
           <td align="right">&nbsp;</td>
            <td colspan="2"> 
       
           <input type="submit" name="Submit" class=button value="<fmt:message key='webclient.fault.event.customview.button.submit'/>"> 
           <input type="button" name="Cancel" class=button value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/fault/NetworkEvent.do';">
           <input type="reset" name="Reset" class=button value="<fmt:message key='webclient.fault.alarm.customview.button.clear'/>">
              </td>
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
<html:javascript formName="EventCVForm"/> 
</body>
</html>
