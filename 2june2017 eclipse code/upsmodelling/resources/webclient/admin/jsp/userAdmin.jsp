<%-- $Id: userAdmin.jsp,v 1.6 2010/10/29 13:46:54 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<script language="javascript" src="/webclient/common/js/sorttable.js"></script>

<script >

function assignedOperation(selectedUser)
{
    height = "580";
    width = "450";
    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width + ',scrollbars=yes,resizable=yes,directories=no,menubar=no,toolbar=no';

     url = "/admin/OperationsView.do?selectedTab=admin&selectedNode=useradmin&selectedUser=" + selectedUser + "&pageinfo=userconfiguration";
    //scopeURL=url + "&groupName=" + groupName + "&customView=" + customView;

    custwindow = window.open(url,"OperationTree",windowParams);
    custwindow.opener = window;    
    navapp = navigator.appVersion;
	if(navapp.indexOf("MSIE")== -1)
	{
		custwindow.focus();
	}

}

function assignGroup(selectedUser)
{

   var userName = '<c:out value="${userName}"/>';
   if(userName == selectedUser)
   {
      alert('<fmt:message key="webclient.admin.useradmin.currentusergroupassign"/>');
      return;
   }
   
    height = "270";
    width = "450";

    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width;
    
     url = "/admin/AssignGroups.do?selectedTab=admin&selectedNode=useradmin&toPerform=showGroupList&selectedUser=" + selectedUser + "&pageinfo=userconfiguration";
    window.open(url,"AssignGroup",windowParams);
}


function addUser()
{
    location.href='/admin/InvokeAddUserForm.do?selectedTab=admin&selectedNode=useradmin';
}

function addMultipleUser()
{
    location.href='/admin/AddMultiUserForm.do?selectedTab=admin&selectedNode=useradmin&toPerform=multiUserForm';
}


function deleteUser(delUserName)
{
    var con = confirm('<fmt:message key="webclient.admin.useradmin.delconfirm"/>');
    if ( con != true)
    {
        return;
    }
    location.href="/admin/RemoveUserAction.do?selectedTab=admin&selectedNode=useradmin&userName="+delUserName;
}

function getSelectedUsers()
{
    var listViewForm = document.listView;
	var len = listViewForm.elements.length;
	var selectedUsers = '';
	for ( var i=0; i < len; i++)
		{
			formElement = listViewForm.elements[i];
			if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
				{
					if(selectedUsers == '')
						{
							selectedUsers = formElement.value;
						}
					else
						{
							selectedUsers += ',' + formElement.value;
						}
				}
		}
    return selectedUsers;
	
}

function showSelectedUser(selectedType)
{
    showURL= '/admin/UserAdmin.do?selectedTab=admin&selectedNode=useradmin';
    url = showURL + "&selectedType=" +  selectedType;
    location.href=url;
}


function setStatus(userStatus)
{

    var selectedUsers = getSelectedUsers(); 
    modifyURL = '/admin/ModifyUserProfileAction.do?selectedTab=admin&selectedNode=useradmin';

    if(selectedUsers == '')
	{
    	alert('<fmt:message key="webclient.admin.useradmin.selecterr"/>');
		return;
	}
    
	url = modifyURL + "&selectedUsers=" + selectedUsers + "&setUserStatus="+userStatus;
    location.href=url;
}

function deleteUserList()
{
     delURL = '/admin/RemoveUserAction.do?selectedTab=admin&selectedNode=useradmin';

	var selectedUsers = getSelectedUsers();
	if(selectedUsers == '')
	{
    	alert('<fmt:message key="webclient.admin.useradmin.selecterr"/>');
		return;
	}
    var con = confirm('<fmt:message key="webclient.admin.useradmin.delconfirm"/>');
    if ( con != true)
    {
        return;
    }
    //location.href="/admin/RemoveUserAction.do?selectedTab=admin&selectedNode=useradmin&userName="+delUserName;

	url = delURL + "&selectedUsers=" + selectedUsers;
    location.href=url;

//window.open(url,"_top");
}


</script>

<script language="javascript" src="/webclient/common/js/general.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listrowselection.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listview.js"></SCRIPT>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.adminpanel.userconfig'/></h1></td>
		<td align="right"></td>
        </tr>
        </table>


<form name="listView">

<table width="100%" border="0" cellspacing="0" cellpadding="0">

<c:if test="${!empty success && empty failure}"> <tr>
    <td height="20" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr> <td width="20%"></td>
        <td height="25" nowrap class="responseText"><img src="/webclient/common/images/tick.gif" width="17" height="13" hspace="5" border="0"><c:out value="${success}"/></td> </tr>  </table>  </td>  </tr>
  </c:if>

  <c:if test="${!empty failure}">  <tr>
    <td height="20" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>  <td width="20%"></td>
        <td width="80%" class="errorText"><img src="/webclient/common/images/negativeRes.gif" width="17" height="13" hspace="5" border="0"><c:out value="${failure}"/></td> </tr> </table>  </td>  </tr>
  </c:if>

  <c:if test="${!empty unauthorized}"> <tr>
    <td height="20" align="center"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr> <td width="20%"></td>
      <td width="80%" class="errorText"><img src="/webclient/common/images/info_icon.gif" hspace="5" border="0"><c:out value="${unauthorized}"/></td> </tr> </table> </td>  </tr>
