<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ taglib prefix="html"
	uri="http://jakarta.apache.org/struts/tags-html"%>
<%@include file="/webclient/common/jspf/commonIncludes.jspf"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<html>
<head>
<link href="/webclient/common/css/style/webnms.css" rel="stylesheet"
	type="text/css">

	<script type="text/javascript">
		var selected='<c:out value="${select}"/>';
		var time='<c:out value="${ReportsPeriod}"/>';
		var category="Topology";
		var categoryTitle='<fmt:message key='webclient.report.event.categoryvsseverity'/>';

function showPopUp(rresponse)
{
	var divelement=document.getElementById('catReport2');
	var duration;
	if(time == "Month")
	{
		duration = "<fmt:message key='webclient.report.last30days'></fmt:message>";
	}
	else if(time == "Week")
	{
		duration = "<fmt:message key='webclient.report.last7days'></fmt:message>";
	}
	else
	{
		duration = "<fmt:message key='webclient.report.today'></fmt:message>";
	}
	var titleString = categoryTitle+" ("+duration+")";
	document.getElementById('graphImg').innerHTML= rresponse;
	divelement.style.display='';
	document.getElementById('catText').innerHTML= titleString;

	setPosToDiv("resultTable","catReport2",650);

}

	</script>
<script type="text/javascript" src="/webclient/common/js/importxml.js"></script>
<script language="javascript" src="/webclient/common/js/general.js"
	type="text/javascript"></script>
<script language="javascript" src="/webclient/common/js/dashboard.js"
	type="text/javascript"></script>
	<script language="javascript" SRC="/webclient/report/js/reports.js" type="text/javascript"></script>

</head>
<body onLoad="javascript:setDefaultValues('<c:out value="${type}"/>','<c:out value="${Rows}"/>','<c:out value="${RowsCount}"/>'	);">

	


