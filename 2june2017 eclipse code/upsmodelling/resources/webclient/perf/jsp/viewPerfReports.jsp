<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- $Id: viewPerfReports.jsp,v 1.7 2010/10/29 13:47:12 swaminathap Exp $ -->
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<link href="/webclient/common/css/calendar-win2k-1.css" rel="stylesheet" type="text/css" >
<html>
<head>
<title>AdventNet Web NMS </title>

<meta http-equiv="content-type" content="text/xml; charset=utf-8" />
<script type="text/javascript" src="/webclient/common/js/calendar.js"></script>
<script type="text/javascript" src="/webclient/common/js/calendar-en.js"></script>
<script type="text/javascript" src="/webclient/common/js/calendar-setup.js"></script>


<script>
var showVal = false;
function popupWin(field, action)
{
    // set index for custom option
    document.ReportViewForm.period.selectedIndex = 3;
    doCustomPeriodSelectAction(document.ReportViewForm);
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
        document.getElementById('startTrigger').style.visibility='hidden';
        document.getElementById('endTrigger').style.visibility='hidden';
		Calendar.prototype.isShowPopup = false;
	}
	else
	{
		form.startDate.className = "formStyle";
		form.endDate.className = "formStyle";
        document.getElementById('startTrigger').style.visibility='visible';
        document.getElementById('endTrigger').style.visibility='visible';
		Calendar.prototype.isShowPopup = true;

	}
}

function init()
{
<c:if test='${empty param.period || param.period != "custom"}'>
   document.ReportViewForm.startDate.className = "formStyleDisabled";
   document.ReportViewForm.endDate.className = "formStyleDisabled";
   document.getElementById('startTrigger').style.visibility='hidden';
   document.getElementById('endTrigger').style.visibility='hidden';
   document.getElementById('endTrigger').style.cursor="help";
   document.ReportViewForm.elements[0].focus();
</c:if>
	if (document.ReportViewForm.period.selectedIndex == 3)
		Calendar.prototype.isShowPopup = true;
 
}
</script>
</head>
<html:javascript formName="ReportViewForm"/>

<body onload="init()">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<c:choose>
		<c:when test="${empty param.name}">
			<c:out value="${param.displayName}"/>
		</c:when>
		<c:otherwise>
		<fmt:message key="webclient.performance.reports.header">
		<fmt:param><c:out value="${requestScope.reportHeader}"/></fmt:param>
		<fmt:param><c:out value="${param.name}"/></fmt:param>
		</fmt:message>
		</c:otherwise>
		</c:choose>
</h1></td>
		<td align="right"><span class="mandatory">*</span> <span  class="textSmall"> <fmt:message key='webclient.perf.mandatory.message'/></span> &nbsp;</td>
        </tr>
</table>

<html:form action="/ReportViewAction.do" method="post" onsubmit="return validateReportViewForm(this)">
  
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
      <td>&nbsp;</td>
      <td valign="top">
      	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr> 
	<td align="left" valign="top">
	<span class="errorText"><html:errors/></span>
	<c:if test="${!empty param.name}">
	<c:if test="${!empty requestScope.reportPath}">
	<span class="header2"><c:out value="${requestScope.periodRange}" escapeXml="false"/></span><p>&nbsp;</p>
	<c:import url="${reportPath}" charEncoding="UTF-8"/>
	</c:if>

	<c:if test="${!empty requestScope.graphPath}">
        <c:forEach  var="GraphPath" items="${graphPath}" varStatus="status">
 <table style="margin-bottom:10px;" width="75%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
        <table cellspacing =0 cellpadding=1 border=0 width="100%" class="homeTableDarkBorder">
        <tr class="homeHeader" align="center" nowrap><tr class="boldWhiteText" height="24">
<c:choose>
        <c:when test="${empty GraphPath.value}">
        <c:out value="${param.reportType}"/>
        </c:when>
        <c:otherwise>
        <c:out value="Interface - ${GraphPath.value} ${param.reportType}"/>
        </c:otherwise>
</c:choose>

</tr></tr>

