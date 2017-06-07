<%-- $Id : $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.admin.groupadmin.header'/></title>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> --%>

<script language="javascript" src="/webclient/common/js/general.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listrowselection.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/common/js/listview.js"></SCRIPT>


<script type="text/javascript" language="JavaScript">

function assignGroupOperation(groupName)
{
    height = "580";
    width = "450";
    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width + ',scrollbars=yes,resizable=no,directories=no,menubar=no,toolbar=no';

    url = "/admin/OperationsView.do?selectedTab=admin&selectedNode=groupadmin&groupName=" + groupName;
    //scopeURL=url + "&groupName=" + groupName + "&customView=" + customView;

    custwindow = window.open(url,"OperationTree",windowParams);
    custwindow.opener = window;    
    navapp = navigator.appVersion;
	if(navapp.indexOf("MSIE")== -1)
	{
		custwindow.focus();
	}
}


function assignAuthScope()
{
    height = "270";
    width = "450";

    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width;
    //if (parms) { winParms += "," + parms; }

    var groupName = document.ModifyGroup.groupName.value;
    var customView = document.ModifyGroup.selectedCVS.value;
    url = "/admin/AssignAuthScope.do?selectedTab=admin&selectedNode=groupadmin&toPerform=showAuthScopeList";
    scopeURL=url + "&groupName=" + groupName + "&customView=" + customView;

    custwindow = window.open(scopeURL,"AssignAuthScope",windowParams);
    custwindow.opener = window;    
    navapp = navigator.appVersion;
	if(navapp.indexOf("MSIE")== -1)
	{
		custwindow.focus();
	}
}

function assignUser()
{
    height = "270";
    width = "450";

    var left = Math.floor( (screen.width - width) / 2);
    var top = Math.floor( (screen.height - height) / 2);
    var windowParams = "top=" + top + ",left=" + left + ",height=" + height + ",width=" + width;
    //if (parms) { winParms += "," + parms; }

    //var groupName = '<c:out value="${groupName}"/>';
    var groupName = document.ModifyGroup.groupName.value;   
    url = "/admin/AssignUsers.do?selectedTab=admin&selectedNode=groupadmin&toPerform=showUserList&groupName=" + groupName;
    custwindow = window.open(url,"AssignGroup",windowParams);
    custwindow.opener = window;    
    navapp = navigator.appVersion;
	if(navapp.indexOf("MSIE")== -1)
	{
		custwindow.focus();
	}
}

function getSelectedOperation()
{
    var listViewForm = document.listView1;
	var len = listViewForm.elements.length;
	var selectedUsers = '';
	for ( var i=0; i < len; i++)
		{
			formElement = listViewForm.elements[i];
			if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
			{
                selectedUsers = formElement.value;
                break;
			}
		}
    return selectedUsers;
	
}
function getSelectedCVS()
{
    var listViewForm = document.listView;
	var len = listViewForm.elements.length;
	var selected = '';
	for ( var i=0; i < len; i++)
		{
			formElement = listViewForm.elements[i];
			if (formElement.type == "checkbox" && formElement.name == 'rowSelection' && formElement.checked == true)
			{
                if(selected == '')
                {
                    selected = formElement.value;
                }
                else
                {
                    selected += ',' + formElement.value;
                }
			}
		}
    return selected;
	
}

function addNewCVScope()
{
    groupName = document.ModifyGroup.groupName.value;
    customView = document.ModifyGroup.selectedCVS.value; 
   
    showURL = "/admin/CustomViewScope.do?selectedTab=admin&selectedNode=groupadmin&toPerform=customViewForm";
    url =  showURL + "&groupName="+groupName + "&customView="+customView;
    location.href=url;
}

function showCVScope(cvsName)
{
    groupName = document.ModifyGroup.groupName.value;
    customView = document.ModifyGroup.selectedCVS.value;

    showURL = "/admin/CustomViewScope.do?selectedTab=admin&selectedNode=groupadmin&toPerform=showCustomView";
    url =  showURL + "&groupName="+groupName + "&customView="+customView + "&cvsName="+cvsName;
    location.href=url;
}

