<%-- $Id: TopReports.jsp,v 1.6 2007/10/30 12:59:35 sumitha Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script language="javascript" SRC="/webclient/report/js/reports.js" type="text/javascript"></script>

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

<tr>
                    <td nowrap>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.report.top'>
                    <fmt:param value="${ReportsLength}"/></fmt:message>
                    <fmt:message key='${moType}'/>
                    <fmt:message key='webclient.report.by'/>
                    <fmt:message key='${name}'/>-
                    <fmt:message key='${ReportsPeriod}'/>
                    </h1></td>
		<td align="right">

<%-- *************************** Start of PDF Format related code snippet **************************** --%>

<c:choose>
<c:when test="${flag != 'true'}">
<a class="linkNoUnderline" href="javascript:exportReports('<c:out value='${ReportsLength}'/>','<c:out value='${ReportsPeriod}'/>','indReports','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>','PDF')"><img align="center" src="/webclient/common/images/pdf_icon1.gif" hspace="3" border="0"><fmt:message key='webclient.report.pdfview'/></a> |
</c:when>
<c:otherwise>
<img align="center" src="/webclient/common/images/pdf_icon1.gif" hspace="3" border="0"><span
style="color: rgb(153, 153, 153);"><fmt:message key='webclient.report.pdfview'/></span> |
</c:otherwise>
</c:choose>

<%-- *************************** End of PDF Format related Code snippet ******************************* --%>


<%-- ************************** Start of Printable View related code snippet ************************** --%>
<c:choose>
<c:when test="${flag != 'true'}">
<a class="linkNoUnderline" href="javascript:exportReports('<c:out value='${ReportsLength}'/>','<c:out value='${ReportsPeriod}'/>','indReports','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>','HTML')" ><img align="center" src="/webclient/common/images/icon_print.gif" hspace="1" border="0"><fmt:message key='webclient.report.printableview'/></a>
</c:when>

<c:otherwise>
<img align="center" src="/webclient/common/images/icon_print.gif" hspace="1" border="0"><span
style="color: rgb(153, 153, 153);"><fmt:message key='webclient.report.printableview'/></span>
</c:otherwise>
</c:choose>

<%-- ************************ End of Printable view related code snippet ***************************** --%>

</td>
        </tr>
        </table>	
	</td>


            <tr>
              <td colspan="2">
            <table width="99%" border="0" align="left" cellpadding="3" cellspacing="0">
</tr>

<%--
<tr>
<td colspan="2" width="100%" height="22" class="text menuHeader" align="left">
<a class="linkNoUnderline" href="javascript:AddPO()"><fmt:message key="webclient.perf.addpo.header"/></a> |

<a class="linkNoUnderline" href="javascript:ModifyPO()"><fmt:message key="webclient.perf.modifypo.modifypollingobjects"/></a> |
<a class="linkNoUnderline" href="javascript:DeletePO()"><fmt:message key="webclient.pref.deletepo.header"/></a>
</td>
</tr>
--%>

<!-- Here is the default period for report gen -->

<tr><tbody> 
             

<td align =right>
<c:set var="selectedVal" value="${ReportsPeriod}"/>
            <select name="Period" class="comboStyle" onchange="javascript:Preferences('<c:out value='${ReportsLength}'/>',this.options[this.options.selectedIndex].value,'indReports','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>','<c:out value='${Navigator}'/>')">
             <option value="Today" 

             <c:if test="${ReportsPeriod == 'Today'}">
                 selected="true"
             </c:if>
             ><fmt:message key='webclient.report.today'></fmt:message>   </option>

             <option value="Yesterday" 
             <c:if test="${ReportsPeriod == 'Yesterday'}">
                 selected="true"
             </c:if>
             ><fmt:message key='webclient.report.yesterday'></fmt:message>   </option>

             <option value="Last 7 days" 
             <c:if test="${ReportsPeriod == 'Last 7 days'}">
                 selected="true"
             </c:if>
             ><fmt:message key='webclient.report.last7days'></fmt:message>   </option>

             <option value="Last 30 days"
             <c:if test="${ReportsPeriod == 'Last 30 days'}">
                 selected="true"
             </c:if>
             ><fmt:message key='webclient.report.last30days'></fmt:message>  </option>

             </select>

                    
                  
<!-- Title and the Top N List goes here --> 
       <span class="Text"><fmt:message key='webclient.report.topNreports'/></span> <span class="text">

<c:set var="selectedVal" value="${ReportsLength}"/><select class="comboStyle" name="Length" onchange="javascript:Preferences(this.options[this.options.selectedIndex].value,'<c:out value='${ReportsPeriod}'/>','indReports','<c:out value='${moType}'/>','<c:out value='${name}'/>','<c:out value='${type}'/>','<c:out value='${units}'/>','<c:out value='${Navigator}'/>')">

