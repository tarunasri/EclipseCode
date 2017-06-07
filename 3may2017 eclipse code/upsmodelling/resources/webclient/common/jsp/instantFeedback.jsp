<%-- $Id: instantFeedback.jsp,v 1.1.2.3.4.1 2006/04/03 19:03:05 gnanasekar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<html>

<head>
<title><fmt:message key='webclient.common.feedback.pagetitle'/></title>
</head>
<SCRIPT language="JavaScript1.2" SRC="/webclient/common/js/validation.js">
</SCRIPT>

<%@include file="/webclient/common/jspf/feedbackValidation.jspf" %>
<STYLE TYPE="text/css"> 
.toInputStyle {
    border: 1px #7B94CE solid;
    font-size: 11px;
	color: #000000;
    width: 150px;
    font-family: Verdana, Arial, Helvetica, sans-serif;
}
</STYLE>


<body bgcolor=white >
<form name="instantForm" method=post  onsubmit='return checkValidation()' action="http://www.adventnet.com/cgi-bin/mail?webnms">

 <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr> 
    <td align="right" class="text"><font color="#FF0000">*</font> <fmt:message key='webclient.perf.mandatory.message'/></td>
 </tr>
</table>
  <table width="99%" class="hTableBorder" border="0" align="center" cellpadding="6" cellspacing="0">
    <tr class="header2Bg"> 
      <td colspan=2 class="header1"><fmt:message key='webclient.common.feedback.pageheader'/></td>
    </tr>
  <%--  <tr> 
      <td nowrap class="text"><fmt:message key='webclient.common.feedback.name'/></td>
      <td class="text" width=100%><input  type="text" name="From" style="width:300" class="formStyle"></td>
    </tr> --%>
    <tr > 
      <td  nowrap class="text" ><fmt:message key='webclient.common.feedback.emailid'/><font color="#FF0000">*</font></td>
      <td class="text" width=100%><input  type="text" name="from-email" id="from-email" class="formStyle"  style = "width:300"></td>
    </tr>
    <tr> 
      <td  nowrap class="text"><fmt:message key='webclient.common.feedback.toaddress'/><font color="#FF0000">*</font></td>
      <td class="text" width=100%><input  type="text" name="To" value="<fmt:message key='nms-support'/>" disabled class="toInputStyle" style = "width:300"></td>
    </tr>
    <tr> 
      <td  nowrap class="text"><fmt:message key='webclient.common.feedback.subject'/><font color="#FF0000">*</font></td>
      <td class="text" width=100%><input  type="text" name="subject" class="formStyle" style = "width:300"></td>
    </tr>
    <input type="hidden" name="type" value="issue"  > 
 <%--
    <tr> 
      <td vAlign=middle noWrap class=text><fmt:message key='webclient.common.feedback.markas'/></td>
      <input type="hidden" name="type" value="issue"  > 
       
	  String type1 = (String)request.getParameter("type");

	if(type1 == null)
	{
		type1 = "issue";
	}
	if(type1.equals("feature") ){
%>	
	<td align="left" class="text" valign="top"> <input name="type" type="radio" value="issue" >
        <fmt:message key='webclient.common.feedback.markas'/>
        <input type="radio" name="type" value="feature" checked > 
        Feature request</td>
	
<%	} else { %>
	
	<td align="left" class="text" valign="top"> <input name="type" type="radio" value="issue" checked >
        <fmt:message key='webclient.common.feedback.reportissue'/> 
        <input type="radio" name="type" value="feature" >
        <fmt:message key='webclient.common.feedback.featurereq'/> </td>
	<%
	}
	
    </tr> --%>
    <tr > 
      <td nowrap class="text" valign=top><fmt:message key='webclient.common.feedback.message'/><font color="#FF0000">*</font></td>
      <td class="text"><textarea rows=10 name="Description" class="formStyle" style = "width:300"></textarea></td>
    </tr>
    <tr> 
      <td nowrap class="text" >&nbsp;</td>
      <td class="text"> <input type="submit" value="<fmt:message key='webclient.common.feedback.send'/>" class="button"> 
      <%--  <input name="Reset" type="reset" class="button" id="Reset" value=" <fmt:message key='webclient.common.feedback.reset'/> " onClick="javascript:clearFields()"> --%>
        <input name="Close" type="button" class="button" id="Close" value="<fmt:message key='webclient.common.feedback.close'/>" onClick="javascript:window.close()"> 

        <%-- <input type="hidden" name="from-email" value="noreply@adventnet.com">  --%>
        <input type="hidden" name="WebNMS-Version" value="<c:out value='${productinfo.Product_Version}'/>">
        <input type="hidden" name="SP-Version" value="<c:out value='${productinfo.SP_Version}'/>">
        <input type="hidden" name="License-Type" value="<c:out value='${productinfo.licensetype}'/>">
        <input type="hidden" name="User-Name" value="<c:out value='${productinfo.username}'/>">
        <input type="hidden" name="User-Type" value="<c:out value='${productinfo.usertype}'/>">
        <input type="hidden" name="next-url" value="http://adventnet.com/products/webnms/thankyou.html"> 
        <input type="hidden" name="IssuePage"> <input name="ip" type="hidden" value="<%= request.getRemoteAddr() %>" %> 
      </td>
    </tr>
  </table>
</form>

<script>
if(window.opener)

{

 document.instantForm.IssuePage.value=window.opener.document.URL;

}

</script>
</body>

</html>