</c:if>

</table>
  <table width="90%" border="0" cellspacing="0" cellpadding="3">
    <tr>
      <td nowrap class="text">
        <c:if test="${addUser == 'true'}"> <input type="button" name="Button" class="button" value="<fmt:message key='webclient.admin.adminpanel.adduser'/>" onclick="javascript:addUser()"> 
    <input type="button" name="Button" class="button" value="<fmt:message key='webclient.admin.useradmin.addmultiple'/>" onclick="javascript:addMultipleUser()"> </c:if>   
      <c:if test="${setUserProfile == 'true'}"> <input type="button" name="changeStatus" id="changeStatus" class="button" value="<fmt:message key='webclient.admin.useradmin.changestatus'/>" onClick="show(this)"> </c:if> 
         <c:if test="${removeUser == 'true'}">
      <input type="button" name="Submit2" class="button" onclick="javascript:deleteUserList()"  value="<fmt:message key='webclient.admin.useradmin.delete'/>"> </c:if> 
    <%--    <input type="button" name="Button" class="button" value="Assign to Group"> --%>
      </td>
      <td nowrap class="text"><div align="right"><fmt:message key='webclient.admin.useradmin.view'/>
          <select name="select" onchange="showSelectedUser(this.options[this.selectedIndex].value);">
             <c:forEach var="uName" items="${userType}"> 
    <option value='<c:out value="${uName}"/>' <c:if test="${uName==selectedType}"> selected </c:if>> 
   <fmt:message key="${uName}"/> </option> </c:forEach>

          </select>
        </div></td>
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
  <table  id="UserAdminView" width="100%" border="0" cellspacing="0" cellpadding="2" class="htableBorder">
    <tr class="tableHeaders">
      <td width="25" > 
         <c:if test="${removeFromGroup == 'true' && setUserProfile == 'true'}">
       <input name = "toggleAll"  type = "checkbox" onclick = "javascript:ToggleAll(this,this.form)"></c:if> 
        </td>
      <td width="40" nowrap></td>
      <td width="25%" nowrap ><a href="#" onclick="ts_resortTable(this);return false;">
    <span class="whiteBoldText"><fmt:message key='webclient.admin.useradmin.username'/></span></a></td>
      <td width="35%" nowrap> <a href="#" onclick="ts_resortTable(this);return false;">
        <span class="whiteBoldText"> <fmt:message key='webclient.admin.useradmin.group'/></span></a> </td>

      <td width="10%" nowrap><a href="#" onclick="ts_resortTable(this);return false;">
       <span class="whiteBoldText"> <fmt:message key='webclient.admin.useradmin.status'/></span></a></td>  
      <td width="10%" nowrap> <a href="#" onclick="ts_resortTable(this);return false;">
        <span class="whiteBoldText"><fmt:message key='webclient.admin.useradmin.active'/></span></a></td>
     <c:if test="${assingToGroup == 'true' && removeFromGroup == 'true'}">
      <td width="13%" nowrap > <a href="#" onclick="ts_resortTable(this);return false;">
        <span class="whiteBoldText"><fmt:message key='webclient.admin.useradmin.assign'/></span></a></td> </c:if> 
          <c:if test="${setOperations == 'true'}">
      <td width="17%" nowrap > <a href="#" onclick="ts_resortTable(this);return false;">
        <span class="whiteBoldText"><fmt:message key='webclient.admin.useradmin.operationinfo'/></span></a></td> </c:if> 
    </tr>

     <c:forEach var="list" items="${userGroup}">
	    <tr valign="top">
	    <td valign="top" ><div align="center">  
        <c:if test="${removeFromGroup == 'true' && setUserProfile == 'true'}">
           <input name="rowSelection"  type="checkbox" value="<c:out value='${list.userName}'/>" onclick = "javascript:Toggle(this,this.form,event)"></c:if> 
        </div></td>
        <td valign="top" nowrap> 
     <c:if test="${removeUser == 'true'}">
        <a href="javascript:deleteUser('<c:out value="${list.userName}"/>')" title="<fmt:message key="webclient.admin.useradmin.deluser"/>" ><img src="/webclient/common/images/deleteicon.gif" width="13" height="15" alt="<fmt:message key="webclient.admin.useradmin.deluser"/>" border="0" align="absmiddle"></a> </c:if> 
        <c:if test="${setUserProfile == 'true'}">
          &nbsp;<a href="/admin/InvokeModifyUserProfileForm.do?selectedTab=admin&selectedNode=useradmin&editMode=true&userName=<c:out value='${list.userName}'/>" title="<fmt:message key="webclient.admin.useradmin.edituser"/>" ><img src="/webclient/common/images/edit1.gif" alt="<fmt:message key="webclient.admin.useradmin.edituser"/>" border="0" align="absmiddle"></a>
        </c:if></td>

	    <td  valign="top">       
	    <a class="text" href ="/admin/InvokeModifyUserProfileForm.do?selectedTab=admin&selectedNode=useradmin&editMode=false&userName=<c:out value='${list.userName}'/>"><c:out value="${list.userName}"/></a></td>
	    <td class="text" valign="top">
	    <c:out value="${list.groupNames}"/>   </td>
	    <td valign="middle" >
         <c:choose>
	    <c:when test="${list.status eq 'enabled'}">
	    <div align="center"><a style="text" title="<fmt:message key="webclient.admin.useradmin.enabled"/>" ><img src="/webclient/common/images/enabled.gif" alt="<fmt:message key="webclient.admin.useradmin.enabled"/>" border="0"></a></div>
	    </c:when>
	    <c:otherwise>
	    <div align="center"><a style="text" title="<fmt:message key="webclient.admin.useradmin.disabled"/>"><img src="/webclient/common/images/disabled.gif" alt="<fmt:message key="webclient.admin.useradmin.disabled"/>" border="0"></a></div>
	    </c:otherwise>
	    </c:choose> </td> 
         <td valign="middle" >
	    <c:choose>
	    <c:when test="${list.isActive}">
	    <div align="center"><a style="text" title="<fmt:message key="webclient.admin.useradmin.acttitle"/>" ><img src="/webclient/common/images/alive.gif" alt="<fmt:message key="webclient.admin.useradmin.acttitle"/>" border="0"></a></div>
	    </c:when>
	    <c:otherwise>
	    <div align="center"><a style="text" title="<fmt:message key="webclient.admin.useradmin.inactive"/>"><img src="/webclient/common/images/dead.gif" alt="<fmt:message key="webclient.admin.useradmin.inactive"/>" border="0"></a></div>
	    </c:otherwise>
	    </c:choose> </td> 
    <c:if test="${assingToGroup == 'true' && removeFromGroup == 'true'}">
        <td nowrap ><div align="center">
                <a style="text" href="javascript:assignGroup('<c:out value="${list.userName}"/>')" title="<fmt:message key="webclient.admin.useradmin.assignto"/>" ><img src="/webclient/common/images/mib_entry.gif" width="15" height="15" hspace="4" alt="<fmt:message key="webclient.admin.useradmin.assignto"/>" border="0" align="absmiddle"> 
       </a></div></td> </c:if>
         <c:if test="${setOperations == 'true'}">
           <td nowrap ><div align="center"><a style="text" href="javascript:assignedOperation('<c:out value="${list.userName}"/>')" title="<fmt:message key="webclient.admin.useradmin.operation"/>" ><img src="/webclient/common/images/operation_small.gif" alt="<fmt:message key="webclient.admin.useradmin.operation"/>" hspace="4" border="0" align="absmiddle"> </a></div></td></c:if>           
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