<c:out value="${ReportsPeriod}"/>
        <option value="10" 
        <c:if test="${ReportsLength == '10'}">
            selected="true"
        </c:if>
        >10
        </option>

        <option value="25"
        <c:if test="${ReportsLength == '25'}">
            selected="true"
        </c:if>
        >25   
        </option>

        <option value="50"
        <c:if test="${ReportsLength == '50'}">
            selected="true"
        </c:if>
        >50   </option>

        <option value="100"
        <c:if test="${ReportsLength == '100'}">
            selected="true"
        </c:if>
        >100   
        </option>

       </select><fmt:message key='webclient.report'/></span> </td>
                  </tr>
                </tbody>
              </table>
              </td>
            </tr>



<%-- ***************************** End Preferences related code ************************************** --%>



<%-- ***************************** Code for showing Reports not available message ******************** --%>


<c:choose>
<c:when test="${empty CPUList}">
<%--<td width="100%" valign="top">--%>

 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

<table border=0 cellspacing="0" cellpadding="0" class="homeTableDarkBorder" width="100%">
 <c:set var="count" value="6"/>
<tr class="homeHeader" height=22>
        <td align="center" width=30% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.name'/></td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.instance'></fmt:message>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
        <td align="center" width=15% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.min'/><c:out value="(${reportUnits})"/></td>
        <td align="center" width=25% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.max'/><c:out value="(${reportUnits})"/></td>
        <td align="center" width = 40% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.avg'/><c:out value="(${reportUnits})"/></td>
        </tr>
   <c:forEach begin="0" end="7" varStatus="status">
	<c:choose>
           <c:when test="${status.count%2==1}">
              <TR class="generalEvenRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="generalOddRow" height=22>
           </c:otherwise>
        </c:choose>
	<c:choose>
	<c:when test="${status.count==4}">
        <td colspan =5 align="center">
            <font class="Boldtext"><fmt:message key ='${name}'/> <fmt:message key='webclient.report.notavailable'>
            </fmt:message>
            </font></td>
        </c:when>
        <c:when test="${status.count==5}">
         <td colspan =5 align="center">        
            <font class="Boldtext"><fmt:message key='webclient.report.trylater'></fmt:message></font>
       </td>
	</c:when>
	<c:otherwise>
	<td colspan =5 align="center"></td>
	</c:otherwise>
	</c:choose>
	
       </TR>
   </c:forEach>
</table>

       </td>
<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</c:when>


<%-- ********************************* End of Reports not available message ************************** --%>






<c:otherwise>

        <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody>
            <!-- Report with actual data Starts here  --> <tr>
              <td colspan="2" valign="top">

     <c:set var="var1" value="indReports"/>
     <c:choose>
     <c:when test="${moType=='Devices'}">

         <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

        <table width="100%" border="0" cellspacing="0" cellpadding="0" class=homeTableDarkBorder >

        <tr class="homeHeader" height=22>
        <td align="left" width=30% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.name'/></td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.instance'></fmt:message>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
        <td align="center" width=15% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.min'/><c:out value="(${reportUnits})"/></td>
        <td align="center" width=25% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.max'/><c:out value="(${reportUnits})"/></td>
        <td align="center" width = 40% valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.avg'/><c:out value="(${reportUnits})"/></td>
        </tr>
        <c:forEach var="prop" items="${CPUList}" varStatus="status" >

        <c:choose>
           <c:when test="${status.count%2==1}">
              <TR class="reportsEvenRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsOddRow" height=22>
           </c:otherwise>
        </c:choose>
        <td class="text" nowrap align="left"><c:out value="${prop.Name}"/></td>
        <td class="text" nowrap align="center"><c:out value="${prop.Instance}"/></td>
        <td class="text" nowrap align="center"><c:out value="${prop.MinValue}"/></td>
        <td class="text" nowrap align="center"><c:out value="${prop.MaxValue}"/></td>    
        <td class="text" nowrap align="center">
        <c:choose>    
        <c:when test="${reportUnits == '%'}">
                <table align=left height="8" border="0" cellpadding="0" cellspacing="0" class="progressTable">

                  <tr class="text">
                     <td nowrap >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/webclient/common/images/green.gif" width="<c:out value='${prop.Value}'/>" height="7" hspace="1"> <c:out value="${prop.Value}"/></td>

                  </table>
        </c:when>  
        <c:otherwise>
        <c:out value="${prop.Value}"/>
        </c:otherwise>
        </c:choose>
        </td>
    </tr>
    </c:forEach>

