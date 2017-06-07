<%-- $Id: rediscoveryschedular.jsp,v 1.5 2010/10/29 13:46:54 swaminathap Exp $--%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.rediscovery.title'/></title>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="Javascript" src="/webclient/admin/js/discoveryConfiguration.js" type="text/javascript"></script>
<%@include file="/webclient/admin/jspf/discoveryConfiguration.jspf" %>
</head>
<body>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.admin.discovery.rediscschedular'/></h1></td>
        </tr>
      </table>


<html:form action="/ReDiscSchedular"> 

<table style="margin-bottom:10px;" width="60%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:10">
  </tr>
  <c:if test="${!empty successMsg}"> 
  <tr> 
    <td class="responseText" align="center" height="40"><img valign="centre" src="/webclient/common/images/tick.gif" hspace="4"><c:out value="${successMsg}"/></td>
  </tr>
  </c:if> 
</table>

<table width="98%" border="0" cellspacing="0" cellpadding="0" class="htableBorder" style="margin-left:10">
  <tr class="header2bg"> 
    <td height="25" class="boldText"><fmt:message key='webclient.admin.discovery.rediscschedulardetails'/>:</td>
    <td class="header2Bg" align="right"><span class="boldText"> <input name="schedular" type="radio" value="regularInt" <c:if test="${ReDiscForm.map.reDiscInt ne '-1'}"> 
      checked </c:if> onclick="javascript:toggleScheduler()"><fmt:message key='webclient.admin.discovery.schedular.regularinterval'/></span> 
      <span class="boldText"> <input type="radio" name="schedular" value="userSchedular" <c:if test="${ReDiscForm.map.reDiscInt eq '-1'}"> 
      checked </c:if> onclick="javascript:toggleScheduler()"><fmt:message key='webclient.admin.discovery.schedular.userschedular'/></span> 
    </td>
  </tr>
  <tr> 
    <td colspan="2"> <div id="regularInterval" <c:if test="${ReDiscForm.map.reDiscInt eq '-1'}"> style="display:none" </c:if>> 
        <table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="25%" nowrap class="text" align="right"><fmt:message key='webclient.admin.discovery.schedular.rediscoveryinterval'/>:</td>
            <td class="text"><html:text property="reDiscInt" name="ReDiscForm" styleClass="formStyleSmall"/>&nbsp;<fmt:message key='webclient.admin.discovery.schedular.hours'/></td>
        </table>
      </div>
      <div id="userScheduler" <c:if test="${ReDiscForm.map.reDiscInt ne '-1'}"> style="display:none" </c:if>> 
        <table width="100%" border="0" cellpadding="3" cellspacing="1">
          <tr> 
            <td width="25%" nowrap class="text" align="right"><fmt:message key='webclient.admin.discovery.userschedular.basedon'/>
              </td>
            <td class="text"> <input type="radio" name="dateorday" value="dayBased" <c:if test="${ReDiscForm.map.allDaysOfWeek eq '*' || !empty ReDiscForm.map.daysOfWeek }"> 
              checked</c:if> onclick="javascript:toggleSchBasedOn()"><fmt:message key='webclient.admin.discovery.schedular.daybased'/> 
			  <input type="radio" name="dateorday" value="dateBased" <c:if test="${ReDiscForm.map.daysOfMonth ne '-1' || ReDiscForm.map.allDaysinMonth ne '-1'}">checked</c:if> 
              onclick="javascript:toggleSchBasedOn()"><fmt:message key='webclient.admin.discovery.schedular.datebased'/> 
            </td>
          </tr>
          <tr> 
            <td nowrap class=" text" align="right" valign="top"><fmt:message key='webclient.admin.discovery.frequency'/>:</td>
            <td class="text"> <div id="dayBasedLayer" <c:if test="${ReDiscForm.map.daysOfMonth ne '-1' || ReDiscForm.map.allDaysinMonth ne '-1'}">style="display:none"</c:if>> 
                <select name="days" onChange="javascript:toggleSchFreqncy('days',this.value)">
                  <option value="allDays" <c:if test="${ReDiscForm.map.allDaysOfWeek eq '*'}">selected</c:if>>
				  	<fmt:message key='webclient.admin.discovery.schedular.daybased.alldays'/>
				  </option>
				  <option value="selDays" <c:if test="${ReDiscForm.map.allDaysOfWeek ne '*'}">selected</c:if>>
				  	<fmt:message key='webclient.admin.discovery.schedular.daybased.selecteddays'/>
				  </option>
                </select>
                <div id="dow" <c:if test="${ReDiscForm.map.allDaysOfWeek eq '*'}">style="display:none"</c:if>> 
				  <html-el:select name="ReDiscForm" property="daysOfWeek" multiple="true" size="7" styleClass="formStyleSmall" style="margin-top:5;height:auto"> 
                   	<c:forEach var="days" items="${listOfDays}"> 
				   		<option value="<c:out value='${days}'/>" <c:forEach var="selected" items="${ReDiscForm.map.daysOfWeek}"> 
                  			<c:if test="${days == selected}"><c:out value="${selected}"/> 
                  			selected</c:if> </c:forEach>><fmt:message><c:out value="webclient.admin.discovery.days.${days}"/></fmt:message>
				  		</option> 
                  	</c:forEach> 
				  </html-el:select> 
				  <br>
				  [ <fmt:message key='webclient.admin.discovery.schedulers.selectioninfo'/> ]
				  <p></p>
				</div>
              </div>
              <div id="dateBasedLayer" <c:if test="${ReDiscForm.map.allDaysOfWeek eq '*' || !empty ReDiscForm.map.daysOfWeek }">style="display:none"</c:if>>
                <select name="dateBased" onChange="javascript:toggleSchFreqncy('dateBased',this.value)">
                  <option value="allDays" <c:if test="${ReDiscForm.map.allDaysinMonth eq '*'}">selected</c:if>>
				  	<fmt:message key='webclient.admin.discovery.schedular.datebased.daily'/>
				  </option>
				  <option value="selectedDates" <c:if test="${ReDiscForm.map.allDaysinMonth ne '*'}">selected</c:if>>
				  	<fmt:message key='webclient.admin.discovery.schedular.datebased.selecteddates'/>
				  </option>
                </select>
                <div id="customDates" <c:if test="${ReDiscForm.map.allDaysinMonth eq '*'}">style="display:none"</c:if>>
					<c:choose> 
						<c:when test="${ReDiscForm.map.allDaysinMonth eq '*'}"> 
                  			<c:set var="style" value="formStyleSmallDisabled"/> 
							<c:set var="disabled" value="true"/> 
                  		</c:when>
						<c:otherwise> 
							<c:set var="style" value="formStyleSmall"/> 
							<c:set var="disabled" value="false"/>
						</c:otherwise>
					</c:choose> 
                  	<html-el:text property="daysOfMonth" styleClass="formStyleSmall"  style="margin-top:5;width:125"/> 
					<br>
					[ <fmt:message key='webclient.admin.discovery.schedulers.infomessage'/> ]
					<p></p>
                </div>
              </div>
			  </td>
          </tr>
          <tr> 
            <td nowrap class="text" align="right" valign="top"><fmt:message key='webclient.admin.discovery.schedular.hours.selectedhours'/>:</td>
            <td class="text"> 
			  <select name="hours" onChange="javascript:toggleSchHours(this.value)">
                <option value="allHours" <c:if test="${ReDiscForm.map.hour eq '*' }">selected</c:if>>
					<fmt:message key='webclient.admin.discovery.schedular.hours.allhours'/>
				</option>
				<option value="selHours" <c:if test="${ReDiscForm.map.hour ne '*'}">selected</c:if>>
					<fmt:message key='webclient.admin.discovery.schedular.hours.selected'/>
				</option>
              </select>
              <div id="scheduleHours" <c:if test="${ReDiscForm.map.hour eq '*' }">style="display:none"</c:if>> 
			  	<c:choose> 
					<c:when test="${empty ReDiscForm.map.selectedHour}"> 
                		<c:set var="fieldStyle" value="formStyleSmallDisabled"/>
						<c:set var="fieldDisabled" value="true"/> 
					</c:when>
					<c:otherwise>
						<c:set var="fieldStyle" value="formStyleSmall"/> 
						<c:set var="fieldDisabled" value="false"/>
					</c:otherwise>
				</c:choose> 
                <html-el:text property="selectedHour" styleClass="formStyleSmall" style="margin-top:5;width:125"/> 
				<br>
                [ <fmt:message key='webclient.admin.discovery.schedulers.infomessage'/> ]
				<p></p>
              </div>
			  </td>
          </tr>
        </table>
      </div>

</td>
  </tr>
</table>
<table width="75%">
  <tr> 
    <td height="1" align="center"> <input name="Submit" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.submit'/>" onclick="javascript:validatethisformandSubmit()"> 
      <input name="Cancel" type="button" class="button" onclick="javascript:completeview()" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>"> 
    </td>
  </tr>
</table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</td></tr></table>
 
</html:form> 
</body>
</html>

<script>
if (document.ReDiscForm.dateorday[0].checked==false && document.ReDiscForm.dateorday[1].checked==false) {
	document.ReDiscForm.dateorday[0].checked=true;
	toggleSchBasedOn();
	document.ReDiscForm.days[0].selected=true;
	document.getElementById("dow").style.display="none";
	document.ReDiscForm.dateBased[0].selected=true;
	document.getElementById("customDates").style.display="none";	
	document.ReDiscForm.hours[0].selected=true;
	document.getElementById("scheduleHours").style.display="none";
}
</script>
