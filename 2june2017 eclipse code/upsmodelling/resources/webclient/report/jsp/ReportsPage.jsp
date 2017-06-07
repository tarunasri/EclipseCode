<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<c:choose>
<c:when test="${Data=='Available'}">

<table width="100%" cellspacing="0" cellpadding="0" border="0" style="margin-top:1px;_margin-top:0px;">
	<tr class="dgeneralTBHeader">
		<td width="25%"  align="left" nowrap class="boldWhiteText" style="padding-left:7px;"><fmt:message key='webclient.report.name'/></td>
		<td width="15%" align="left" nowrap class="boldWhiteText" style="padding-left:7px;"><fmt:message key='webclient.report.instance'/></td>
		<td width="15%"  align="left" nowrap class="boldWhiteText" style="padding-left:7px;"><fmt:message key='webclient.report.minimum'/></td>
		<td width="15%"  align="left" nowrap class="boldWhiteText" style="padding-left:7px;"><fmt:message key='webclient.report.maximum'/></td>
		<c:choose>
		<c:when test="${units=='%' || units=='Percentage'}">
		<td style="padding-left:7px;" align="left" class="boldWhiteText"><fmt:message key='webclient.report.average'/>(%)</td>
		</c:when>
		<c:otherwise>
		<td style="padding-left:7px;" align="left" class="boldWhiteText"><fmt:message key='webclient.report.average'/>(<c:out value='${units}'/>)</td>
		</c:otherwise>
		</c:choose>
	</tr>

	<c:forEach var="prop" items="${CPUList}" varStatus="status" >
	<c:choose>
	<c:when test="${status.count%2==1}">
	<tr  class="generalEvenRow" >
		</c:when>
		<c:otherwise>
		<tr class="generalOddRow" >
			</c:otherwise>
			</c:choose>
			<td style="padding-left:7px;" align="left" class="text"><c:out value="${prop.Name}"/></td>
			<td style="padding-left:7px;" align="left" class="text"><c:out value="${prop.Instance}"/></td>
			<td style="padding-left:7px;" align="left" class="text"><c:out value="${prop.MinValue}"/></td>
			<td style="padding-left:7px;" align="left" class="text"><c:out value="${prop.MaxValue}"/></td>
			<td style="padding-left:7px;" align="left" class="text"><table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<c:choose>
						<c:when test="${units=='%' || units=='Percentage'}">					
							<c:choose>
							<c:when test="${prop.Value>80}">
								<td>
							<div class="graphRedBg2">
								<table style="line-height:1px;font-size:3px;" width="<c:out value='${prop.Value}'/>" cellspacing="0" cellpadding="0" border="0">
									<tr>	<td style="background: rgb(200,68,63);"><img height="8" width="1"
											src="/webclient/common/images/spacer.gif" /></td>
									
									</tr>
							</table></div></td>
							</c:when>

							<c:when test="${prop.Value=='0'}">
								<td>
							<div class="graphGreenBg2">
								<table style="line-height:1px;font-size:3px;" width="<c:out value='${prop.Value}'/>" cellspacing="0" cellpadding="0" border="0">
									<tr>	<td style="background:rgb(211,214,215);"><img height="8" width="1"
											src="/webclient/common/images/spacer.gif" /></td>
									</tr>
						</table></div>	</td>						
							</c:when>
							<c:otherwise>
								<td>

							
							<div class="graphGreenBg2">
								<table style="line-height:1px;font-size:3px;" width="<c:out value='${prop.Value}'/>" cellspacing="0" cellpadding="0" border="0">
									<tr>	<td style="background: rgb(141,199,63);"><img height="8" width="1"
											src="/webclient/common/images/spacer.gif" /></td>
									</tr>
						</table></div>	</td>
						</c:otherwise>	
							
						</c:choose>
						<td nowrap="" align="right" style="padding-left: 10px;"><c:out value='${prop.Value}'/></td>		
						</c:when>
						<c:otherwise>

						<td nowrap="" align="left" style="padding-left: 5px;"><c:out value='${prop.Value}'/></td>

						</c:otherwise>
						</c:choose>
					</tr>
			</table></td>
		</tr>
		
		</c:forEach>

	</table>
	</c:when>
	<c:otherwise>
	<table width="50%" cellspacing="0" cellpadding="3" border="0" align="center" style="margin-top: 20px;"><tr><td align="center" class="configParams"><fmt:message key="webclient.performance.reports.datacollection.errordescription"/></td></tr></table>

	</c:otherwise>
	</c:choose>

	
	<%--$Id: ReportsPage.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $--%>


