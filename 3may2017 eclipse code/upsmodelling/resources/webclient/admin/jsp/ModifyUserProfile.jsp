<%-- $Id: ModifyUserProfile.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<head>

<script language="javascript" src="/webclient/admin/js/ModifyProfileFunctions.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script language="javascript" src="/webclient/common/js/general.js"></script>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listrowselection.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listview.js"></SCRIPT>

<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/admin/jspf/ModifyProfileFunctions.jspf" %>

<style>
.editText, .displayText {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	height: 20px;
}
.displayText {
	border: 0px transparent none;
	background: transparent;
	cursor: url(/webclient/common/images/edit_cursor.png), default;
}
.hide {
	display: none;
}
.display {

}
</style>
<script type="text/javascript" language="JavaScript" src="/webclient/common/js/general.js"></script>
<script>

function assignOperation(selectedUser)
{
    height = "580";
    width = "450";
    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width + ',scrollbars=yes,resizable=no,directories=no,menubar=no,toolbar=no';

     url = "/admin/OperationsView.do?selectedTab=admin&selectedNode=operationconfig&selectedUser=" + selectedUser + "&pageinfo=individualuserconfiguration";
    //scopeURL=url + "&groupName=" + groupName + "&customView=" + customView;

    custwindow = window.open(url,"OperationTree",windowParams);
    custwindow.opener = window;    
    navapp = navigator.appVersion;
	if(navapp.indexOf("MSIE")== -1)
	{
		custwindow.focus();
	}
}

</script>
</head>

<body >

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key="webclient.admin.modifyuserprofile.modify"><fmt:param><c:out value='${selectedUserName}'/></fmt:param> </fmt:message></h1></td>
		<td align="right"></td>
        </tr>
        </table>

