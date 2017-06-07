<%-- $Id: AddUser.jsp,v 1.3 2010/10/29 13:46:54 swaminathap Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>

<html>
<head>
<script language="javascript" src="/webclient/admin/js/AddUserFunctions.js"></script>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/admin/jspf/AddUserFunction.jspf" %>
</head>

<body  onload="init()">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.adminpanel.adduser'/></h1></td>
		<td align="left"><span class="mandatory">*</span><fmt:message key="webclient.admin.adduser.mandatoryfields"/></td>
        </tr>
        </table>


<form name="AddUserForm" action="/admin/AddUserAction.do" method="POST" onSubmit="return Validate()">  
  <table style="margin-bottom:10px;" width="60%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
  <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  
      <tr>
        <td>&nbsp;</td>
        <td class="text" align="center">
        <table width="80%" border="0" align="left" cellpadding="5" cellspacing="0" >
            
              <tr align="left" valign="top"> 
                <td width="200" class="text"><fmt:message key="webclient.admin.adduser.username"/></td>
                <td > <input name="newUserName" type="text" maxlength="50" class="formStyle"><span class="mandatory">&nbsp*</span>
                </td>
              </tr>
              <tr align="left" valign="top"> 
                <td class="text"><fmt:message key="webclient.admin.adduser.password"/></td>
                <td><input name="prevpassword" type="password" maxlength="8" class="formStyle"><span class="mandatory">&nbsp*</span></td>
              </tr>
              <tr align="left" valign="top"> 
                <td class="text"><fmt:message key="webclient.admin.adduser.retypepassword"/></td>
                <td> <input name="retypepassword" type="password" maxlength="8" class="formStyle" ><span class="mandatory">&nbsp*</span></td>
              </tr>
            <%-- <tr align="left" valign="top"> 
  
                <td colspan="2" align="left" valign="top"> <table width="100%" border="0" cellpadding="0" cellspacing="0" class="NobotBorder">
                    <tbody> --%>
                      <tr align="left" valign="top" class="botBorder"> 
                        <td width="200"> 
							<span class="text"><fmt:message key="webclient.admin.adduser.availablegroupnames"/></span><br><br><em></em>
							<span class="text"><fmt:message key='webclient.admin.adduser.availablegroups.message'/></span>
							<!--</span></span> </font>-->
						</td>
                        <td >  </span> <select style="height:auto" class="formStyle" multiple name="existingGroups" size="4">
                            <c:forEach items="${ExistingGroups}" var="pls" varStatus="index"> 
                            <option value='<c:out value="${pls}"/>'> <c:out value="${pls}"/> 
                            </option>
                            </c:forEach> </select> </td>
                      </tr>
                       <tr> <td colspan="2" height="15"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
                    
                      <tr align="left" valign="top" class="botBorder"> 
                        <td><input type="checkbox" name="ifnewgroup" value="ifnewgroup" onClick="newGroupCheck()"> 
                          <span class="text"><fmt:message key="webclient.admin.adduser.addusertogroup"/></span></td>
                        <td> <input name="newGroup" type="text" disabled class="formStyleDisabled"></td>
                      </tr>
               <%--     </tbody>
                  </table></td>
              </tr> --%>
         <tr> <td colspan="2" height="10"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>
             
              <tr align="left" valign="top"> 
                <td><input type="checkbox" name="ispasswordexpiry" value="checkbox" onClick="PasswordExpCheck()"> 
                  <span class="text"><fmt:message key="webclient.admin.adduser.passwordexpiresin"/></span></td>
                <td><input disabled class="formStyleDisabled" style="width:50" name="passwordExpiryTime" type="text" size="3" maxlength="3"> 
                  <span class="text"><fmt:message key="webclient.admin.adduser.passwordexpiresin.days"/></span></td>
              </tr>
              <tr align="left" valign="top"> 
                <td><input type="checkbox" name="isaccountexpiry" value="checkbox" onClick="AccountExpCheck()"> 
                  <span class="text"><fmt:message key="webclient.admin.adduser.accountexpiresin"/></span></td>
                <td><input style="width:50" name="accountExpiryTime" type="text" size="3" maxlength="3" disabled class="formStyleDisabled"> 
                  <span class="text"><fmt:message key="webclient.admin.adduser.accountexpiresin.days"/></span> </td>
              </tr>
              <tr align="left" valign="top"> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
          
       </table></td>
        <tr class="header2bg" height="25" valign="middle"> 
             <td>&nbsp;</td>
             <td><img src="/webclient/common/images/trans.gif" width="170" height="1">
             <input name="Submit" type="submit" class="button" value='<fmt:message key="webclient.admin.addmultiple.save"/>'> 
              <input name="Reset" type="reset" class="button" onclick="resetFields()" value='<fmt:message key="webclient.common.reset.button"/>'>
             <input name="Cancel" type="button" class="button" onclick="javascript:userconfiguration()" value='<fmt:message key="webclient.admin.addmultiple.cancel"/>'>
                </td>
              </tr>
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
</form>
</body>
</html>
