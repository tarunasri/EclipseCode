<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script type="text/javascript">
	//var time="Hour";
	//var length=10;

function getReport(length,time)
{	
	var url="/report/FaultReport.do?category=AllEvents&selectparent=alert&type=n-report&time="+time+"&count="+length;
	window.location.href=url;
}
function ggetFaultReport(value)
{

	var url="/report/FaultReport.do?category=AllEvents&selectparent=alert&type=category";
	window.location.href=url;	
}

</script>

<tr> 
	<td colspan="2"> 
		<%--<h1><fmt:message key='Top N Device Reports'/> </h1>--%>
		<table width="99%" border="0" align="left" cellpadding="3" cellspacing="0" class="tablebdr1" style="padding:0px; "> 

			<tr class="oddRow"> 
				<td height="30" ></td>
				<td align =right><fmt:message key="webclient.report.event.select"/> <c:set var="selectedVal" value="${ReportsPeriod}"/> 
					<select name="Period" class="comboStyle" onchange="javascript:getReport('<c:out value='${ReportsLength}'/>',this.options[this.options.selectedIndex].value)"> 
						<option value="Hour" 

						<c:if test="${ReportsPeriod == 'Hour'}">
						selected="true" </c:if> ><fmt:message key='webclient.report.event.completeHour'></fmt:message>
						</option> 
						<option value="Week" 
						<c:if test="${ReportsPeriod == 'Week'}">
						selected="true" </c:if> ><fmt:message key='webclient.report.event.oneweek'></fmt:message> 
						</option> 
						<option value="Month" 
						<c:if test="${ReportsPeriod == 'Month'}">
						selected="true" </c:if> ><fmt:message key='webclient.report.event.onemonth'></fmt:message> 
						</option>  
						<!-- Title and the Top N List goes here --> 
						<span class="Text">&nbsp;&nbsp;<fmt:message key='webclient.report.topNreports'/></span><span class="text"> <c:set var="selectedVal" value="${ReportsLength}"/> 
							<select class="comboStyle" name="Length" onchange="getReport(this.options[this.options.selectedIndex].value,'<c:out value='${ReportsPeriod}'/>')"> 
								<c:out value="${ReportsPeriod}"/> <option value="5" 
								<c:if test="${ReportsLength == '5'}">
								selected="true" </c:if> ><fmt:message key='5'></fmt:message>

								</option> 
								<option value="10"
								<c:if test="${ReportsLength == '10'}">
								selected="true" </c:if> ><fmt:message key='10'></fmt:message>   

								</option> 
								<option value="15"
								<c:if test="${ReportsLength == '15'}">
								selected="true" </c:if> ><fmt:message key='15'></fmt:message>   
								</option> 
								<option value="20"
								<c:if test="${ReportsLength == '20'}">
								selected="true" </c:if> ><fmt:message key='20'></fmt:message>  

								</option> 
							</select>  
							<fmt:message key='webclient.report'/></span> </td> 
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
				<tr><td colspan="2" align="center"><img  src="<c:out value='${filepath_barchart}'/>" width="<c:out value='${width}'/>" height="<c:out value='${height}'/>" border="0" usemap="#<c:out value='${filepath_barchart}'/>" ></td></tr>
				</c:otherwise>
				</c:choose>
			</table>
			<%--$Id: TopNFaultReport.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $%--%>
