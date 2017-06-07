<%-- $Id: AddReports.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<link href="/webclient/common/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript" SRC="/webclient/report/js/reports.js" type="text/javascript"></script>

<body>

<html:form action="/AddReportDetails.do?reqType=set">

    <table bgcolor="" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
         <!--<td height="30" align="center" colspan="2" valign="middle" class="txtGlobalBold" style="COLOR: #00009e;" nowrap><fmt:message key='webclient.report.customizereports'/></td>-->
        </tr>
        
        <tr> 
        <td height="10" colspan="2"></td>
        </tr>
        <tr> 
        <td colspan="2">
    <table border="0" id="secdetails" cellspacing="0" cellpadding="0" width="100%">
        <tr>
        <th colspan="2" class="Boldtext"><fmt:message key='webclient.report.addreports'></fmt:message></th>
        </tr>
    
    <tr> 
    <td height="10" colspan="2"></td>
    </tr>
    <tr> 
    <td height="10" colspan="2"></td>
    </tr>
    <tr> 
    <td width="34%" class="txtGlobal" align="left"><fmt:message key='webclient.report.snmpoid'></fmt:message></td>
    <td width="66%" align="left"><html:text property="OID" name="AddReports"/> <input type="button" value="Select" onClick="javascript:window.open('/report/SelectOID.do', 'OID', 'scrollbars=yes,width=550,height=320,screenX=650,screenY=150,location=no,directories=no,status=no,menubar=no,toolbar=no,resizable=no')"></td>
    </tr>
    <tr> 
    <td width="34%" class="txtGlobal" align="left"><fmt:message key='webclient.report.motype'></fmt:message></td>
    <td width="66%" align="left"><html:text property="Type" name="AddReports"/> </td>
    </tr>
    <tr> 
    <td height="10" colspan="2"></td>
    </tr>
    <tr> 
    <td width="34%" class="txtGlobal" align="left"><span class="securityLabel"><fmt:message key='webclient.report.reportname'/></span></td>
    <td width="66%"  align="left"><html:text property="ReportName" name="AddReports"/></td>
    </tr>
    <tr> 
    <td height="10" colspan="2"></td>
    </tr>
    <tr> 
    <td width="34%" class="txtGlobal" align="left"><fmt:message key='webclient.report.pollingobject'/></td>
    <td width="66%" align="left"><html:select property="PollingObject" name="AddReports">
    <c:forEach var="poNames" items="${PollingObjects}" varStatus="status">
    <option value="<c:out value='${poNames}'/>"><c:out value="${poNames}"/></option>
    </c:forEach>
    </html:select></td>
    </tr>
    <tr> 
    <td height="10" colspan="2"></td>
    </tr>
    <tr> 
    <td width="34%" class="txtGlobal" align="left"><fmt:message key='webclient.report.units'/></td>
    <td height="66%" align="left"><html:text property="Units" name="AddReports"/></td>
    </tr>
    <tr> 
    <td height="10" colspan="2"></td>
    </tr>
    <tr> 
    <td height="10" colspan="2"></td>
    </tr>
    <tr> 
    <td width="34%">&nbsp;</td>
        
    <td width="66%" height="35">&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="   <fmt:message key='webclient.report.add'/>   " name=Submit2>
                                
            
    <input type="button" value=" <fmt:message key='webclient.report.cancel'/> " onClick='window.close()'> </td>
    </tr>
                                
 
    </table>

</html:form>
<%--
 <a class="linkNoUnderline" onclick="javascript:AddPO()">Add Polling Object</a> | <a class="linkNoUnderline" onclick="javascript:ModifyPO()">Modify Polling Object</a> | <a class="linkNoUnderline" onclick="javascript:DeletePO()">Delete Polling Object</a> 
--%>
</body>

