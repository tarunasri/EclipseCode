<%-- $Id: uploadFile.jsp,v 1.2 2010/10/29 13:47:02 swaminathap Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<STYLE TYPE="text/css"> 
.toInputStyle {
    border: 1px #7B94CE solid;
    font-size: 11px;
	color: #000000;
    width: 150px;
    font-family: Verdana, Arial, Helvetica, sans-serif;
}
</STYLE>

<SCRIPT language="JavaScript1.2" SRC="/webclient/common/js/validation.js"></SCRIPT>
<script> 
function validationCheck(f)
{
	if (trimAll(f.toAddress.value).length == 0)
	{
		alert("<fmt:message key='webclient.common.upload.tomailnull'/>")
        f.toAddress.value="";
		f.toAddress.focus();
		return false;	
	}
	if (trimAll(f.fromAddress.value).length == 0)
	{
		alert("<fmt:message key='webclient.common.upload.frommailnull'/>")
        f.fromAddress.value="";
		f.fromAddress.focus();
		return false;	
	}
	if(!emailCheck(f.toAddress)){
        f.toAddress.value="";
		f.toAddress.focus();
		return false;
	}
	if(!emailCheck(f.fromAddress)){
        f.fromAddress.value="";
		f.fromAddress.focus()
		return false;
	}
    if (trimAll(f.subject.value).length == 0)
    {
        alert("<fmt:message key='webclient.common.feedback.subjectnull'/>")
        f.subject.value="";
        f.subject.focus()
        return false;
    }
    if (trimAll(f.message.value).length == 0)
    {
        alert("<fmt:message key='webclient.common.feedback.messagenull'/>")
        f.message.value="";
        f.message.focus()
        return false;
    }
    return true;

}


function emailCheck (email) {
var emailStr = email.value;
var emailPat=/^(.+)@(.+)$/;

var matchArray=emailStr.match(emailPat);

if (matchArray==null) {
    alert("<fmt:message key='webclient.common.upload.emailvalidation'/>");
    return false;
    }
    return true
}
</script>

<html>
<head>
<title><fmt:message key='webclient.common.upload.pagetitle'/></title>

</head>




<body bgcolor=white>
<form  action="/UploadFile.do" > 
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
 <tr> 
    <td align="right" class="text"><font color="#FF0000">*</font> <fmt:message key='webclient.perf.mandatory.message'/></td>
 </tr>
</table>
  <table width="99%" border="0" cellpadding="5" cellspacing="0" class="htableBorder">
    <tr class="header2Bg"> 
      <td colspan="3" class="boldText" ><fmt:message key='webclient.common.upload.header'/> </td>
    </tr>
    <c:if test="${!empty errorMsg}">
    <tr> 
      <td colspan="2" align="center"><c:choose><c:when test='${errorMsg=="Mail Sent Sucessfully"}'><span class="success"></c:when><c:otherwise><span class="failure"></c:otherwise></c:choose><c:out value='${errorMsg}' escapeXml="false"/></span></td>
      <td>&nbsp;</td>
    </tr>
    </c:if>
    <tr> 
      <td width="20%"><span class="text"><fmt:message key='webclient.common.upload.mailid'/> <font color="#FF0000">*</font> </span></td>
      <td class="text"><input name="fromAddress" type="text" class="formStyle" style="width:300"  ></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td> <span class="text"><fmt:message key='webclient.common.upload.to'/> <font color="#FF0000">*</font> </span></td>
      <td class="text"><input name="toAddress11" type="text" style="width:300" disabled class="toInputStyle" value="<fmt:message key='nms-support'/>"></td>
      <td><span class="text"> </span></td>
    </tr>
    <tr> 
      <td><span class="text"><fmt:message key='webclient.common.upload.subject'/> <font color="#FF0000">*</font> </span></td>
      <td><input name="subject" type="text" class="formStyle"  style="width:300"> 
       </td>
      <td><span class="txt"> </span></td>
    </tr>
    <tr> 
      <td valign="top" ><span class="text"><br><fmt:message key='webclient.common.upload.message'/> <font color="#FF0000">*</font> </span></td>
      <td><span class="text"><fmt:message key='webclient.common.upload.attachment'/> :</span> <img src="/webclient/common/images/attachment.gif" width="18" height="18"><span class="text">&nbsp;&nbsp;<c:out value='${zipName}'/><br></span><textarea name="message" cols="55" rows="10" wrap=physical class="formStyle" style =" width:400"></textarea></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td> <input name="Submit" type="submit" value="<fmt:message key='webclient.common.upload.send'/>" class="Button" onClick="return validationCheck(this.form);"> 
        <input name="Submit2" type="submit" value="<fmt:message key='webclient.common.upload.close'/>" class="Button" onClick="javascript:window.close()"> 
        <input type="hidden" name="uploadfile" value="<c:out value='${zipFilePath}'/>" > 
        <input type="hidden" name="todo" value="upload"> 
        <input type="hidden" name="toAddress" value="<fmt:message key='nms-support'/>"> 
        <input type="hidden" name="WebNMS-Version" value="<c:out value='${productinfo.Product_Version}'/>">
        <input type="hidden" name="SP-Version" value="<c:out value='${productinfo.SP_Version}'/>">
        <input type="hidden" name="License-Type" value="<c:out value='${productinfo.licensetype}'/>">
        <input type="hidden" name="User-Name" value="<c:out value='${productinfo.username}'/>">
        <input type="hidden" name="User-Type" value="<c:out value='${productinfo.usertype}'/>">
    

      </td>
      <td>&nbsp; </td>
    </tr>
  </table>
</form>

</body>
</html>
