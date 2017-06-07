<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<link type="text/css" rel="stylesheet" href="/webclient/common/css/SteelBlue/style.css">
<c:choose>
<c:when test = "${moType == 'Events'}"><br>
<%
	String imageName = (String) session.getAttribute("filepath_barchart");
%>
<c:if test="${param.catText != null}">
	<table>
		<tr>
			<td align="left" nowrap class="boldText">
				<c:out value="${param.catText}"/>
			</td>
		</tr>
	</table>
	<table>
		<tr><div style="border-bottom: 1px solid; clear: both; height: 5px; width: 500px;">
		    </div></tr>
	    </table><br>
</c:if>
<img src="<%=imageName%>"/>
</c:when>
<c:otherwise>
<center><table><br>
	<tr>
		<td width="100%" align="center" nowrap class="boldText" style="padding-center:7px;"><fmt:message key='webclient.report.menu.top'/>&nbsp;<c:out value="${param.count}"/>&nbsp;<fmt:message key="${param.pdName}"/>&nbsp;for&nbsp;<c:out value="${param.moType}"/>&nbsp;(<c:out value="${param.period}"/>)</td>
	</tr>
</table></center><br>
<table width="100%" cellspacing="0" cellpadding="0" border="0" style="margin-top:1px;_margin-top:0px;">
<%--	<tr class="dgeneralTBHeader">--%>
	<tr class="generalOddRow">
		<td width="25%"  align="left" nowrap class="boldText" style="padding-left:7px;"><fmt:message key='webclient.report.name'/></td>
		<td width="15%" align="left" nowrap class="boldText" style="padding-left:7px;"><fmt:message key='webclient.report.instance'/></td>
		<td width="15%"  align="left" nowrap class="boldText" style="padding-left:7px;"><fmt:message key='webclient.report.minimum'/></td>
		<td width="15%"  align="left" nowrap class="boldText" style="padding-left:7px;"><fmt:message key='webclient.report.maximum'/></td>
		<c:choose>
		<c:when test="${units=='%' || units=='Percentage'}">
		<td style="padding-left:7px;" align="left" class="boldText"><fmt:message key='webclient.report.average'/>(%)</td>
		</c:when>
		<c:otherwise>
		<td style="padding-left:7px;" align="left" class="boldText"><fmt:message key='webclient.report.average'/>(<c:out value='${units}'/>)</td>
		</c:otherwise>
		</c:choose>
	</tr>

	<c:forEach var="prop" items="${cpuVector}" varStatus="status" >
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
									<tr>	<td style="background: rgb(200,68,63);"><img height="8" width="1" src="/webclient/common/images/spacer.gif" /></td>
									
									</tr>
							</table></div></td>
							</c:when>

							<c:when test="${prop.Value=='0'}">
								<td>
							<div class="graphGreenBg2">
								<table style="line-height:1px;font-size:3px;" width="<c:out value='${prop.Value}'/>" cellspacing="0" cellpadding="0" border="0">
									<tr>	<td style="background:rgb(211,214,215);"><img height="8" width="1" src="/webclient/common/images/spacer.gif" /></td>
									</tr>
						</table></div>	</td>						
							</c:when>
							<c:otherwise>
								<td>

							
							<div class="graphGreenBg2">
								<table style="line-height:1px;font-size:3px;" width="<c:out value='${prop.Value}'/>" cellspacing="0" cellpadding="0" border="0">
									<tr>	<td style="background: rgb(141,199,63);"><img height="8" width="1" src="/webclient/common/images/spacer.gif" /></td>
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


	</c:otherwise>
	</c:choose>

	<%--$Id: ShowPrintView.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $--%>


