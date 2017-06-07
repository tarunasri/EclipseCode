<!--$Id: UploadMibForm.jsp,v 1.6 2010/10/29 13:46:54 swaminathap Exp $-->
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<html>
<head>
<script>
<c:if test='${!empty success}'>
parent.location.href="/admin/MibTool.do?method=loadMIB";
</c:if>
function closeUpload()
{
	parent.Dialog.hide('popup1'); 
	var id=document.getElementById('ifr');
	if(id!=null)  //Null check done
	{	
	id.src = '/webclient/devices/html/blank.html';    
	}
}

function submitForm()
{
	if(document.UploadMibBean.theFile.value == "")
	{
	    alert("<fmt:message key='webclient.admin.mibbrowser.uploadmib.mibname.empty'/>");
	    return false;	
	}
	document.UploadMibBean.submit();
	return true;
}

function reloadForm()
{
	parent.location.href="/admin/MibBrowser.do";
}

</script>
</head>
<body>
<html:form action="/UploadMib.do" name="UploadMibBean" type="com.adventnet.nms.webclient.mibbrowser.UploadMibBean" method="post" enctype="multipart/form-data">
	    <table border="0" cellspacing="0" cellpadding="0"  width="100%"> 
	    <tr>
	    <td align="center" class="errorText"><c:out value="${failure}"/>
	    <div class="div5"></div>
	    </td>
	    </tr>
	    <tr><br><br>
		<td align="center" class="boldText"><fmt:message key="webclient.mibbrowser.selectmib"/>&nbsp;<html:file property="theFile"/><br></td>
	    </tr>
	    <tr>
	    	<td>
			<div class="div5"></div>
		</td>
	    </tr>
	    <tr>
		<td align="center"><br>
		<table height="19" border="0" cellpadding="0" cellspacing="0" class="deviceButtonTable" style="float:right;" onclick="javascript:closeUpload();">
		<tr>
		<td height="19" class="deviceButon1"><img src="/webclient/common/images/spacer.gif" width="4" height="19" /></td>
        	<td class="button"><fmt:message key='Cancel'/></td> 
		<td class="deviceButon3"><img src="/webclient/common/images/spacer.gif" width="4" height="19" /></td>
		</tr>
		</table>
		<input type="hidden" name="submitUpload" value="true"/>
		<table height="19" border="0" cellpadding="0" cellspacing="0" class="deviceButtonTable" style="float:right;margin-right:5px;" onClick='return submitForm();'>
		<tr>
		<td height="19" class="deviceButon1"><img src="/webclient/common/images/spacer.gif" width="4" height="19" /></td>
		<td class="button"><fmt:message key='webclient.mibbrowser.uploadmib'/></td>
		<td class="deviceButon3"><img src="/webclient/common/images/spacer.gif" width="4" height="19" /></td>
		</tr>
		</table>
</td>
	    </tr>
	    <tr>
	    	<td><br>
			<div class="div5"></div>
		</td>
	    </tr>
	    </table>
</html:form>
</body>
</html>

