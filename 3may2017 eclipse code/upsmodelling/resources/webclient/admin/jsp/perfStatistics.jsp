<%-- $Id: perfStatistics.jsp,v 1.2 2010/10/29 13:46:54 swaminathap Exp $ --%>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.modulestatus.title'/></title>
<script language="javascript" src="/webclient/common/js/DateComponent.js" type="text/javascript"></script>
<script>
function popupWin(field, action)
{
    // set index for custom option
    //document.forms[1].period.selectedIndex = 3;
    document.PerfViewForm.period.selectedIndex = 3;
    doCustomPeriodSelectAction(document.PerfViewForm);
    var obj = new DateObject(field, action);
    obj.popup();
}

startDateMessage = '<fmt:message key="webclient.performance.reports.period.startdate.message"/>';
endDateMessage = '<fmt:message key="webclient.performance.reports.period.enddate.message"/>';
invalidDateMessage = '<fmt:message key="webclient.performance.reports.period.invaliddate.message"/>';
noagentmsg = '<fmt:message key="webclient.performance.reports.required"><fmt:param><fmt:message key="webclient.performance.reports.managedobject.required"/></fmt:param></fmt:message>';

function doCustomPeriodSelectAction(form)
{
	if (form.period.selectedIndex != 3)
	{
		form.startDate.value="";
		form.startDate.className = "formStyleDisabled";
		form.endDate.value="";
		form.endDate.className="formStyleDisabled";
	}
	else
	{
		form.startDate.className = "formStyle";
		form.endDate.className = "formStyle";
	}
}

function init()
{
<c:if test='${empty param.period || param.period != "custom"}'>
   //document.forms[1].startDate.className = "formStyleDisabled";
   //document.forms[1].endDate.className = "formStyleDisabled";
   //document.forms[1].elements[0].focus();
   document.PerfViewForm.startDate.className = "formStyleDisabled";
   document.PerfViewForm.endDate.className = "formStyleDisabled";
   document.PerfViewForm.elements[0].focus();
</c:if>
}
</script>
</head>
<html:javascript formName="PerfViewForm"/>

<body onload="init()">
<html:form action="/PerfModuleStatus.do" method="post" onsubmit="return validatePerfViewForm(this)">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="10">&nbsp;</td>
      <td height="30" valign="bottom"><span class="header1"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.title'/></span></td>
    </tr>
    <tr> 
      <td height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>

    <tr> 
      <td>&nbsp;</td>
      <td valign="top"><table width="100%" border="0" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="15" height="20">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr class="text"> 
            <td>&nbsp;</td>
            <td>

                    <table width="100%" border="0" cellpadding="3" cellspacing="2" class="botBorder">
                     <tr> 
                       <td height="25" colspan="7" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.nodenametitle'/><c:out value="${nodename}"/></span></td>
					   </tr>
					   <tr>
					   <td ROWSPAN="2" class="propertyLeftBg" width=20%><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.name'/></span></td>
					   <td COLSPAN="3" class="propertyLeftBg" align="center"><span class="text">
					   <fmt:message key='webclient.admin.systemadmin.modulestatus.perf.dcstatus'/>
					   </span></td>
					   <td ROWSPAN="2" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.dcenabled'/></span></td>
					   <td ROWSPAN="2" class="propertyLeftBg" width=22%><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.lasttime'/></span></td>
					   <td ROWSPAN="2" class="propertyLeftBg" width=22%><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.nexttime'/></span></td>
					   </tr>
					   <tr>						   
					   <td class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.datacount'/></span></td>
					   <td class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.pollperct'/></span></td>
					   <td class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.perf.pollint'/></span></td>					   
					   </tr>
					   
					 <c:forEach var="perfStat" items="${stats}">
					 	<c:set var="statistics" value = "${perfStat}"/>
						<tr>

						<td  class="text"><c:out value="${statistics.name}"/></td>
						<c:set target="${statistics}" property = "name" value = "${null}"/>
						
						<td  class="text"><c:out value="${statistics.averagedc}"/></td>
						<c:set target="${statistics}" property = "averagedc" value = "${null}"/>
						
						<td  class="text"><c:out value="${statistics.statimg}"/></td>
						<c:set target="${statistics}" property = "statimg" value = "${null}"/>

						<td  class="text"><c:out value="${statistics.pollint}"/></td>
						<c:set target="${statistics}" property = "pollint" value = "${null}"/>

						<td  class="text"><c:out value="${statistics.active}"/></td>
						<c:set target="${statistics}" property = "active" value = "${null}"/>
						<td  class="text"><c:out value="${statistics.lasttime}"/></td>
						<c:set target="${statistics}" property = "lasttime" value = "${null}"/>
						<td  class="text"><c:out value="${statistics.nexttime}"/></td>
						<c:set target="${statistics}" property = "nexttime" value = "${null}"/>
						</tr>
				 </c:forEach>

				 
				 <tr>
				 <td height="25" colspan="6" align="left" valign="top" width="250" ></td>
				 <%@ include file="/webclient/admin/jspf/inputOptions.jspf"%>
				 </td>
				 <td align="left">&nbsp;</td>
				 </tr>
				 
        </table></td>
    </tr>
  </table>
  </html:form>
</body>
</html>