function removeSelectedCVS()
{
    selectedCVSList = getSelectedCVS();
    if(selectedCVSList == '')
    {
        alert('<fmt:message key="webclient.admin.modifygroup.cvsnotselected"/>');
		return;
    }

    groupName = document.ModifyGroup.groupName.value;
    customView = document.ModifyGroup.selectedCVS.value;

    showURL = "/admin/CustomViewScope.do?selectedTab=admin&selectedNode=groupadmin&toPerform=removeCustomView";
    url =  showURL + "&groupName="+groupName + "&customView="+customView + "&selectedCVSList="+selectedCVSList;
    location.href=url;
}



function removeCVScope(cvsName)
{
    groupName = document.ModifyGroup.groupName.value;
    customView = document.ModifyGroup.selectedCVS.value;

    showURL = "/admin/CustomViewScope.do?selectedTab=admin&selectedNode=groupadmin&toPerform=removeCustomView";
    url =  showURL + "&groupName="+groupName + "&customView="+customView + "&cvsName="+cvsName;
    location.href=url;
}



function showScopeSettingForOperation(operationName)
{
    groupName = document.ModifyGroup.groupName.value;
    /*
    operationName = getSelectedOperation();
    if(operationName == '')
    {
        alert('<fmt:message key="webclient.admin.modifygroup.configop"/>');
		return;
    }
    */

    showURL = "/admin/CustomViewScope.do?selectedTab=admin&selectedNode=groupadmin&toPerform=showCVS";
    url =  showURL + "&groupName="+groupName + "&operationName="+operationName;
    location.href=url;
}

function showSelectedCVS(selectedCVS)
{
    groupName = document.ModifyGroup.groupName.value;
    showURL= '/admin/GroupProfileForm.do?selectedTab=admin&selectedNode=groupadmin';
    url = showURL + "&selectedCVS=" +  selectedCVS + "&groupName=" + groupName;
    location.href=url;
}

function toggleView(id) {
	var listTableObj=getObj(id)
	var toggleImageObj=getObj(id+"_img")

	if (listTableObj.style.display=="block") {
		listTableObj.style.display="none"
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/expand.gif"
	} else {
		listTableObj.style.display="block"
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/collapse.gif"
	}
	set_cookie(id,listTableObj.style.display)
}
</script>
</head>

<body>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.modifygroup.header'> <fmt:param value="${groupName}"/> </fmt:message></h1></td>
		<td align="right"></td>
        </tr>
        </table>

 	 <c:if test="${!empty failure}">
 	 <table width="70%" border="0" cellspacing="0" cellpadding="0">
 	 <tr>
 	 <TD class=tableheader-bg vAlign=center align="center" height=28>
 	 <TABLE cellSpacing=0 cellPadding=0 width="60%" border=0>
 	 <TBODY><tr>
 	 <TD width=10></TD>
 	 <TD nowrap class="errorText"><c:out value="${failure}"/></TD>
 	 </TR></TBODY>
 	 </TABLE></TD>
 	 </TR>
 	 </table>
 	 </c:if>

<form name="ModifyGroup">

<input type="hidden" name="groupName" value="<c:out value='${groupName}'/>" />
<input type="hidden" name="selectedCVS" value="<c:out value='${selectedCVS}'/>" />

</form>
<%--
<table width="100%" border="0" cellspacing="1" cellpadding="3" class="htableBorder">
  <tr>
    <td colspan="2" class="header2bg text"><strong><fmt:message key='Group Information'/> :</strong></td>
  </tr>
  <tr>
    <td width="15%" class="odd text"> <div align="right">Group Name:</div></td>
    <td width="85%" class="text"><strong>Admin</strong></td>
  </tr>
  <tr>
    <td class="odd text"><div align="right">Created On:</div></td>
    <td class="text"><strong>20/07/2005 18:00</strong> by <strong>root</strong></td>
  </tr>
  <tr>
    <td class="odd text"><div align="right">Last Updated On:</div></td>
    <td class="text"><strong>-</strong></td>
  </tr>
</table>
--%>

<a name="bk_users" id="bk_users"></a>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="13"> <a href="javascript:toggleView('users');"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/collapse.gif" border="0" align="absmiddle" id="users_img"></a></td>
    <td height="22" > <a class="text" href="javascript:toggleView('users');" style="text-decoration:none"><strong><fmt:message key='webclient.admin.modifygroup.members'/></strong></a>
    </td>
  </tr>
  <tr>
  	<td></td>
  	<td class="hline" height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div id="users" style="display:none">

	<table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td nowrap class="text"> 
              <input type="button" name="Button11" class="button" value="<fmt:message key='webclient.admin.modifygroup.assignuser'/>" onclick="javascript:assignUser()" >
           <%--   <input type="button" name="Button12" class="button" value="<fmt:message key='Remove'/>"> --%>
            </td>   <td nowrap class="text">&nbsp;</td>
    </tr>
  </table>