<form name="ModifyProfileForm" action="/admin/ModifyUserProfileAction.do" method="POST" onSubmit="return Validate()">
<input type="hidden" name="userName" value="<c:out value='${selectedUserName}'/>">
<input type="hidden" name="availableItems">
<input type="hidden" name="existingItems">

 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="htableBorder table">
  <tr><td colspan="2">
    <table border="0" width="100%" cellspacing="0" cellpadding="0" ><tr>
    <td height="24" class="header2bg text "><strong><fmt:message key="webclient.admin.modifyuser.header"/></strong></td> 
    <td class="header2bg text propFormLink" valign="middle" align="right">
    <span id="editbutton"><a href= "javascript:toggleTable()"><fmt:message key='webclient.topo.objectdetails.edit'/>&nbsp;</a></span>
    <span id="cancelbutton" class="hide"><a href= "javascript:toggleTable()"><fmt:message key='webclient.topo.objectdetails.cancel'/>&nbsp;</a></span></td>
    <td width="16" class="header2bg"><a href="javascript:toggleTable()"><img src="/webclient/common/images/edit.gif"  width="14" border='0' height="15" valign="middle"></a></td> 
    </tr></table>
    </td>
  </tr>
  <tr height="25" >
    <td width="180" nowrap class="odd text"> <div align="right"><strong><fmt:message key="webclient.admin.modifyuser.username"/></div></td>
    <td width="70%"  class="text">&nbsp; <c:out value='${selectedUserName}'/> </td>
  </tr>
  <tr height="22"  id="currentstatus" >
        <td nowrap class="odd text"> <div align="right"><strong><fmt:message key="webclient.admin.modifyuser.currentstatus"/></strong></div></td>
        <td class="text">&nbsp; <c:out value='${status}'/>      
         </td>
  </tr>
  <tr height="25" id="editstatus" class="hide">
          <td nowrap class="odd text"> <div align="right"><strong><fmt:message key="webclient.admin.modifyuser.currentstatus"/></strong></div></td>
          <td class="text">&nbsp; <select name="status" class="editText">
                <option value="enabled"  >enabled</option><option value="disabled" 
                <c:if test="${status == 'disabled' }">selected</c:if> >disabled</option></select> </td>
  </tr>
  <c:if test="${isAdmin == 'false'}">
  <tr height="25" id="currentpwd" class="hide">
      <td nowrap class="odd text"> <div align="right"><strong><fmt:message key="webclient.admin.modifyuserprofile.currentpassword"/></strong></div></td>
      <td class="text">&nbsp; <input name="currentpassword" id="currentpassword" maxlength="8" type="password" class="editText" value=""> 
      	<%-- <input name="pwd" id="pwd" type="password" class="editText">  --%> </td>
  </tr>
  </c:if>
  <tr height="25" id="pwdrow" class="hide">
    <td nowrap class="odd text"> <div align="right"><strong> <fmt:message key="webclient.admin.modifyuserprofile.newpassword"/></strong></div></td>
    <td class="text">&nbsp; <input name="newPassword" maxlength="8" type="password" class="editText" value=""> 
    	<%-- <input name="pwd" id="pwd" type="newPassword" class="editText">  --%> </td>
  </tr>
  <tr height="25" id="retypepwdrow" class="hide">
    <td nowrap class="odd text"> <div align="right"> <strong><fmt:message key="webclient.admin.modifyuserprofile.retypepassword"/></strong></div></td>
    <td class="text">&nbsp; <input name="retypepassword"  maxlength="8" type="password" class="editText" value="">
    <%-- <input name="retypepwd" id="retypepwd" type="password" class="editText"> --%> </td>
  </tr>
  <tr height="25" >
    <td nowrap class="odd text"> <div align="right">
    	<%-- <input name="ispasswordexpiry" id="accexpchk" type="checkbox" class="hide"
	<c:choose> <c:when test="${changePassword=='false'}"> disabled </c:when> </c:choose> 
            onClick="PasswordExpCheck()" value="checkbox"> --%>
                    <strong> <fmt:message key="webclient.admin.modifyuserprofile.modifypasswordexpiry"/></strong>
            <%--
        <input type="checkbox" name="accexpchk" id="accexpchk" value="checkbox" class="hide">
        Account Expires in --%> </div>  </td>
    <td class="text">&nbsp; <input name="passwordExpiryTime" type="text" size="3" maxlength="3" readonly class="displayText"  style="width:30" value="<c:out value='${passage}'/>">
           <fmt:message key="webclient.admin.modifyuserprofile.modifypasswordexpiry.days"/>
            <%--
            <input name="accexp" id="accexp" type="text" class="displayText" readonly value="0" style="width:30"> 
      days  --%> </td>
  </tr>
  <tr height="25" >
    <td nowrap class="odd text"> <div align="right">
  <%--  <input type="checkbox" id="pwdexpchk" name="isaccountexpiry" value="checkbox" class="hide"
    <c:choose> <c:when test="${changePassword=='false'}"> disabled </c:when> </c:choose> 
            onClick="AccountExpCheck()"> --%>
             <strong> <fmt:message key="webclient.admin.modifyuserprofile.modifyaccountexpiry"/> </strong> 
     <%--   <input type="checkbox" name="pwdexpchk" id="pwdexpchk" value="checkbox" class="hide">
        Password Expires in   --%> </div></td>
    <td class="text">&nbsp; <input name="accountExpiryTime" type="text" size="3" class="displayText" maxlength="3" readonly style="width:30"  value="<c:out value='${userage}'/>"> 
            <fmt:message key="webclient.admin.modifyuserprofile.modifyaccountexpiry.days"/>
            <%--
            <input name="pwdexp" id="pwdexp" type="text" class="displayText" readonly value="0" style="width:30">
      days --%> </td>
  </tr>
  <tr height="25" >
	<td height="25"  class="header2Bg" colspan="2"><img src="/webclient/common/images/trans.gif" height="1" width="25%">
		<%-- <span id="editbutton1"><input type="button" value="<fmt:message key='webclient.topo.objectdetails.edit'/>" class="button" onClick="editInfo()"></span> --%>
		<span id="savebutton" class="hide"><input type="submit" value="<fmt:message key='webclient.admin.modifyuserprofile.submit'/>" class="button">
		<input type="button" value="<fmt:message key='webclient.topo.objectdetails.cancel'/>" class="button" onClick="cancelSave()"></span>
	</td>
</tr>
</form>
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

