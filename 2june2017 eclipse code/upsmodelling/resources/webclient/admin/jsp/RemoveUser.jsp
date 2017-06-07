<%-- $Id: RemoveUser.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<%@include file="/webclient/admin/jspf/RemoveUserFunctions.jspf" %>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
</head>

<body  onLoad = "document.RemoveUserForm.userName.focus();">
<form name="RemoveUserForm" action="/admin/RemoveUserAction.do" method="POST" onSubmit="return Validate()">
          
  <table width="80%" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr> 
        <td width="10">&nbsp;</td>
        <td height="30" align="left" valign="bottom"><span class="header1"><fmt:message key="webclient.admin.adminpanel.removeuser"/></span></td>
      </tr>
      <tr> 
        <td width="10" height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
        <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      </tr>       
      <tr>
        <td>&nbsp;</td>   
        <td align="left" valign="top" class="text"> <table width="500" border="0" align="left" cellpadding="5" cellspacing="0" class="botBorder">
            <tbody>
              <tr align="left" valign="top"> 
                <td colspan="3" align="right" valign="middle" class="text"><span class="mandatory">*</span><fmt:message key="webclient.admin.removeuser.mandatoryfields"/></td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="3" align="left" valign="middle" class="text"><fmt:message key="webclient.admin.removeuser.selectusermsg"/></td>
              </tr>
              <tr align="left" valign="top"> 
                <td width="91" class="text"><fmt:message key="webclient.admin.removeuser.username"/></td>
                <td width="189"> <input name="userName" type="text" class="formStyle"><span class="mandatory">&nbsp*</span></td>
                <td width="190"><input name="Submit" type="submit" class="button" value='<fmt:message key="webclient.admin.removeuseruser.submit"/>'> 
                </td>
              </tr>
            </tbody>
          </table></td>
      </tr>
  </table>
</form>
</body>
</html>
