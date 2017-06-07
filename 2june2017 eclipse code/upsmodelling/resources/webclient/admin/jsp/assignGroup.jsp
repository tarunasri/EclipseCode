<%-- $Id: assignGroup.jsp,v 1.5 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<script language="javascript" src="/webclient/admin/js/ModifyProfileFunctions.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/admin/jspf/ModifyProfileFunctions.jspf" %>
</head>
<script>
function setOnLoadItems()
{
    var existingitems = "";
    var availableitems = "";

    <c:forEach items="${ExistingGroups}" var="group1" varStatus="index">
    if(existingitems == '') {
    existingitems = '<c:out value="${group1}"/>';
    }
    else {
        existingitems = existingitems +","+ '<c:out value="${group1}"/>';
    }
    </c:forEach>
    document.ModifyProfileForm.existingItems.value = existingitems;


    <c:forEach items="${AvailableGroups}" var="group2" varStatus="index">
    if(availableitems == '') {
        availableitems = '<c:out value="${group2}"/>';
    }
    else {
        availableitems = availableitems + ","+ '<c:out value="${group2}"/>';
    }
    </c:forEach>
    document.ModifyProfileForm.availableItems.value = availableitems;
     //alert('Existing user ' + existingitems);
     //alert('Available user ' + availableitems);
      }
 function resetFields1()
{
//alert('Getting called');
var currentSize = document.ModifyProfileForm.availableGroups.options.length;
    var selectSize =  document.ModifyProfileForm.existingGroups.options.length
    var selectionModel = new Array();

    for(var i=(currentSize-1);i>-1;i--)
    {
        document.ModifyProfileForm.availableGroups.options[i] = null;
    }
    for(var j=(selectSize-1);j>-1;j--)
    {
        document.ModifyProfileForm.existingGroups.options[j] = null;
    }

    setOnLoadItems();

    var existingitems = document.ModifyProfileForm.existingItems.value;
    var availableitems = document.ModifyProfileForm.availableItems.value;
//alert('Existing Groups ' + existingitems);
    //alert('Available Groups ' + availableitems);
    if(existingitems != '') {
        var tokeniz = existingitems.split(",");
        for(var i=0;i<tokeniz.length; i++)
        {
            var add = new Option(tokeniz[i], tokeniz[i]);
            document.ModifyProfileForm.existingGroups.options[i] = add;
        }
    }

    if(availableitems != '') {
        var tokeniz2 = availableitems.split(",");
        for(var j=0;j<tokeniz2.length; j++)
        {
	//alert('Available group ' +tokeniz2[j]);
	var add = new Option(tokeniz2[j], tokeniz2[j]);
            document.ModifyProfileForm.availableGroups.options[j] = add;
        }
    }
/*
   for(i=(selectionModel.length-1);i>-1;i--)
      {
 	 if(selectionModel[i]==1)
        {
                        var xv = document.ModifyProfileForm.availableGroups.options[i].value;
                        var xn = document.ModifyProfileForm.availableGroups.options[i].text;
                        document.ModifyProfileForm.availableGroups.options[i] = null;
                        var add = new Option(xn, xv);
                        document.ModifyProfileForm.existingGroups.options[selectSize] = add;
                        selectSize = ++selectSize;
        }
    }
*/
}

</script>
<body onload="setOnLoadItems();">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key="webclient.admin.modifyuserprofile.modify"><fmt:param><c:out value='${selectedUserName}'/></fmt:param> </fmt:message></h1></td>
		<td align="right"></td>
        </tr>
        </table>

<form name="ModifyProfileForm" action="/admin/AssignGroups.do" method="POST" onSubmit="return validateAssignGroup()">
<input type="hidden" name="userName" value="<c:out value='${selectedUserName}'/>">
<input type="hidden" name="availableItems">
<input type="hidden" name="existingItems">
<input type="hidden" name="toPerform" value="<c:out value='${toPerform}'/>" />

 <table style="margin-bottom:10px;" width="90%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >

<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr align="center" > 
  <td width="10">&nbsp;</td>
  <td align="left" align="center" valign="top" > 
    <table width="100%" border="0" cellpadding="1" cellspacing="1" >
<tr align="center"> 
      <td height="25" colspan="3" align="left" class="text"><fmt:message key="webclient.admin.modifyuserprofile.groupoptions.message"/></td>
     </tr>
          <tr valign="top"> 
       <td class="text"><fmt:message key="webclient.admin.modifyuserprofile.availablegroups"/></td>
       <td align="middle"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       <td   ><span class="text"><fmt:message key="webclient.admin.modifyuserprofile.enrolledgroups"/></span></td>
     </tr>
     <tr valign="top"> 
      <td> <select class="formStyle" multiple style="height:auto" 
      <c:choose> <c:when test="${assignUser=='false'}"> disabled </c:when> </c:choose> 
        name="availableGroups" size="5" > <c:forEach items="${AvailableGroups}" var="pls" varStatus="index"> 
        <option value='<c:out value="${pls}"/>'> <c:out value="${pls}"/> 
       </option>
      </c:forEach> </select> </td>

      <td align="center" width="0"> <table width="100%" border="0" cellspacing="0" cellpadding="3">
      <tr > 
       <td><a href="javascript:add()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_add.gif" 
        width="35" height="25" alt='<fmt:message key="webclient.admin.modifyuserprofile.img.add.alt"/>' 
        border="0"></a></td>
     </tr>
     <tr> 
      <td> <img src="/webclient/common/images/trans.gif" width="1" height="3"></td>
     </tr>
     <tr> 
     <td><a href="javascript:remove()"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/b_remove.gif" 
        width="35" height="25" alt='<fmt:message key="webclient.admin.modifyuserprofile.img.remove.alt"/>' 
        border="0"></a></td>
     </tr>
    </table></td>
    <td> <select class="formStyle" multiple style="height:auto" 

    <c:choose> <c:when test="${removeUser=='false'}"> disabled </c:when> </c:choose> 
                  name="existingGroups" size="5" > <c:forEach items="${ExistingGroups}" var="pls" varStatus="index"> 
                  <option value='<c:out value="${pls}"/>'> <c:out value="${pls}"/> 
                  </option>
                  </c:forEach> </select> </td>
              </tr>
            </table></td>
        </tr>
        <tr><td colspan="2" >&nbsp; </td>
        </tr>
        <tr class="header2bg" height="25" > 
          <td align="center" colspan="2"> 
		  	<input name="Submit" type="submit" id="Submit" value="<fmt:message key='webclient.admin.modifyuserprofile.submit'/>" class="button">
			<input name="Reset" type="reset" class="button" value="<fmt:message key='webclient.admin.modifyuserprofile.clear'/>"  onclick="javascript:resetFields1()"> 
            <input name="Cancel" type="button" class="button" onclick="javascript:window.close()" value='<fmt:message key="webclient.common.window.close"/>'>
          </td>
        </tr>
       <tr><td colspan="2" >&nbsp; </td>
        </tr>
</table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>
</body>
</html>
