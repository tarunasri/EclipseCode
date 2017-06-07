<%-- $Id: TrafficReportWidget.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>
<html>




<table width="100%" cellspacing="0" cellpadding="0" border="0" style="margin-top:1px;_margin-top:0px;">
    <tr class="dgeneralTBHeader" style="font-weight:bold;">
                <td style="padding-left:7px;"><fmt:message key = 'webclient.home.report.table.name'><fmt:param><c:out value="${units}"/></fmt:param></fmt:message></td>
                <td style="padding-left:7px;align:left;" ><fmt:message key = 'webclient.home.report.table.min'/></td>
                <td style="padding-left:7px;align:left;" ><fmt:message key = 'webclient.home.report.table.max'/></td>
                <td style="padding-left:7px;align:left;" ><fmt:message key = 'webclient.home.report.table.avg'/></td>
                </tr>


<c:choose>
<c:when test="${!empty reportData}">
	<c:forEach var="prop" items="${reportData}" varStatus="status" >
	<c:choose>
	<c:when test="${status.count%2==1}">
	<tr  class="generalEvenRow" >
		</c:when>
		<c:otherwise>
		<tr class="generalOddRow" >
			</c:otherwise>
			</c:choose>
			<td style="padding-left:7px;" align="left" class="text">
<a class="linkNoUnderline" href="/topo/objectdetails.do?requestid=SNAPSHOT&name=<c:out value='${prop.Name}'/>&selectedTab=Network Database" title="<c:out value='${prop.Name}' />" >  <c:out value="${prop.Name}"/></a></td>
			<td style="padding-left:7px;" align="left" class="text"><c:out value="${prop.MinValue}"/></td>
			<td style="padding-left:7px;" align="left" class="text"><c:out value="${prop.MaxValue}"/></td>
			<td style="padding-left:7px;" align="left" class="text"><table cellspacing="0" cellpadding="0" border="0">
					<tr>
						<c:choose>
						<c:when test="${units=='%' || units=='Percentage'}">
						<td><div class="graphGreyBg2">

								<table style="line-height:1px;font-size:3px;" width="<c:out value='${prop.Value}'/>" cellspacing="0" cellpadding="0" border="0">
									<tr>
										<c:choose>
										<c:when test="${prop.Value=='0'}">
										<td  style="background:rgb(211,214,215);"><img height="8" width="1" src="../images/spacer.gif"/> </td>

										</c:when>
										<c:otherwise>
										<c:choose>
										<c:when test="${prop.Value > 80}">
										<td style="background: rgb(200,68,63);"><img height="8" width="1" src="../images/spacer.gif"/> </td>
										</c:when>
										<c:otherwise>

										<td style="background: rgb(141,199,63);"><img height="8" width="1" src="../images/spacer.gif"/> </td>
										</c:otherwise>
										</c:choose>
										</c:otherwise>
										</c:choose>
									</tr>
								</table>
						</div></td>
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



<table width="97%" cellspacing="0" cellpadding="3" border="0" align="center" style="margin-top: 7px; margin-bottom: 7px;">
<tr>    
 <td nowrap="" valign="middle" align="center" class="configParams" style="padding-left: 10px;">
<div style="padding: 3px; text-align: center;">
<a href=#" class="bluelink boldTxt"></a><fmt:message key ='webclient.dashboard.widget.nodata'/>
</div>
</td>
</tr>
</table>
</c:otherwise>
</c:choose>

</html>
