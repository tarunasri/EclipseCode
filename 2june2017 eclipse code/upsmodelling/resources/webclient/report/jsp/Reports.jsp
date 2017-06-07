<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
</head>
<body>
	

<script language="javascript" SRC="/webclient/report/js/reports.js" type="text/javascript"></script>
<script type="text/javascript" src="/webclient/common/js/importxml.js"></script>


<input type="hidden" name="moType1" value="<c:out value='${moType}'/>">
<input type="hidden" name="type1" value="<c:out value='${type}'/>">
<input type="hidden" name="name1" value="<c:out value='${name}'/>">
<input type="hidden" name="units1" value="<c:out value='${units}'/>">
<input type="hidden" name="pdName1" value="<c:out value='${type}'/>">


<c:choose>
<c:when test="${empty ReportsPeriod}">
<c:set var="ReportsPeriod" value="Today"/>
</c:when>
</c:choose>

<c:choose>
<c:when test="${empty CPUList}">
<c:set var="flag" value="true"/>
</c:when>
</c:choose>

<c:choose>
<c:when test="${empty ReportsLength}">
<c:set var="ReportsLength" value="10"/>
</c:when>
</c:choose>

<c:choose>
<c:when test="${empty Navigator}">
<c:set var="Navigator" value="Tree"/>
</c:when>
</c:choose>

<c:choose>
<c:when test="${units=='Percentage'}">
<c:set var="reportUnits" value="%"/>
</c:when>
<c:otherwise>
<c:set var="reportUnits" value="${units}"/>
</c:otherwise>
</c:choose>

<%-- ********************************** Preferences related code ******************************* --%>
<table width="100%" cellspacing="0" cellpadding="0" border="0" class="pageHeaderStr">
	<tr>
		<td nowrap="nowrap"><h1><fmt:message key='webclient.report'/></h1></td>
	</tr>
</table>

<table class="tabHRule1" width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td><div id="innerTab1">
				<ul>
				<%-- Forming the Report Specific Tab  --%>
				<c:forEach var="tabs" items="${modules}">
				     <c:choose>
				     <c:when test="${moType==tabs}"><li id="current">
				     <c:choose>
				     <c:when test="${tabs=='Events'}">
				     <a href="javascript:void(0);" onclick="javascript:invokeFaultReport('<c:out value="${tabs}"/>')";><span><fmt:message key='webclient.report.event.tab.${tabs}'/></span>	</a></li>
				     </c:when>
				     <c:otherwise>
				     <a href="javascript:void(0);" onclick="javascript:invokePerfReport('<c:out value="${tabs}"/>')";><span><fmt:message key='webclient.report.perf.tab.${tabs}'/></span>	</a></li>
				     </c:otherwise>
				     </c:choose>				     
				     </c:when>
				     <c:otherwise>
				     <li>
				     <c:choose>
				     <c:when test="${tabs=='Events'}">
				     <a href="javascript:void(0);" onclick="javascript:invokeFaultReport('<c:out value="${tabs}"/>')";><span><fmt:message key='webclient.report.event.tab.${tabs}'/></span>	</a></li>
				     </c:when>
				     <c:otherwise>
				     <a href="javascript:void(0);" onclick="javascript:invokePerfReport('<c:out value="${tabs}"/>')";><span><fmt:message key='webclient.report.perf.tab.${tabs}'/></span>	</a></li>
				     </c:otherwise>
				     </c:choose>		
				     </c:otherwise>
				     </c:choose>     			     
				     
				     </c:forEach>
					
					
				</ul>
		</div></td>

		<c:if test="${flag != 'true' || ( moType == 'Events' && filepath_barchart!='No Data Available' && name != 'webclient.report.event.categoryvsseverity'  )}">
		<td align="right" nowrap="nowrap"><a href="javascript:void(0)" onClick="exportPDF('<c:out value='${ReportsLength}'/>','<c:out value='${ReportsPeriod}'/>','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>')"><fmt:message key='webclient.report.export.pdf'/></a> | <a href="javascript:void(0)" onClick="printView('<c:out value='${ReportsLength}'/>','<c:out value='${ReportsPeriod}'/>','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>')"><fmt:message key='webclient.report.print.view'/></a></td>
		</c:if>
		<%--
		<td align="right" nowrap="nowrap"><a href="#"><fmt:message key='webclient.report.export.pdf'/></a> | <a href="#"><fmt:message key='webclient.report.print.view'/></a></td>
		--%>
	</tr>