<table style="margin-bottom:10px;" width="90%" border="0" cellpadding="0" cellspacing="0">
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
          <td width="10" class="tableHeaders"> <%-- <div align="center">
              <input type="checkbox" name="checkbox" value="checkbox">
            </div> --%> </td>
          <td width="20" class="tableHeaders"> <div align="center"></div></td>
          <td width="191" class="tableHeaders"><a class="boldWhiteText" ><fmt:message key='webclient.admin.modifygroup.name'/></a></td>
          <td width="69" class="tableHeaders"> <div align="center"><a class="boldWhiteText" ><fmt:message key='webclient.admin.modifygroup.status'/></a></div></td>
          <td width="635" class="tableHeaders">&nbsp;</td>
        </tr>
       <c:choose>
        <c:when test="${!empty usersList}">
	   <c:forEach var="list" items="${usersList}" varStatus="status" >
		<tr height="22" <c:choose>
                <c:when test="${status.count%2==1}">
                class="reportsEvenRow"  </c:when>
                <c:otherwise>class="reportsOddRow" </c:otherwise> </c:choose> >
		          <td> <%-- <div align="center">
		              <input type="checkbox" name="checkbox2" value="checkbox">
		            </div> --%> </td>
		          <td nowrap> <div align="center"><img src="/webclient/common/images/user_small.gif" alt="Remove" border="0" align="absmiddle">
		            </div></td>
		          <td ><a class="text" href="/admin/InvokeModifyUserProfileForm.do?selectedTab=admin&selectedNode=groupadmin&userName=<c:out value='${list.userName}'/>"><c:out value="${list.userName}"/></a></td>
		          <td class="text"><div align="center">
  <c:choose>
	    <c:when test="${list.isActive}">
	    <div align="center"><a class="text" title="<fmt:message key="webclient.admin.useradmin.acttitle"/>" ><img src="/webclient/common/images/alive.gif" alt="<fmt:message key="webclient.admin.useradmin.acttitle"/>" border="0"></a></div>
	    </c:when>
	    <c:otherwise>
	    <div align="center"><a class="text" title="<fmt:message key="webclient.admin.useradmin.inactive"/>"><img src="/webclient/common/images/dead.gif" alt="<fmt:message key="webclient.admin.useradmin.inactive"/>" border="0"></a></div>
	    </c:otherwise>
	    </c:choose>
<%-- <img src="/webclient/common/images/enabled.gif" alt="Active" width="10" height="10" border="0"> --%> </div></td>
		          <td class="text">&nbsp;</td>
        </tr>
    </c:forEach>
     </c:when>
        <c:otherwise>
         <tr class="reportsEvenRow"> <td >&nbsp;</td>
		    <td class="text" nowrap colspan="3">
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
<a name="bk_operations" id="bk_operations"></a>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="13"> <a href="javascript:toggleView('operations');"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/collapse.gif" border="0" align="absmiddle" id="operations_img"></a></td>
    <td height="22" > <a class="text" href="javascript:toggleView('operations');" style="text-decoration:none"><strong><fmt:message key='webclient.admin.modifygroup.osetting'/></strong></a> </td>
  </tr>
  <tr>
  	<td></td>
  	<td class="hline" height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>