</table>
</td>
<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
    </c:when>



    <c:when test="${moType=='Routers'}">
        <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="homeTableDarkBorder">

        <tr class="homeHeader" height=22>
        <td align="left" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.name'>
</fmt:message>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.instance'></fmt:message>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.min'></fmt:message><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.max'></fmt:message><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.avg'></fmt:message><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>

        <c:forEach var="prop" items="${CPUList}" varStatus="status" >

        <c:choose>
           <c:when test="${status.count%2==1}">
              <TR class="reportsEvenRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsOddRow" height=22>
           </c:otherwise>
        </c:choose>
        <td class="txtGlobal" nowrap align="left"><c:out value="${prop.Name}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.Instance}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.MinValue}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.MaxValue}"/></td>    
        <td class="txtGlobal" nowrap align="center">
        <c:choose>    
        <c:when test="${reportUnits == '%'}">
            <table align=left height="8" border="0" cellpadding="0" cellspacing="0" class="progressTable">

               <tr class="text">
                 <td nowrap >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/webclient/common/images/green.gif" width="<c:out value='${prop.Value}'/>" height="7" hspace="1"> <c:out value="${prop.Value}"/></td>

                  </table>
        </c:when>  
        <c:otherwise>
        <c:out value="${prop.Value}"/>
        </c:otherwise>
        </c:choose>

        </td>
    </tr>

    </c:forEach>
</table>
</td>
<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
    </c:when>

            <c:when test="${moType=='Switches'}">
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="homeTableDarkBorder">
        
        <tr class="homeHeader" height=22>
        <td align="left" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.name'></fmt:message>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.portinstance'></fmt:message>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.min'></fmt:message><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.max'></fmt:message><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.avg'></fmt:message><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>

        <c:forEach var="prop" items="${CPUList}" varStatus="status" >

        <c:choose>
           <c:when test="${status.count%2==1}">
              <TR class="reportsEvenRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsOddRow" height=22>
           </c:otherwise>
        </c:choose>
        <td class="txtGlobal" nowrap align="left"><c:out value="${prop.Name}"/></td>
        <td class="txtGlobal" nowrap align="center"><fmt:message key='webclient.report.port'></fmt:message> - <c:out value="${prop.Instance}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.MinValue}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.MaxValue}"/></td>    
        <td class="txtGlobal" nowrap align="center">
        <c:choose>    
        <c:when test="${reportUnits == '%'}">
                <table align=left height="8" border="0" cellpadding="0" cellspacing="0" class="progressTable">

                  <tr class="text">
                     <td nowrap >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/webclient/common/images/green.gif" width="<c:out value='${prop.Value}'/>" height="7" hspace="1"> <c:out value="${prop.Value}"/></td>

                  </table>
        </c:when>  
        <c:otherwise>
        <c:out value="${prop.Value}"/>
        </c:otherwise>
        </c:choose>
	</td>
    </tr>
    </c:forEach>
</table>
</td>
<td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
    </c:when>


    <c:otherwise>
      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="homeTableDarkBorder" >
        
        <tr class="homeHeader" height=22>
        <td align="left" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.name'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.instance'></fmt:message>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>     
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.min'/><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.max'/><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td align="right" valign="middle" class="boldWhiteText" nowrap><fmt:message key='webclient.report.avg'/><c:out value="(${reportUnits})"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>

        <c:forEach var="prop" items="${CPUList}" varStatus="status" >

        <c:choose>
           <c:when test="${status.count%2==1}">
              <TR class="reportsEvenRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsOddRow" height=22>
           </c:otherwise>
        </c:choose>
        <td class="txtGlobal" nowrap align="left"><c:out value="${prop.Name}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.Instance}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.MinValue}"/></td>
        <td class="txtGlobal" nowrap align="center"><c:out value="${prop.MaxValue}"/></td>    
        <td class="txtGlobal" nowrap align="center">
        <c:choose>    
        <c:when test="${reportUnits == '%'}">
                <table align=left height="8" border="0" cellpadding="0" cellspacing="0" class="progressTable">

                  <tr class="text">
                     <td nowrap >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="/webclient/common/images/green.gif" width="<c:out value='${prop.Value}'/>" height="7" hspace="1"> <c:out value="${prop.Value}"/></td>

                  </table>
        </c:when>  
        <c:otherwise>
        <c:out value="${prop.Value}"/>
        </c:otherwise>
        </c:choose>
	</td>
    </tr>
    </c:forEach>

    </c:otherwise>


    </c:choose>
</c:otherwise>
</c:choose>
</td>


</tr>

</table>

 
