<%-- $Id: AddMultiUser.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/admin/jspf/discoveryConfiguration.jspf" %>

<script type="text/javascript" language="JavaScript" src="/webclient/common/js/general.js"></script>
<script type="text/javascript" language="JavaScript" src="/webclient/admin/js/AddUserFunctions.js"></script>
</head>


<body>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.addmultiple.header'/></h1></td>
		<td align="left"></td>
        </tr>
        </table>

<form action="/admin/AddMultiUserForm.do" method="post" onSubmit="return configureGroup(this)">

<input type=hidden name="toPerform" value="<c:out value="${toPerform}"/>" />  

  <div class="text"><fmt:message key='webclient.admin.addmultiple.count'/></div>

 <table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >

  <table id="userTable" width="100%" border="0" cellspacing="0" cellpadding="2" class="htableBorder">
    <tr class="header2bg"> 
      <td width="10%" height="25" nowrap class="text">&nbsp;</td>
      <td width="35%" nowrap class="text"><strong> <fmt:message key='webclient.admin.addmultiple.username'/></strong></td>
      <td nowrap class="text"><strong> <fmt:message key='webclient.admin.addmultiple.selgroup'/></strong></td>
        <td height="25" nowrap class="text">&nbsp;</td>
    </tr>
    
   
      <c:forEach begin="0" end="${11}" varStatus="status"> 
      
      <tr valign="top"> 
            <td nowrap class="text"> <div align="center"><fmt:message key='webclient.admin.addmultiple.usercount'/> <c:out value="${status.count}"/>:</div></td>
            <td><input name="userNameList" id="username" type="text" class="formStyle"></td>
            <td height="45" nowrap class="text">
				<select style="height:auto;" name="GroupList" multiple size="2" <c:if test="${status.count eq 1}"> 
					onChange="javascript:selectAll(getObj('selectall').checked,this);"
				</c:if>>
            	<c:forEach var="groupName" items="${groupVector}" varStatus="status1">
                <option value="<c:out value='${groupName}'/>" > <c:out value="${groupName}"/> </option>
                 </c:forEach> 
              </select></td>
            <td nowrap>
              	<c:if test="${status.count eq 1}" >
              <input id="selectall" name="selectall" type="checkbox" onClick="javascript:selectAll(this.checked,getObj('GroupList')[0]);">   <fmt:message key='webclient.admin.addmultiple.setgroup'/>   </c:if> </td>
    </tr>
                <input type="hidden" name="NewGroups" />
            
       </c:forEach> 
    
   
  </table> 
<br>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
    <td class="text"><div align="center">
        <input type="submit" name="Button3" value="<fmt:message key='webclient.admin.addmultiple.save'/>" class="button">
        <input type="button" name="Button22" onClick="javascript:cancel()" value="<fmt:message key='webclient.common.reset.button'/>" class="button">
	<input name="CancelButton" type="button" class="button" onclick="javascript:userconfiguration()" value="<fmt:message key='webclient.admin.addmultiple.cancel'/>">

</td>
  </tr>
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
      </div>
</form>
</body>
</html>

<script>
function configureGroup(form)
{

    var groupList = getObj("GroupList");
    var groupLength = groupList.length;
    var userList = getObj("userNameList");
    var userLength = userList.length;
    var selectedUsers  = "";
    var lastValidUserNameIndex;
    var emptyUserList ="";
    
    //  Added to check whether any user name is left empty  in between text fields. 
    for(var i=0;i<userList.length;i++)
    {
    
	if(!userList[i].value=="")
	{
		lastValidUserNameIndex = i;
	}
    }
    	for(var i=0;i<lastValidUserNameIndex;i++)
    	{
		if(userList[i].value=="")
		{
			emptyUserList   = emptyUserList + "User "+(i+1)+", ";
		}
	}

	if(emptyUserList!="")
	{
		emptyUserList = emptyUserList.substring(0,emptyUserList.length-2);
		alert("<fmt:message key='webclient.admin.addmultiple.emptyField'/> "+emptyUserList);
		return false;
	}

    for (var i=0; i<groupLength; i++) {
	var user = userList[i].value;
	
	var selectedGroupSize = groupList[i].options.length;
        var groupInArray = groupList[i];
        var selectedGroup = '';
        var groupSelected = false;
        for(var j=0; j<selectedGroupSize; j++)
        {
            if(groupInArray.options[j] != null)
            {
        	    if(groupInArray.options[j].selected == true) {
			     groupSelected = true;
                    if(selectedGroup == '') {
                        selectedGroup = groupInArray.options[j].value;
                    }
                    else {
                        selectedGroup += ',' + groupInArray.options[j].value;
                    }
                }
            }
        }
        if(user != "" && !selectedGroup)
	 {
	     alert("<fmt:message key='webclient.admin.addmultiple.nogroupforuser'/> "+user);
	     return false;
	 }
	 if(selectedUsers == "")
	 {
		selectedUsers = user;
		}
	 else 
	 {

		if(user!="")
		{
		var users = selectedUsers.split(",");
		for(var i=0;i<users.length;i++)
		{
		   if(users[i] == user)
		   {
		      alert("<fmt:message key='webclient.admin.addmultiple.repeateduser'/> "+user);
		      return false;
		   }
		}
		selectedUsers += "," + user;

		}
		        
	 }
        form.NewGroups[i].value = selectedGroup;
	}   
	if(selectedUsers == "")
	{
	   alert("<fmt:message key='webclient.admin.addmultiple.nouseradded'/> ");
	   return false;
 	}
    return true;
}

</script>