<br>
<a name="bk_groups" id="bk_groups"></a>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="13"> <a href="javascript:toggleView('groups');"><img src="/webclient/common/images/<c:out value = '${selectedskin}'/>/collapse.gif" border="0" align="absmiddle" id="groups_img"></a></td>
    <td height="22" > <a class="text" href="javascript:toggleView('groups');" style="text-decoration:none"><strong><fmt:message key='webclient.admin.modifyuser.ascgroups'/></strong></a> </td>
  </tr>
  <tr>
  	<td></td>
  	<td class="hline" height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div id="groups" style="display:none">
	<table width="100%" border="0" cellspacing="0" cellpadding="2">
      
         <tr>
       <td nowrap class="text">  <c:if test="${assignUser == 'true' || removeUser == 'true'}">
         <input type="button" name="AssignGroup" value="<fmt:message key='webclient.admin.modifyuser.configroup'/>" onclick="javascript:assignGroup()" class="button"> </c:if>
     </td>   
       <td nowrap class="text">&nbsp;</td>
    </tr>  
  </table>
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
		<table width="100%" border="0" cellspacing="0" cellpadding="2" class="homeTableBorder">
          <tr class="tableHeaders">
            <td width="10" height="25" class="tableHeaders"> <div align="center">
           <%--     <input type="checkbox" name="checkbox" value="checkbox"> --%>
              </div></td>
              <td width="20" > <div align="center"></div></td>
            <td width="95%"><a class="boldWhiteText" ><fmt:message key='webclient.admin.modifyuser.groups'/></a></td>
          </tr>

         <c:choose>
        <c:when test="${!empty ExistingGroups}">
          <c:forEach items="${ExistingGroups}" var="pls" varStatus="status">
          <tr height="22"  <c:choose>
                <c:when test="${status.count%2==1}">
                class="reportsEvenRow"  </c:when>
                <c:otherwise>class="reportsOddRow" </c:otherwise> </c:choose>  >
            <td><div align="center">
           <%--     <input type="checkbox" name="checkbox2" value="checkbox"> --%>
              </div></td> <td nowrap><img src="/webclient/common/images/groups_small.gif" alt="Remove" border="0" align="absmiddle"></td>
            <td ><a class="text" href="/admin/GroupProfileForm.do?selectedTab=admin&selectedNode=groupadmin&groupName=<c:out value='${pls}'/>"><c:out value="${pls}"/> </a></td>
          </tr>
            </c:forEach>         
         </c:when>
        <c:otherwise>
         <tr class="reportsEvenRow"> <td >&nbsp;</td>
		    <td class="text" nowrap>
                <fmt:message key='webclient.admin.nodata.available'/>
            </td>
        </tr>
        </c:otherwise>
        </c:choose> 

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
        <br>
      </div></td>
  </tr>
</table>
<a name="bk_user_operations" id="bk_operations"></a>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="13"> <a href="javascript:toggleView('user_operations');"><img src="/webclient/common/images/<c:out value = '${selectedskin}'/>/collapse.gif" border="0" align="absmiddle" id="user_operations_img"></a></td>
    <td height="22" > <a class="text" href="javascript:toggleView('user_operations');" style="text-decoration:none"> <strong><fmt:message key='webclient.admin.modifyuser.operations'/> </strong></a> </td>
  </tr>
  <tr>
  	<td></td>
  	<td class="hline" height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div id="user_operations" style="display:none">
		<table width="100%" border="0" cellspacing="0" cellpadding="2">
        
          <tr>
            <td nowrap class="text"> <c:if test="${userPermission == 'true'}">
         <input type="button" name="Button3" value="<fmt:message key='webclient.admin.modifyuser.configoperation'/>" class="button" onClick="javascript:assignOperation('<c:out value='${selectedUserName}'/>')"> </c:if>
            </td>      <td nowrap class="text">&nbsp;</td>
    </tr>  
  </table>
 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
		<table width="100%" border="0" cellspacing="0" cellpadding="2" class="homeTableBorder">
        <tr class="tableHeaders">
          <td width="10" height="25"> </td><td ></td>
          <td width="30%" class="tableHeaders"><a class="boldWhiteText" ><fmt:message key='webclient.admin.modifyuser.operationname'/></a></td>
          <td width="65%" class="tableHeaders"><a class="boldWhiteText" ><fmt:message key='webclient.admin.modifyuser.operationtype'/> </a></td>
        </tr>
         
          <c:choose>
        <c:when test="${!empty AuthOperation}">       
       <c:forEach var="operationlist" items="${AuthOperation}" varStatus="status">
     <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="reportsOddRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsEvenRow" height=22>
           </c:otherwise>
        </c:choose> 
		          <td height="22"><div align="center">
		            </div></td> <td nowrap><img src="/webclient/common/images/operation_small.gif" alt="Remove" border="0" align="absmiddle"></td>
		          <td class="text"><c:out value="${operationlist.key}"/></td>
                  <td class="text"><c:choose><c:when test="${operationlist.value eq 'included'}" >
                    <img src="/webclient/common/images/operation.gif" hspace="4" border="0" align="absmiddle">
                </c:when>
                <c:otherwise>
                     <img src="/webclient/common/images/operations_exluded.gif" hspace="4" border="0" align="absmiddle">
                </c:otherwise>
                </c:choose>
                        <c:out value="${operationlist.value}"/> </td>
         </tr>
         </c:forEach>   
        </c:when>
        <c:otherwise>
         <tr class="reportsEvenRow"> <td >&nbsp;</td>
		    <td class="text" nowrap colspan="2">
                <fmt:message key='webclient.admin.nodata.available'/>
            </td>
        </tr>
        </c:otherwise>
        </c:choose> 
       
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
	  <br>
	  </div>
	  </td>
  </tr>
