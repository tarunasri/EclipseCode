<%-- $Id: groupAdmin.jsp,v 1.3 2010/10/29 13:46:54 swaminathap Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">


<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script language="javascript" src="/webclient/common/js/general.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listrowselection.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listview.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/sorttable.js"></SCRIPT>
<script>

function addGroup()
{
    height = "580";
    width = "450";
    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width + ',scrollbars=yes,resizable=yes,directories=no,menubar=no,toolbar=no';

    url = "/admin/OperationsView.do?selectedTab=admin&selectedNode=groupadmin&Operation=AddGroup";

    custwindow = window.open(url,"OperationTree",windowParams);
    custwindow.opener = window;    
    navapp = navigator.appVersion;
	if(navapp.indexOf("MSIE")== -1)
	{
		custwindow.focus();
	}
	//alert("Inisde Alert");
    //location.href='/admin/AddGroupForm.do?selectedTab=admin&selectedNode=groupadmin';
}

function deleteGroup(delGroupName)
{
    var con = confirm('<fmt:message key="webclient.admin.groupadmin.delconfirm"/>');
    if ( con != true)
    {
        return;
    }
    location.href="/admin/RemoveGroup.do?selectedTab=admin&selectedNode=groupadmin&groupName="+delGroupName;
}


function getSelectedGroup()
{
    	var listViewForm = document.listView;
	var len = listViewForm.elements.length;
	var selectedGroups = '';
	for ( var i=0; i < len; i++)
	{
		formElement = listViewForm.elements[i];
		if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
		{
			if(selectedGroups == '')
			{
				selectedGroups = formElement.value;
			}
			else
			{
				selectedGroups += ',' + formElement.value;
			}
		}
	}
	return selectedGroups;
}


function deleteGroupList()
{
     	delURL = '/admin/RemoveGroup.do?selectedTab=admin&selectedNode=groupadmin';

	var selectedGroups = getSelectedGroup();

	if(selectedGroups == '')
	{
    	alert('<fmt:message key="webclient.admin.groupadmin.selecterr"/>');
		return;
	}
   	var con = confirm('<fmt:message key="webclient.admin.groupadmin.delconfirm"/>');
    	if ( con != true)
    	{
    		return;
    	}
    	url = delURL + "&selectedGroups=" + selectedGroups;
    	location.href=url;
}


/*
function showSelectedGroup(selectedType)
{
    showURL= '/admin/GroupAdmin.do?selectedTab=admin&selectedNode=groupadmin';
    url = showURL + "&selectedType=" +  selectedType;
    location.href=url;
}

*/

</script>

<body>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.groupadmin.header'/></h1></td>
		<td align="right"></td>
        </tr>
        </table>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <c:if test="${!empty success}"> <tr>
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

<form name="listView">

<table width="100%" border="0" cellspacing="0" cellpadding="3">
  <tr>
    <td nowrap class="text">  <c:if test="${addGroup == 'true'}">
        <input type="button" name="Submit" class="button" value="<fmt:message key='webclient.admin.groupadmin.addgroup'/>" onClick="javascript:addGroup()"></c:if>
    <c:if test="${removeGroup == 'true'}"> 
      <input type="button" name="Submit" class="button" value="<fmt:message key='webclient.admin.groupadmin.deletegroup'/>" onClick="javascript:deleteGroupList()"  > </c:if> </td>
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

<table id="GroupAdminView" width="100%" border="0" cellspacing="0" cellpadding="2" class="htableBorder">
  <tr class="tableHeaders">   <c:if test="${removeGroup == 'true'}"> 
    <td width="25" height="22"> 
     <input name = "toggleAll" type = "checkbox" onclick = "javascript:ToggleAll(this,this.form)">
    </td></c:if>
    <td width="40" >
      </td>
    <td ><a href="#" onClick="ts_resortTable(this);return false;">
          <span class="whiteBoldText"><fmt:message key='webclient.admin.groupadmin.gname'/></span></a></td>
    <td ><a href="#" onClick="ts_resortTable(this);return false;"> 
          <span class="whiteBoldText"><fmt:message key='webclient.admin.groupadmin.userlist'/></span></a></td>
    <td ><a href="#" onClick="ts_resortTable(this);return false;"> 
          <span class="whiteBoldText"><fmt:message key='webclient.admin.groupadmin.operations'/></span></a></td>
  </tr>


    <c:forEach var="list" items="${groupUsers}">
       <tr valign="top">
       <td valign="top"> <c:if test="${removeGroup == 'true'}"> 
        <input name="rowSelection"  type="checkbox" value="<c:out value='${list.groupName}'/>" onclick = "javascript:Toggle(this,this.form,event)">
     </td>
      <td nowrap> <div align="center"><a href="javascript:deleteGroup('<c:out value="${list.groupName}"/>')"><img src="/webclient/common/images/deleteicon.gif" width="13" height="15" title="Delete" alt="Delete" border="0" align="absmiddle"></a> </c:if>
        &nbsp;<a href="/admin/GroupProfileForm.do?selectedTab=admin&selectedNode=groupadmin&groupName=<c:out value='${list.groupName}'/>"><img src="/webclient/common/images/edit1.gif" alt="Edit" border="0" align="absmiddle"></a></div></td>
       <td width="30%" valign="top"> <a class="text" href ="/admin/GroupProfileForm.do?selectedTab=admin&selectedNode=groupadmin&groupName=<c:out value='${list.groupName}'/>"> <c:out value="${list.groupName}"/> </a> </td>
       <td width="35%" class="text" valign="top">
       <c:out value="${list.userNames}"/>  </td>
         <td nowrap ><a class="text" href="javascript:openWindow('/admin/OperationsView.do?selectedTab=admin&selectedNode=groupadmin&groupName=<c:out value='${list.groupName}'/>','OperationTree','450','580',',scrollbars=yes,resizable=yes,directories=no,menubar=no,toolbar=no')"><img src="/webclient/common/images/operation_small.gif" hspace="4" border="0" align="absmiddle"><span > <fmt:message key='Assigned Operations'/> </span> </a></td>
     
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
</form>

</body>
</html>