<form name="listView1">
  <tr>
    <td>&nbsp;</td>
    <td><div id="operations" style="display:none">
		<table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td nowrap class="text"> 
          <%--    <input type="button" name="Button21" class="button" value="<fmt:message key=''/>" onClick="javascript:showScopeSettingForOperation()"> --%>
              <input type="button" name="Button22" class="button" value="<fmt:message key='webclient.admin.modifygroup.oconfig'/>" onClick="javascript:assignGroupOperation('<c:out value='${groupName}'/>')"> 
            </td>      <td nowrap class="text">&nbsp;</td>
    </tr>
  </table>
 <table style="margin-bottom:10px;" width="90%" border="0" cellpadding="0" cellspacing="0">
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
       <td width="10" >  <%--  <div align="center">
              <input name = "toggleAll" type = "checkbox" onclick = "javascript:ToggleAll(this,this.form)">
            </div> --%> </td> 
          <td width="20" height="25" class="tableHeaders"> <div align="center"></div></td>
          <td width="200" class="boldWhiteText"><fmt:message key='webclient.admin.modifygroup.oname'/></td>
         <td class="boldWhiteText"><fmt:message key='webclient.admin.modifygroup.otype'/></td>
         <td class="boldWhiteText"><fmt:message key='webclient.admin.modifygroup.scopeset'/></td>
         <td class="boldWhiteText" width="30%">&nbsp; </td>
        </tr>

        <c:choose>
        <c:when test="${!empty AuthOperation}">
		  <c:forEach var="operationlist" items="${AuthOperation}" varStatus="status">
		  <tr height="22" <c:choose>
                <c:when test="${status.count%2==1}">
                class="reportsEvenRow"  </c:when>
                <c:otherwise>class="reportsOddRow" </c:otherwise> </c:choose> >
		          <td> <%-- <div align="center">
                     <input name="rowSelection" type="checkbox" value="<c:out value='${operationlist.key}'/>" 
                    <c:if test="${ operationlist.value ne 'included'}"> disabled="true"
                    </c:if>   
                onclick = "javascript:ToggleThis(this,this.form)">
		            </div> --%> </td>
		          <td nowrap> <div align="center"><img src="/webclient/common/images/operation_small.gif" alt="Remove" border="0" align="absmiddle">
		            </div></td>
		          <td class="text"><c:out value="${operationlist.key}"/></td>
		          <td class="text">
                <c:choose><c:when test="${operationlist.value eq 'included'}" >
                    <img src="/webclient/common/images/operation.gif" hspace="4" border="0" align="absmiddle">
                </c:when>
                <c:otherwise>
                     <img src="/webclient/common/images/operations_exluded.gif" hspace="4" border="0" align="absmiddle">
                </c:otherwise>
                </c:choose>
                <c:out value="${operationlist.value}"/> </td>
                 <td>
                 <c:choose><c:when test="${operationlist.value eq 'included'}" >
                    <a class="text" href="javascript:showScopeSettingForOperation('<c:out value="${operationlist.key}"/>')"><img src="/webclient/common/images/edit1.gif" title="<fmt:message key='webclient.admin.modifygroup.editscope'/>" alt="<fmt:message key='webclient.admin.modifygroup.editscope'/>" border="0" align="absmiddle"></a>
                </c:when>
                <c:otherwise>
                    <img src="/webclient/common/images/edit1_disabled.gif" title="<fmt:message key='webclient.admin.modifygroup.editscope'/>" alt="<fmt:message key='webclient.admin.modifygroup.editscope'/>" border="0" align="absmiddle">
                </c:otherwise>
                </c:choose>
                </td>
               
                <td class="text">&nbsp; </td>
         </tr>
         </c:forEach>
         </c:when>
        <c:otherwise>
         <tr class="reportsEvenRow"> <td >&nbsp;</td>
		    <td class="text" nowrap colspan="4">
                <fmt:message key='webclient.admin.nodata.available'/>
            </td>
        </tr>
        </c:otherwise>
        </c:choose> 

        <%--
        <tr class="reportsEvenRow">
          <td><div align="center">
              <input type="checkbox" name="checkbox22" value="checkbox">
            </div></td>
          <td nowrap> <div align="center"><a href="#"><img src="/webclient/common/images/delete.gif" alt="Remove" border="0" align="absmiddle"></a>
            </div></td>
          <td class="text"><a href="#">Map Editing Operations</a></td>
          <td class="text">included</td>
        </tr>
		--%>

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

</form>