<c:choose>
	<%-- To handle display of Bar Graph --%>

	<c:when test="${filepath_barchart!='No Data Available'}">


		<c:choose>
			<c:when test="${type=='allSeverity' || type=='deviceSeverity'}">
				<%-- Handle Severity Vs Time Report --%>
				<div id="sevCatReport">
				<table style="margin-top: 10px; clear: both;" width="98%"
					align="center" border="0" cellspacing="0" cellpadding="0">
					<tr style="line-height: 1px">
						<td><img src="/webclient/common/images/greyCorner1.gif"
							border="0" /></td>
						<td class="greyBg3" width="100%"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
						<td><img src="/webclient/common/images/greyCorner2.gif"
							border="0" /></td>
					</tr>
					<tr>
						<td class="greyBg3"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
						<td nowrap="nowrap" class="greyBg3" style="padding: 5px;">
						<form id="inputform" method='get'
							action="javascript:getDeviceFaultReport(inputform.source.value,'Severity','<c:out value="${moType }"/>');"
							onSubmit="javascript:return validateForm(this.source.value)"><span
								class="boldTxt"><fmt:message key='webclient.report.event.category.header'/> :</span> <input
							style="vertical-align: middle; margin: 0px 0px 0px 20px; padding: 0px;"
							type="radio" value="AllEvents" id="a01" name="details"
							<c:if test="${select == 'AllEvents'}"> checked </c:if> />&nbsp;&nbsp;<label
							for="a01"><fmt:message
							key="webclient.report.event.allEvents" /></label><input
							style="vertical-align: middle; margin: 0px 0px 0px 20px; padding: 0px;"
							type="radio" value="devicespecific" id="a02" name="details"
							<c:if test="${select == 'devicespecific'}"> checked </c:if> />&nbsp;&nbsp;<label
							for="a02"> <fmt:message
							key="webclient.report.event.deviceSpecific" /> :</label> <c:choose>
							<c:when test="${!empty source}">
								<input style="margin-left: 10px; vertical-align: middle;"
									type="text" id="source" value="<c:out value='${source}'/>"
									onfocus="javascript:setDeviceSpecific(this);"
																		
									class="searchBox2" />
							</c:when>
							<c:otherwise>
								<input style="margin-left: 10px; vertical-align: middle;"
									type="text" id="source" value="enter single device..."
									onfocus="javascript:setDeviceSpecific(this);"									
									class="searchBox2" />

							</c:otherwise>
						</c:choose> <img style="margin-left: 6px;" class="pointer"
							src="/webclient/common/images/searchicon-2.gif" border="0"
							align="absmiddle"
							onclick="javascript:getDeviceFaultReport(inputform.source.value,'Severity','<c:out value="${moType }"/>')" />
						</form>
						</td>
						<td class="greyBg3"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
					</tr>
					<tr>
						<td><img src="/webclient/common/images/greyCorner4.gif"
							border="0" /></td>
						<td class="greyBg3"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
						<td><img src="/webclient/common/images/greyCorner3.gif"
							border="0" /></td>
					</tr>
				</table>


				<table style="margin-top: 10px; clear: both;" width="98%"
					align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center"><img
							src="<c:out value='${filepath_barchart}'/>"
							width="<c:out value='${evtwidth}'/>"
							height="<c:out value='${evtheight}'/>" border="0"
							usemap="#<c:out value='${filepath_barchart}'/>"></td>
					</tr>

				</table>
				</div>

			</c:when>


			<c:when test="${type=='allCategory' || type=='deviceCategory'}">
				<%-- Handle Category Vs Time Report --%>
				<div id="sevCatReport">
				<table style="margin-top: 10px; clear: both;" width="98%"
					align="center" border="0" cellspacing="0" cellpadding="0">
					<tr style="line-height: 1px">
						<td><img src="/webclient/common/images/greyCorner1.gif"
							border="0" /></td>
						<td class="greyBg3" width="100%"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
						<td><img src="/webclient/common/images/greyCorner2.gif"
							border="0" /></td>
					</tr>
					<tr>
						<td class="greyBg3"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
						<td nowrap="nowrap" class="greyBg3" style="padding: 5px;">
						<form id="inputform" method='get'
							action="javascript:getDeviceFaultReport(inputform.source.value,'Category','<c:out value="${moType }"/>');"
							onSubmit="javascript:return validateForm(this.source.value)"><span
								class="boldTxt"><fmt:message key='webclient.report.event.category.header'/> :</span> <input
							style="vertical-align: middle; margin: 0px 0px 0px 20px; padding: 0px;"
							type="radio" value="AllEvents" id="a01" name="details"
							<c:if test="${select == 'AllEvents'}"> checked </c:if> />&nbsp;&nbsp;<label
							for="a01"><fmt:message
							key="webclient.report.event.allEvents" /></label><input
							style="vertical-align: middle; margin: 0px 0px 0px 20px; padding: 0px;"
							type="radio" value="devicespecific" id="a02" name="details"
							<c:if test="${select == 'devicespecific'}"> checked </c:if> />&nbsp;&nbsp;<label
							for="a02"> <fmt:message
							key="webclient.report.event.deviceSpecific" /> :</label> <c:choose>
							<c:when test="${!empty source}">
								<input style="margin-left: 10px; vertical-align: middle;"
									type="text" id="source" value="<c:out value='${source}'/>"
									onfocus="javascript:setDeviceSpecific(this);"									
									class="searchBox2" />
							</c:when>
							<c:otherwise>
								<input style="margin-left: 10px; vertical-align: middle;"
									type="text" id="source" value="enter single device..."
									onfocus="javascript:setDeviceSpecific(this);"									
									class="searchBox2" />

							</c:otherwise>
						</c:choose> <img style="margin-left: 6px;" class="pointer"
							src="/webclient/common/images/searchicon-2.gif" border="0"
							align="absmiddle"
							onclick="javascript:getDeviceFaultReport(inputform.source.value,'Category','<c:out value="${moType }"/>')" />
						</form>
						</td>
						<td class="greyBg3"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
					</tr>
					<tr>
						<td><img src="/webclient/common/images/greyCorner4.gif"
							border="0" /></td>
						<td class="greyBg3"><img
							src="/webclient/common/images/spacer.gif" border="0" /></td>
						<td><img src="/webclient/common/images/greyCorner3.gif"
							border="0" /></td>
					</tr>
				</table>


				<table style="margin-top: 10px; clear: both;" width="98%"
					align="center" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td align="center"><img
							src="<c:out value='${filepath_barchart}'/>"
							width="<c:out value='${evtwidth}'/>"
							height="<c:out value='${evtheight}'/>" border="0"
							usemap="#<c:out value='${filepath_barchart}'/>"></td>

				</table>
				</div>

			</c:when>
			<c:when test="${type=='n-report'}">
				<%-- Handle N Fault Report --%>

				<table width="100%" border="0" align="left" cellpadding="0"
					cellspacing="0">
					<tr>
					
						<td align="center"><img
							src="<c:out value='${filepath_barchart}'/>"
							width="<c:out value='${evtwidth}'/>"
							height="<c:out value='${evtheight}'/>" border="0"
							usemap="#<c:out value='${filepath_barchart}'/>"/></td>
					</tr>
				</table>


			</c:when>
			<c:otherwise>
				<%-- handle complet category --%>
				<table id='resultTable' width="100%" cellspacing="0" cellpadding="0"
					border="0" style="margin-top: 1px; _margin-top: 0px;">

					<tr class="dgeneralTBHeader">
						<td width="20%" align="left" nowrap class="boldWhiteText"
							style="padding-left: 7px;"><fmt:message key='webclient.report.event.table.category'/></td>
						<c:forEach items="${sevNames}" var="item">
							<td width="<c:out value='${catLength}'/>%" align="left" nowrap
								class="boldWhiteText" style="padding-left: 7px;"><fmt:message key="webclient.report.event.table.${item}" /></td>
						</c:forEach>
					</tr>

					<c:forEach var="category" items="${categoryList}"
						varStatus="status">

						<c:choose>

							<c:when test="${status.count%2==1}">
								<tr class="generalEvenRow"
									onmouseover="this.className='generalHover'"
									onmouseout="this.className='generalEvenRow'">

									<td style="padding-left: 7px;" align="left"><a
										onclick='getCategoryReports("<c:out value='${ReportsPeriod}'/>", "<c:out value='${category}'/>","<c:out value='${moType}'/>","<c:out value='${name}'/>","<c:out value='${severityLevel}'/>");'
										href="javascript:void(0)"><img align="absmiddle"
										src="/webclient/common/images/actCfgGraphs.gif"
										title="Click for details" border="0"></a>&nbsp;<a
											onclick='getCategoryReports("<c:out value='${ReportsPeriod}'/>", "<c:out value='${category}'/>","<c:out value='${moType}'/>","<c:out value='${name}'/>","<c:out value='${severityLevel}'/>");'
										href="#"><c:out value="${category}" /></a></td>
							</c:when>

							<c:otherwise>
								<tr class="generalOddRow"
									onmouseover="this.className='generalHover'"
									onmouseout="this.className='generalOddRow'">

									<td style="padding-left: 7px;" align="left"><a
											onclick='getCategoryReports("<c:out value='${ReportsPeriod}'/>", "<c:out value='${category}'/>","<c:out value='${moType}'/>","<c:out value='${name}'/>","<c:out value='${severityLevel}'/>");'
										href="javascript:void(0)"><img align="absmiddle"
										src="/webclient/common/images/actCfgGraphs.gif"
										title="Click for details" border="0"></a>&nbsp;<a
											onclick='getCategoryReports("<c:out value='${ReportsPeriod}'/>", "<c:out value='${category}'/>","<c:out value='${moType}'/>","<c:out value='${name}'/>","<c:out value='${severityLevel}'/>");'
										href="#"><c:out value="${category}" /></a></td>
							</c:otherwise>


						</c:choose>
						<c:set var="sevCount" value="${accCount}" />
						<c:forEach var="sev" items="${sevCount[category]}"
							varStatus="status">

							<td style="padding-left: 7px;" align="left" class="text">
							<div class="reportLegendBox"
								style="background:#<c:out value='${colors[status.count-1]}'/>;"><img
								src="/webclient/common/images/spacer.gif" border="0" width="1"
								height="1" /></div>
							<div style="float: left; margin-left: 5px;"><c:out
								value="${sev}" /></div>
							</td>
						</c:forEach>
						</tr>
					</c:forEach>

					<div id="catReport2"
						style="width: 650px; z-index: 100; position: absolute; display: none; padding: 5px;"
						class="whiteBg popBdr1 popupGBg1">

					<div style="clear: both; border-bottom: 1px solid; height: 22px;">
					<div style="float: left;"><c:out value='${catTitle}' /><span
						id="catText" class="boldTxt">For :</span> <%--<c:out value='${evtCategory}'/>--%></div>
				<div style="float: right;"> <a href="javascript:void(0)" onClick="exportPDF('<c:out value='${ReportsLength}'/>','<c:out value='${ReportsPeriod}'/>','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>')"><fmt:message key='webclient.report.export.pdf'/></a> | <a href="javascript:void(0)" onClick="printView('<c:out value='${ReportsLength}'/>','<c:out value='${ReportsPeriod}'/>','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>')"><fmt:message key='webclient.report.print.view'/></a>&nbsp;&nbsp;<img align="absmiddle"
						onClick="javascript:closeThisDiv('catReport2');" title="Close"
						src="/webclient/common/images/spacer.gif" class="popClose1" /></div>
					</div>

					<div style="padding: 8px; clear: both" align="center" id="graphImg"></div>
					</div>



				</table>
			</c:otherwise>


		</c:choose>



	</c:when>



	<c:otherwise>

		<table width="50%" cellspacing="0" cellpadding="3" border="0"
			align="center" style="margin-top: 20px;">
			<tr>
				<td align="center" class="configParams"><fmt:message key='webclient.performance.reports.datacollection.errordescription'/> <a href="javascript:history.back();"> <fmt:message key='webclient.report.event.nodata.previouspage'/></a>
				</td>
			</tr>
		</table>
	</c:otherwise>
</c:choose>


</body>
</html>
<%--$Id: FaultReportsView.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $ --%>
	

