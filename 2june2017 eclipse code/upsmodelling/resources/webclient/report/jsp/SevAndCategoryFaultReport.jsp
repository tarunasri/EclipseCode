<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script type="text/javascript">
	var selected='<c:out value="${select}"/>';
	var time='<c:out value="${ReportsPeriod}"/>';
function getFaultReport(value)
{
	var group='<c:out value="${type}"/>';

	selected=value;	
	var url="/report/FaultReport.do?category=AllEvents&selectparent=alert&time="+time+"&type=all"+group;
	window.location.href=url;	
}


function getReport(option)
{
	time=option;
	if(selected=='AllEvents')
	{
		getFaultReport(selected);

	}
	else
	{
		getDeviceFaultReport(document.getElementById("inputform").source.value);
	}
}

function getDeviceFaultReport(src)
{
	var group='<c:out value="${type}"/>';
	for (var i=0; i < document.getElementById("inputform").details.length; i++)
	{
		if (document.getElementById("inputform").details[i].checked)
		{
			selected = document.getElementById("inputform").details[i].value;
		}
	}	
	if(selected=='AllEvents')
	{
		getFaultReport(selected);
	}
	else{

		var url="/report/FaultReport.do?category=devicespecific&selectparent=alert&type=device"+group+"&time="+time+"&source="+src;		
		window.location.href=url;
	}
}

</script>
<tr> 
	<td nowrap colspan="2"> 
		<%--<h1><fmt:message key='Severity Vs Time Report'/> </h1>--%>
		<table width="99%" border="0" align="left" cellpadding="3" cellspacing="0" class="tablebdr1" style="padding:0px; "> 

			<tr class="oddRow"> 
				<td height="30" width="1%"><fmt:message key="webclient.report.event.select"/></td><td><form id="inputform"> 
						<input type="radio" name="details" id="details" value="AllEvents" <c:if test="${select == 'AllEvents'}"> checked </c:if> /> <fmt:message key="webclient.report.event.allEvents"/>
						<input type="radio" name="details" id="details" value="devicespecific" <c:if test="${select == 'devicespecific'}"> checked </c:if> /> <fmt:message key="webclient.report.event.deviceSpecific"/>
						<input type="text" name="source" id="source" value="<c:out value='${source}'/>"  autocomplete="on"/> <input type="button" value="<fmt:message key='webclient.report.event.goButton'></fmt:message>" class="button" name="Go" onclick="javascript:getDeviceFaultReport(inputform.source.value)"/> 
				</form></td> 
				<td align =right> 
					<c:set var="selectedVal" value="${ReportsPeriod}"/> 
					<select name="Period" class="comboStyle" onchange="javascript:getReport(this.options[this.options.selectedIndex].value)"> 
						<option value="Hour" <c:if test="${ReportsPeriod == 'Hour'}">selected="true"</c:if>> 
						<fmt:message key='webclient.report.event.completeHour'></fmt:message> 
						</option> 
						<option value="Week" <c:if test="${ReportsPeriod == 'Week'}">selected= "true"</c:if> > 
						<fmt:message key='webclient.report.event.oneweek'></fmt:message> 
						</option> 
						<option value="Month" <c:if test="${ReportsPeriod == 'Month'}">selected="true"</c:if>> 
						<fmt:message key='webclient.report.event.onemonth'></fmt:message> 
						</option> 
					</td> 
				</tr> 


				<c:choose>
				<c:when test="${filepath_barchart=='No Data Available'}">
				<tr>
					<td></td>
				</tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>		
					<td colspan=3 class="txtGlobalBold" align="center"><fmt:message key='webclient.topo.objectdetails.router.nograph'/></td>
				</tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>
				<tr>	<td>&nbsp;</td> </tr>



				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="3"  align="center">
						<img src="<c:out value='${filepath_barchart}'/>" width="<c:out value='${width}'/>" height="<c:out value='${height}'/>" border="0" usemap="#<c:out value='${filepath_barchart}'/>" > 
				</td> </tr>
				</c:otherwise>
				</c:choose>

			</tr> 
		</table> 
		<%--$Id: SevAndCategoryFaultReport.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $--%>