<form name="listView">
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="13"> <a href="javascript:toggleView('cvscope');"><img src="/webclient/common/images/<c:out value = "${selectedskin}"/>/collapse.gif" border="0" align="absmiddle" id="cvscope_img"></a></td>
    <td height="22" > <a class="text" href="javascript:toggleView('cvscope');" style="text-decoration:none"><strong><fmt:message key='webclient.admin.modifygroup.cvsheader'/></strong></a> </td>
  </tr>
  <tr>
  	<td></td>
  	<td class="hline" height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><div id="cvscope" style="display:none">
		<table width="100%" border="0" cellspacing="0" cellpadding="2">
          <tr>
            <td nowrap class="text"><fmt:message key='webclient.admin.modifygroup.scopelabel'/>
              <select name="select" onchange="showSelectedCVS(this.options[this.selectedIndex].value);">

                 <c:forEach var="authCV" items="${authCustomView}"> 
    <option value='<c:out value="${authCV}"/>' <c:if test="${authCV==selectedCVS}"> selected </c:if>> 
   <c:out value="${authCV}"/></option> </c:forEach>

              </select>
              <input type="button" name="Button31" class="button" value="<fmt:message key='webclient.admin.modifygroup.addcvs'/>" onClick="javascript:addNewCVScope()">
              <input type="button" name="Submit32" class="button" value="<fmt:message key='webclient.admin.modifygroup.assigncvs'/>" onclick="javascript:assignAuthScope()">
              <input type="button" name="Button33" class="button" value="<fmt:message key='webclient.admin.modifygroup.delcvs'/>" onclick="javascript:removeSelectedCVS()" >
            </td>      <td nowrap class="text">&nbsp;</td>
    </tr>
  </table>
 <table style="margin-bottom:10px;" width="90%" border="0" cellpadding="0" cellspacing="0">
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
            <td height="22"  class="tableHeaders"> 
          <c:if test="${!empty cvsForView}" >
            <input name="toggleAll"  type="checkbox" onclick="javascript:ToggleAll(this,this.form)"> </c:if>
             <%--   <input type="checkbox" name="toggleAll" onclick = "javascript:ToggleAll(this,this.form)"> --%>
             </td>
            <td class="tableHeaders"></div></td>
            <td  width="99%" class="boldWhiteText"><fmt:message key='webclient.admin.modifygroup.authscope'/></td>
          </tr>
        <c:choose>
        <c:when test="${!empty cvsForView}" >
          <c:forEach var="authCVScope" items="${cvsForView}">
          <tr class="reportsEvenRow">
		              <td width=20 >
    <input name="rowSelection"  type="checkbox" value="<c:out value="${authCVScope}"/>" onclick = "javascript:Toggle(this,this.form,event)">
		            <%--      <input type="checkbox" name="rowselection" value="<c:out value="${authCVScope}"/>" onclick = "javascript:Toggle(this,this.form)"> --%>
		              </td>
		              <td width=20 nowrap> <a href="javascript:removeCVScope('<c:out value="${authCVScope}"/>')"><img src="/webclient/common/images/deleteicon.gif" width="13" height="15" alt="Remove" border="0" align="absmiddle"></a>
		               </td>
		              <td ><a class="text" href="javascript:showCVScope('<c:out value="${authCVScope}"/>')"><c:out value="${authCVScope}"/></a></td>
          </tr>
        </c:forEach> 
        </c:when>
        <c:otherwise>
         <tr><td><img src="/webclient/common/images/trans.gif" height="1" width="10"></td>
		    <td class="text" nowrap colspan="2">
                <fmt:message key='webclient.admin.nodata.available'/>
            </td>
        </tr>
        </c:otherwise>
        </c:choose> 

          <%--
          <tr class="reportsEvenRow">
            <td><div align="center">
                <input type="checkbox" name="checkbox222" value="checkbox">
              </div></td>
            <td nowrap> <div align="center"><a href="#"><img src="/webclient/common/images/delete.gif" alt="Remove" border="0" align="absmiddle"></a>
              </div></td>
            <td class="text"><a href="#">Scope 1</a></td>
          </tr>
			--%>
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
</form>


</body>
</html>
<script type="text/javascript" language="JavaScript">
var RLArray=Array("users","operations","cvscope")
for (var i=0;i<RLArray.length;i++) {
	var listObj=getObj(RLArray[i])
	var toggleImageObj=getObj(RLArray[i]+"_img")
	var status = get_cookie(RLArray[i])

	if (status=="none" || status==null || status=="undefined") {
		listObj.style.display="none"
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/expand.gif"
	} else {
		listObj.style.display="block"
		toggleImageObj.src="/webclient/common/images/<c:out value = "${selectedskin}"/>/collapse.gif"
	}
}
</script>