</table>
</body>



<script type="text/javascript" language="JavaScript">
var RLArray=Array("groups","user_operations")
for (var i=0;i<RLArray.length;i++) {
	var listObj=getObj(RLArray[i])
	var toggleImageObj=getObj(RLArray[i]+"_img")
	var status=get_cookie(RLArray[i])
	if (status=="none" || status==null || status=="undefined") {
		listObj.style.display="none"
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/expand.gif"
	} else {
		listObj.style.display="block"
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/collapse.gif"
	}
}

var docloc=document.location.href
if (docloc.indexOf("bk_")>=0) {
	var RLName=docloc.substr(docloc.indexOf("bk_")+3)
	getObj(RLName).style.display="block"
	getObj(RLName+"_img").src="/webclient/common/images/<c:out value = "${selectedskin}"/>/expand.gif"
}
</script>


<script type="text/javascript" language="JavaScript">

function assignGroup()
{
    height = "270";
    width = "450";

    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width;
    //if (parms) { winParms += "," + parms; }

    var userName = '<c:out value="${selectedUserName}"/>';
    url = "/admin/AssignGroups.do?selectedTab=admin&selectedNode=useradmin&toPerform=showGroupList&selectedUser=" + userName;
    window.open(url,"AssignGroup",windowParams);
}

function toggleTable()
{
    if(getObj("editbutton").className=="hide") {
        cancelSave();
    }
    else {
        editInfo();
    }
}

function editInfo() 
{
    getObj("accountExpiryTime").readOnly=getObj("passwordExpiryTime").readOnly=false;
    getObj("accountExpiryTime").className=getObj("passwordExpiryTime").className="editText";
    getObj("pwdrow").className=getObj("retypepwdrow").className="display";

    var isAdmin = '<c:out value="${isAdmin}"/>';
    if(isAdmin == "true") 
    {
	getObj("newPassword").focus();
	getObj("newPassword").select();		
    }	    
    else
    {
	getObj("currentpwd").className= "display";
    	getObj("currentpassword").focus();
	getObj("currentpassword").select();
    }
    getObj("editstatus").className=getObj("savebutton").className=getObj("cancelbutton").className="display";
        getObj("currentstatus").className=getObj("editbutton").className="hide";
	

}

function cancelSave() {
	document.ModifyProfileForm.reset();
    	getObj("accountExpiryTime").readOnly=getObj("passwordExpiryTime").readOnly=true;
	getObj("accountExpiryTime").className=getObj("passwordExpiryTime").className="displayText";
	getObj("editstatus").className=getObj("pwdrow").className=getObj("retypepwdrow").className="hide";
	var isAdmin = '<c:out value="${isAdmin}"/>';
	if(isAdmin != "true")
	{
		getObj("currentpwd").className="hide";
	}
	getObj("savebutton").className=getObj("cancelbutton").className="hide";
	getObj("currentstatus").className=getObj("editbutton").className="display";
}

function toggleView(id) {
	var listTableObj=getObj(id);
	var toggleImageObj=getObj(id+"_img");

	if (listTableObj.style.display=="block") {
		listTableObj.style.display="none";
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/expand.gif";
	} else {
		listTableObj.style.display="block";
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/collapse.gif";
	}
	set_cookie(id,listTableObj.style.display);
}
</script>


<script>
var testEdit = '<c:out value="${param.editMode}"/>';
if(testEdit != null && testEdit == 'true') {
    editInfo();
    }
</script>