<tr><td width="100%" align="center">
		<img src='<c:out value="${GraphPath.key}"/>' border="0">
        </td></tr>

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



        <br>
        </c:forEach></td>
        <td align="left" valign="top" width="30%">
		<%@ include file="../jspf/reportOptions.jspf"%>
	</td>
	        </c:if>
		</c:if>

	<c:if test="${empty requestScope.graphPath}">
        <table cellspacing =0 cellpadding=10 border=0 width=100% align=left>
        <tr>
        <td height=70 class=text> 
       	<ol><li><fmt:message key='webclient.perf.reports.nodata.text1'/></li>
       	<li><fmt:message key='webclient.perf.reports.nodata.text2'/></li>
       	<li><fmt:message key='webclient.perf.reports.nodata.text3'/></li>
       	</ol>
		<%@ include file="../jspf/reportOptions.jspf"%>
        </td>
        </tr>
        </table>
        </c:if>
		</td>
		</tr>
  	</table> 

  	</td>
	<c:if test="${!empty tableCol}">
	<tr><td> &nbsp; </td></tr>
  	<tr  valign=top>
		<%
			int count = 0;
			java.util.Vector value = (java.util.Vector)request.getAttribute("tableCol");
			if( value != null )
				count = value.size();
		%>
		<table width="350" border=0 cols=<%=count%> valign="top">
      	<tr>
		<% int i = 0; 
		   int rowCount = 0;
		   int height = 0;
		%>
     	    <c:forEach var="prop1" items="${tableCol}">
	    	
	    	<tr valign="top" align="center">
		<%
			value = (java.util.Vector)request.getAttribute("tableCol");
			String heading = null;
			 String head=null;
 	                 int loc=0;
			if( value != null && value instanceof java.util.Vector)
			{
				java.util.Vector val = (java.util.Vector)value.get(i);
				head=(String)val.get(0);

                                if(count>1)
                                {
                                head="Interface - "+head.substring(head.length()-1,head.length());
                                }
                                else
                                {
                                head="Value Collected";
                                }
                                request.setAttribute("colhead",head);
				heading = (String)val.remove(0);
				i++;
				if( val != null )
					rowCount = val.size();
				if(rowCount <7)		
				{
				      height = rowCount*20;			
			        }
				else
				{
					height = 140;
				}
				request.setAttribute("tableHeight",height);
			}	
			
			%>
	
			<table style="margin-bottom:10px;" width="60%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
 	   	<table border=0 width="100%" class="htableborder">
      	<tr>
      		<tr class="header2Bg">
      		    <td width="33%" height="22" align="center" nowrap><span class="header2"><fmt:message key='webclient.performance.reports.header.date'/></span></td>
      		    <td width="33%" height="22" align="center" nowrap><span class="header2"><fmt:message key='webclient.performance.reports.header.time'/></span></td>
			 <td width="34%" height="22" align="center" nowrap><span class="header2"><c:out value="${colhead}"/></span></td>
                </tr>
		</table>
		
			<c:if test="${tableHeight > 100}">
				<div style="height:100px;overflow:auto">
			</c:if>			
			<table border=0 height=tableHeight+"%" width="100%" class="htableborder">	
		<tr>
      		    <c:forEach var="prop2" items="${prop1}" varStatus="status">
		    <c:choose>		
		    
		    <c:when test="${status.count%2 == 0}" > 		
		    <TR class="reportsOddRow" >
      		    </c:when>
      		    <c:otherwise>
      		    </c:otherwise>
      		    </c:choose> 
                
                        <c:forEach var="prop3" items="${prop2}" >
             		    <td width="33%" class="text" align="center"><c:out value='${prop3}'/></td>
                        </c:forEach> 
                    </tr>
      	    	    </tr>
      		    </c:forEach>
      	   	</table>
		<c:if test="${tableHeight > 100}">
			</div>
		</c:if>	
	</td>
    <td class="generalCurveRight"></td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
		</tr>
      		</c:forEach>

</table>
	</tr> 
     	</table>
      </tr>
      </tr>
      <tr>
	</c:if>
</tr>
 
</table>
</html:form>
</body>
</html>