<div id="status" class="dropDownLayer" style="position:absolute;top:-1000px;left:-1000px;">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="22"><a href="javascript:setStatus('enabled')" class="textSmall"><img src="/webclient/common/images/enabled.gif" hspace="3" alt="Set as Active" border="0" align="absmiddle"><fmt:message key='webclient.admin.useradmin.enable'/></a></td>
  </tr>
   <tr>
    <td height="22"><a href="javascript:setStatus('disabled')" class="textSmall"><img src="/webclient/common/images/disabled.gif" hspace="3" alt="Set as Active" border="0" align="absmiddle"><fmt:message key='webclient.admin.useradmin.disable'/></a></td>
  </tr>
</table>
</div>
</form>



<script src="general.js"></script>
<script>
var view=getObj("status")
var currobjid=""
function show(obj) {
	view.style.display=""
	view.style.width=obj.offsetWidth
	view.style.top=(findPosY(obj)+obj.offsetHeight)+"px"
	if (findPosX(obj)+view.offsetWidth>window.screen.width)
		view.style.left=((findPosX(obj)+obj.offsetWidth)-view.offsetWidth)+"px"
	else
		view.style.left=(findPosX(obj))+"px"
	currobjid=obj.id
}
function hide(ev) {
	if (browser_ie)
		currobj=window.event.srcElement
	else if (browser_nn4 || browser_nn6)
		currobj=ev.target

	if (currobj.id!=currobjid && view.style.top!="-1000px") {
		view.style.width="0px"
		view.style.display="none"
		view.style.top=view.style.left="-1000px"
	}
}
document.onclick=hide;
</script>
