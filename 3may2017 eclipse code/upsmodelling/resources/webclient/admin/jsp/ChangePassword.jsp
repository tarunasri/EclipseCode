<%-- $Id: ChangePassword.jsp,v 1.8 2010/10/29 13:46:54 swaminathap Exp $ --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<title><fmt:message key="webclient.admin.modifyuserprofile.changepassword"/></title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
<META HTTP-EQUIV="cache-control" CONTENT="no-store">
<script language="javascript" src="/webclient/common/js/validation.js"></script>
<script type="text/javascript" language="JavaScript">
//Function to validate the pass-word field   
function ValidatePassword()   
{       
        var pass1 = document.ChangePasswordForm.currentpassword.value;   
        var pass2 = document.ChangePasswordForm.newPassword.value;   
        var pass3 = document.ChangePasswordForm.password.value;   
   		
        if(trimAll(pass1) == "")   
        {   
            alert("<fmt:message key='webclient.admin.modifyuserprofile.validation.currentpassword.empty'/>");               
            document.ChangePasswordForm.currentpassword.focus();   
            return false;   
        }   
        if(trimAll(pass2) == "")   
        {   
            alert("<fmt:message key='webclient.admin.modifyuserprofile.validation.newpassword.empty'/>");   
            document.ChangePasswordForm.newPassword.focus();   
            return false;   
        }   
        if(trimAll(pass3) == "")   
        {   
            alert("<fmt:message key='webclient.admin.modifyuserprofile.validation.retypepassword.empty'/>");   
            document.ChangePasswordForm.newPassword.focus();   
            return false;   
        }	     
 		if(!charCodeCheck(pass1))           
        {	 
            alert("<fmt:message key='javaui.common.changepassword.invalidpassword'/>"); 
            document.ChangePasswordForm.currentpassword.focus();   
        	return false;   
        }
		if(!charCodeCheck(pass2))           
        {	 
            alert("<fmt:message key='javaui.common.changepassword.invalidpassword'/>");
			document.ChangePasswordForm.newPassword.focus();   
        	return false;   
        }

        if(!charCodeCheck(pass3))           
        {	 
            alert("<fmt:message key='javaui.common.changepassword.invalidpassword'/>"); 
			alert('Special characters not allowed in password');
            document.ChangePasswordForm.password.focus();   
        	return false;   
        }
  
        if(pass2 != pass3)   
        {   
            alert("<fmt:message key='webclient.admin.modifyuserprofile.validation.newpassword.check'/>");   
            return false;   
	}
	if(!ValidateAccountExpiry())
	{
		return false;
	}   
    return true;   
}
//Function to validate account expiry field
function ValidateAccountExpiry()

 	 {
 	         var accexpval = document.ChangePasswordForm.passexpduration.value;
 	         if(isNaN(accexpval))
 	         {
 	                 alert("<fmt:message key='webclient.admin.modifyuserprofile.validation.accountexpiry.isnan'/>");
 	                 document.ChangePasswordForm.passexpduration.focus();
 	                 return false;
 	         }
 	         if((String(accexpval)).indexOf(".") > -1)
 	         {
			alert("<fmt:message key='webclient.admin.modifyuserprofile.validation.accountexpiry.integer'/>"); 
 	                 document.ChangePasswordForm.passexpduration.focus();
 	                 return false;
 	         }
 	         if(!isPositiveInteger(accexpval))
 	         {
			alert("<fmt:message key='webclient.admin.validation.accountexpiry.positivevalue'/>");
 	                 document.ChangePasswordForm.passexpduration.focus();
 	                 return false;
 	         }
 	         return true;
 	 }
function charCodeCheck(key)
{
	for(i=0;i<key.length;i++)
	{
		var asciis = key.charCodeAt(i);
		//if(!(asciis>=65 && asciis<=90)&&!(asciis>=97 && asciis<=122)&&!(asciis>=48 && asciis<=57)&& asciis!=95 && asciis!=45)
		if(!(asciis>=33 && asciis<=126))
        {
	        return false;
    	    //  System.out.println("Invalid character");
		}	
	}
	return true;
}
</script>
</head>

<body>
<form method="post" name="ChangePasswordForm" action="/PasswordUpdate.do" onSubmit="return ValidatePassword()">
<input type="hidden" name="userName" value="<c:out value='${userName}'/>">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td align="center">
 <table style="margin-bottom:10px;" width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key="webclient.admin.modifyuserprofile.changepassword"/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" ><br>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td> 
        <table><tr><td>
          <table width="100%" border="0" cellspacing="0" cellpadding="0">          
          <tr> 
            <td class="header2"><fmt:message key="webclient.admin.modifyuserprofile.currentpassword"/></td>
            <td><input type="password" maxlength="8" name="currentpassword" id="currentpassword" class="formStyle"><span class="mandatory">*</span></td>
          </tr>          
          <tr> 
            <td class="header2"><br><fmt:message key="webclient.admin.modifyuserprofile.newpassword"/></td>
            <td><br><input type="password" maxlength="8" name="newPassword" class="formStyle"><span class="mandatory">*</span></td>
          </tr>
          <tr> 
            <td class="header2"><br><fmt:message key="webclient.admin.modifyuserprofile.retypepassword"/></td>
            <td><br><input type="password" maxlength="8" name="password" class="formStyle"><span class="mandatory">*</span></td> 
          </tr>
          <tr> 
            <td class="header2"><br><fmt:message key="webclient.admin.changepassword.passexpduration"/></td>
            <td><br><input type="text" name="passexpduration" class="formStyle"><span class="header2"><fmt:message key="webclient.admin.modifyuserprofile.modifyaccountexpiry.days"/></span></td> 
          </tr>

          <tr> 
            <td colspan="2" class="mandatory" height=50 valign="bottom" style="padding:5">* - <fmt:message key="webclient.admin.adduser.mandatoryfields"/></td>
          </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
	  <input name="Submit" type="submit" value='<fmt:message key="webclient.common.submit.button"/>' class="button">
	  <input name="Reset" type="reset" value='<fmt:message key="webclient.common.reset.button"/>' class="button"> 
          </td>
   </tr>
        </table>

 </td>
    </tr>    
</table>

<c:if test="${ updatePwdResult == 'true' }">
        <tr> 
              <td colspan="2" class="header1" align="center"><fmt:message key="webclient.changepassword.successfullyupdated."/></td>
        </tr>
</c:if>
<c:if test="${ updatePwdResult == 'false' }">
        <tr> 
               <td colspan="2" class="header1" align="center"><font color="RED"><fmt:message key="webclient.changepassword.updatefailedtryagain."/></font></td>
        </tr>
</c:if>

<c:if test="${ updatePwdResult == 'Invalid Old Password' }">
        <tr> 
               <td colspan="2" class="header1" align="center"><font color="RED"><fmt:message key="webclient.changepassword.updatefailedinvalidoldpassword"/></font></td>
        </tr>
</c:if>

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
		  
</td></tr></table>
</form>


</body>
</html>