</table>


<table width="100%" cellspacing="0" cellpadding="0" border="0" style="margin-bottom: 10px;">
	<tr>
		<td class="generalCurveLeftTop"><img height="1" width="1" src="images/spacer.gif"/></td>
		<td nowrap="" valign="top" align="left" style="padding-right: 10px;" class="generalCurveTop"/>
			<td class="generalCurveRightTop"><img height="1" width="1" src="images/spacer.gif"/></td>
		</tr>
		<tr>
			<td class="generalCurveLeft"><img height="1" width="1" src="images/spacer.gif"/></td>
			<td valign="top" class="generalTBPadding"><table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td valign="top" style="width:200px;height:300px;">
						<ul id="verticalTab">	
						<c:forEach var="props" items="${treeDetails}">
						<c:forEach var="hashvalue" items="${props}">
						
						<c:choose>
						<c:when test="${moType!='Events'}">
						<li <c:if test="${hashvalue.Name==name}"> id="current"</c:if>>
						
						<a href="javascript:void(0);" onClick="javascript:invokePROnClick('<c:out value="${moType}"/>','<c:out value="${hashvalue.Name}"/>','<c:out value="${hashvalue.PolledData}"/>','<c:out value="${hashvalue.Units}"/>','Period','Length');"><span> <fmt:message key='${hashvalue.Name}'/></span></a>
						</li>						
						</c:when>
						<c:otherwise>
						<li <c:if test="${hashvalue.Name==name}"> id="current"</c:if>>
						<a href="javascript:void(0);" onClick="javascript:invokeFROnClick('<c:out value="${hashvalue.Name}"/>','<c:out value="${moType}"/>','<c:out value="${hashvalue.type}"/>','<c:out value="${hashvalue.category}"/>','Period','Length','<c:out value="${source}"/>','<c:out value="${hashvalue.severityLevel}"/>');"> <span><fmt:message key='${hashvalue.Name}'/></span></a>
						</li>	
						</c:otherwise>
						</c:choose>
							</c:forEach>						
						</c:forEach>
								

							</ul>
						</td>

						<td class="tableBdr2" style="padding:5px;" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">

								<tr class="tableHeaders">

									<td style="padding:3px 3px 3px 10px;"><fmt:message key='webclient.report.menu.duration'/> :
										<c:choose>	
										<c:when test="${moType!='Events'}">
										<select onchange="javascript:invokePROnClick('<c:out value="${moType}"/>','<c:out value="${name}"/>','<c:out value="${type}"/>','<c:out value="${units}"/>','Period','Length');" class="comboStyle" name="Period" id='Period'>
											</c:when>
											<c:otherwise>
											<select onchange="javascript:invokeFROnClick('<c:out value="${name}"/>','<c:out value="${moType}"/>','<c:out value="${type}"/>','<c:out value="${category}"/>','Period','Length','<c:out value="${source}"/>','<c:out value="${severityLevel}"/>');" class="comboStyle" name="Period" id='Period'>

											</c:otherwise>
											</c:choose>
											<option value="Today" 

											<c:if test="${ReportsPeriod == 'Today' ||ReportsPeriod=='Hour' }">
											selected="true"
											</c:if>
											><fmt:message key='webclient.report.today'></fmt:message>   </option> 
											<c:if test="${moType!='Events' }">
											<option value="Yesterday" 
											<c:if test="${ReportsPeriod == 'Yesterday'}">
											selected="true"
											</c:if>
											><fmt:message key='webclient.report.yesterday'></fmt:message>   </option></c:if>

											<option value="Last 7 days" 
											<c:if test="${ReportsPeriod == 'Last 7 days'|| ReportsPeriod=='Week'}">
											selected="true"
											</c:if>
											><fmt:message key='webclient.report.last7days'></fmt:message>   </option>

											<option value="Last 30 days"
											<c:if test="${ReportsPeriod == 'Last 30 days' ||ReportsPeriod=='Month'}">
											selected="true"
											</c:if>
											><fmt:message key='webclient.report.last30days'></fmt:message>  </option>
											<!-- Title and the Top N List goes here -->
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<span id="lengthspan"<c:if test="${moType=='Events'&& type!='n-report'}"> style="display:none"</c:if>>	<fmt:message key='webclient.report.menu.top'/> :
										<c:choose>
										<c:when test="${moType!='Events'}">
										<select onchange="javascript:invokePROnClick('<c:out value="${moType}"/>','<c:out value="${name}"/>','<c:out value="${type}"/>','<c:out value="${units}"/>','Period','Length');" name="Length" id='Length' class="comboStyle">
											</c:when>
											<c:otherwise>
											<select onchange="javascript:invokeFROnClick('<c:out value="${name}"/>','<c:out value="${moType}"/>','<c:out value="${type}"/>','<c:out value="${category}"/>','Period','Length','<c:out value="${source}"/>');" name="Length" id='Length' class="comboStyle">

											</c:otherwise>
											</c:choose>

											<option value="5" 
											<c:if test="${ReportsLength == '5'}">
											selected="true"
											</c:if>
											>5
											</option>

											<option value="10"
											<c:if test="${ReportsLength == '10'}">
											selected="true"
											</c:if>
											>10   
											</option>

											<option value="20"
											<c:if test="${ReportsLength == '20'}">
											selected="true"
											</c:if>
											>20  </option>

											<option value="25"
											<c:if test="${ReportsLength == '25'}">
											selected="true"
											</c:if>
											>25 
											</option>
										</select>
									</span>
									</td>
									
								</tr>
							</table>
							<c:choose>
							<c:when test="${moType=='Events'}">
						
							<%--<iframe id="reportFrame" height='400px' width="100%" src="/report/FaultReport.do?requestType=AJAX&moType=Event Reports&selectparent=alert&type=allSeverity&category=AllEvents"  frameborder="0" scrolling="auto" marginwidth="0" marginheight="0"></iframe></td>--%>
						<c:choose> 
						<c:when test="${type=='completecategory'}">
						<iframe id="reportFrame" height='480px' width="100%" src="/webclient/report/jsp/FaultReportsView.jsp"  frameborder="0" scrolling="auto" marginwidth="0" marginheight="0"></iframe></td>
					</c:when>
					<c:otherwise>
						<div id="reportcontents">
								<jsp:include page="/webclient/report/jsp/FaultReportsView.jsp"/>   

						</div></td>

					 </c:otherwise>			 
					</c:choose>
						
						

							
</c:when>
<c:otherwise>
							<div id="reportcontents">
								<jsp:include page="/webclient/report/jsp/ReportsPage.jsp"/>   

						</div></td>
						</c:otherwise>
						</c:choose>
					</tr>

			</table></td>

			<td class="generalCurveRight"><img height="1" width="1" src="images/spacer.gif"/></td>
		</tr>
		<tr>
			<td class="generalCurveLeftBot"><img height="1" width="1" src="images/spacer.gif"/></td>
			<td class="generalCurveBottom"><img height="1" width="1" src="images/spacer.gif"/></td>
			<td class="generalCurveRightBot"><img height="1" width="1" src="images/spacer.gif"/></td>
		</tr>
	</table>
	<div id='typeid' style="display:none"></div>
	<div id='srcid' style="display:none"></div>
</body>
</html>
	<%--$Id: Reports.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $ --%>
