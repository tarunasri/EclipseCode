<%-- $Id: passwordExpiry.jsp,v 1.3 2010/10/29 13:47:02 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<html>
<head>
<title><fmt:message key="webclient.login.page.title"/></title>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/validation.js"></SCRIPT>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script>
        function validateForm()
        {
                var password = trimAll(document.PasswordExpiryFormBean.newpassword.value);
                var conpassword = trimAll(document.PasswordExpiryFormBean.confirmpassword.value);
                var days = trimAll(document.PasswordExpiryFormBean.days.value);
                if(password=="" || conpassword=="")
                {
		  alert('<fmt:message key="webclient.login.passwordexpiry.passwordvalidate.empty"/>');
                  return false;
                }
                if ((password!="") || (conpassword!=""))
                {
                        if (password != conpassword)
                        {
                                alert('<fmt:message key="webclient.login.passwordexpiry.passwordvalidate.message"/>');
                                document.PasswordExpiryFormBean.newpassword.focus();
                                return false;
                        }
                }
                if(document.PasswordExpiryFormBean.pwdExpiryStatus.checked && days=="")
                {
                        alert('<fmt:message key="webclient.login.passwordexpiry.daysvalidate.message"/>');
                        document.PasswordExpiryFormBean.days.focus();
                        return false;
                }
                if(document.PasswordExpiryFormBean.pwdExpiryStatus.checked && !isPositiveInteger(days))
                {
                        alert('<fmt:message key="webclient.login.passwordexpiry.daysnumericvalidate.message"/>');
                        document.PasswordExpiryFormBean.days.focus();
                        return false;
                }
                return true;
        }
        function skipPwd()
        {
                return true;
        }
	function PasswordExpCheck()
	{
        	if(document.PasswordExpiryFormBean.pwdExpiryStatus.checked)
	        {
        	        document.PasswordExpiryFormBean.days.disabled = false;
                	document.PasswordExpiryFormBean.days.focus();
                	document.PasswordExpiryFormBean.days.className = "formStyle";
        	}
	        else
        	{
                        document.PasswordExpiryFormBean.days.disabled = true;
                        document.PasswordExpiryFormBean.days.value="";
                        document.PasswordExpiryFormBean.days.className = "formStyleDisabled";                
	        }
	}
function init()
{
	document.PasswordExpiryFormBean.days.className='formStyleDisabled';
	document.PasswordExpiryFormBean.days.disabled = true;
	document.PasswordExpiryFormBean.newpassword.focus();
}
</script>
</head>
<c:choose>	
<c:when test="${ChangePassword=='true'}">
<body background="/webclient/common/images/bodybg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="init()">
<html:form action="/jsp/PasswordExpiry.do" method="post" onsubmit="return validateForm()">
<table width="100%" height="95%" cellpadding="0" cellspacing="0">
  <tr> 
    <td align="center" valign="top"><br>
      <br>
      <br>
      <br>
      <table width="890" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="884" border="0" rowspan="2" align="left" valign="top"> <table width="10%"  align="center" cellpadding="1" cellspacing="0" bgcolor="#666666">
              <tr> 
                <td align="left" valign="top"> <table width="877" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                    <tr> 
                      <td width="877"><img src="/webclient/common/images/adventnet/topheader.jpg" width="877" height="92" border="0"></td>
                    </tr>
                    <tr> 
                      <td background="/webclient/common/images/header_bot_grayline.gif"><img src="/webclient/common/images/header_bot_grayline.gif" width="5" height="10"> 
                      </td>
                    </tr>
                    <tr> 
                      <td align="left" valign="top"> <table width="100%"  border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
                          <tr> 
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="center" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top"><span class="header1"><fmt:message key="webclient.login.passwordexpiry.welcome"> 
                              <fmt:param><c:out value="${param.userName}"/></fmt:param> 
                              </fmt:message> </span> </td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td height="30" align="left" valign="top">&nbsp;</td>
			    <c:choose>
                            <c:when test="${reusePassword == 'true'}">
                            <td colspan="3" align="left" valign="top"><span class="text"><br>
                              <c:out value="${requestScope.errorMessage}"/> <fmt:message
key="webclient.login.passwordexpiry.detailedmessage1"/> <fmt:message
key="webclient.login.passwordexpiry.detailedmessage3"/><br>
                              <br>
                              </span></td>
			      </c:when>
                              <c:otherwise>
                              <td colspan="3" align="left" valign="top"><span class="text"><br>
                              <c:out value="${requestScope.errorMessage}"/> <fmt:message key="webclient.login.passwordexpiry.detailedmessage4"/><br><br></span></td>
                             </c:otherwise>
                              </c:choose>
                            <td align="left" valign="top">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td width="7%" align="left" valign="top"><img src="/webclient/common/images/trans.gif" width="60" height="1"></td>
                            <td width="43%" align="left" valign="top"><table width="334" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="332" height="20" class="homeheadBg"><span class="whiteText">&nbsp;<fmt:message key="webclient.login.passwordexpiry.changepassword"/></span></td>
                                </tr>
                                <tr> 
                                  <td><img src="/webclient/common/images/trans.gif" width="1" height="3"></td>
                                </tr>
                                <tr> 
                                  <td align="left" valign="top" bgcolor="#F9FAFC" class=""> 
                                    <table width="100%" border="0" cellpadding="1" cellspacing="0" bgcolor="#DDDDDD">
                                      <tr> 
                                        <td align="left" valign="top"><table width="100%" cellpadding="2" cellspacing="0" class="loginBoxBg">
                                            <tr> 
                                              <td align="left" valign="top"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                                  <tr> 
                                                    <td align="left" valign="top"><table width="100%" cellspacing="0" border="0" cellpadding="3">
                                                        <tr> 
                                                          <td width="40%" align="left" valign="top"><strong><span class="text"><fmt:message key="webclient.login.passwordexpiry.newpassword"/></span></strong></td>
                                                          <td width="60%" align="right"><html:password size="26" styleClass= "formstyle" name="PasswordExpiryFormBean" property="newpassword"/><span class="errorText"> 
                                                            <html:errors property="password"/></span> 
                                                        </tr>
                                                        <tr> 
                                                          <td align="left" valign="top"><strong><span class="text"><fmt:message key="webclient.login.passwordexpiry.confirmpassword"/></span></strong></td>
                                                          <td align="right"> <html:password  size="26" styleClass= "formstyle" name="PasswordExpiryFormBean" property="confirmpassword"/> 
                                                        </tr>
                                                        <tr> 
                                                          <td colspan="2" align="left" valign="top"><table width="303" border="0" cellspacing="0" cellpadding="0">
                                                              <tr> 
                                                                <td width="20"> 
                                                                  <input type="checkbox" name="pwdExpiryStatus" value="Expire" onclick="javascript:PasswordExpCheck()"></td>
                                                                <td width="134"><span class="text"><fmt:message key="webclient.login.passwordexpiry.passwordexpiryoption"/></span></td>
                                                                <td width="44"> 
                                                                  <html:text name="PasswordExpiryFormBean" property="days" style="width:30"  styleClass="formstyle" size="3" maxlength="3"/> 
                                                                </td>
                                                                <td width="105"><span class="text"><fmt:message key="webclient.login.passwordexpiry.days"/></span></td>
                                                              </tr>
                                                            </table></td>
                                                        </tr>
<input type="hidden" name="userName" value='<c:out value="${userName}"/>'>
<input type="hidden" name="clienttype" value='<c:out value="${clienttype}"/>'>                                              <input type="hidden" name="screenHeight" value='<c:out value="${screenHeight}"/>'>
<input type="hidden" name="Country" value='<c:out value="${Country}"/>'>                                                    <input type="hidden" name="screenWidth" value='<c:out value="${screenWidth}"/>'>
<input type="hidden" name="Language" value='<c:out value="${Language}"/>'>                                                  <input type="hidden" name="password" value='<c:out value="${password}"/>'>
<input type="hidden" name="login" value="Login">                                                                            <input type="hidden" name="showapplet" value="showapplet">
<input type="hidden" name="javaui" value="javaui">

                                                        <tr> 
                                                          <td align="left" valign="top">&nbsp;</td>
                                                          <td align="right"><input type="submit" name="login" value='<fmt:message key="webclient.login.passwordexpiry.submit"/>' class="button"></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
                                </tr>
                              </table></td>
                            <td width="4%" align="left" valign="top"><img src="/webclient/common/images/trans.gif" width="60" height="1"></td>
                            <td width="39%" align="left" valign="top">

   			    <table width="340" border="0" cellspacing="3" cellpadding="0">
                                <tr> 
				<c:choose>
					<c:when test="${reusePassword == 'true'}">
                                  <td width="333" align="left" valign="top"><table width="100%" ="0" cellspacing="0" cellpadding="0">
                                      <tr bgcolor="#F9FAFC"> 
                                        <td height="20" class="homeheadBg"><span class="whiteText">&nbsp;<fmt:message key="webclient.login.passwordexpiry.skipchangepassword"/></span></td>
                                      </tr>
                                      <tr> 
                                        <td width="294"><img src="/webclient/common/images/trans.gif" width="1" height="3"></td>
                                      </tr>
                                      <tr> 
                                        <td align="left" valign="top" class=""><table width="100%" cellpadding="1" cellspacing="0" bgcolor="#DDDDDD">
                                            <tr> 
                                              <td align="left" valign="top"><table width="100%"cellspacing="0" cellpadding="3">
                                                  <tr> 
                                                    <td align="left" valign="top" bgcolor="#F9FAFC"> 
                                                      <table width="100%" border="0" cellspacing="0" cellpadding="4">
                                                        <tr> 
                                                          <td align="center" valign="top" ><span class="text"><fmt:message key="webclient.login.passwordexpiry.detailedmessage2"/></span></td>
                                                        </tr>
							</c:when>
                                                        </c:choose>
</html:form>
<c:choose>
	<c:when test="${reusePassword == 'true'}">
<form action="/jsp/PasswordExpiry.do" method="post" onsubmit="return skipPwd()">
<input type="hidden" name="userName" value='<c:out value="${userName}"/>'>
<input type="hidden" name="clienttype" value='<c:out value="${clienttype}"/>'>                                              <input type="hidden" name="screenHeight" value='<c:out value="${screenHeight}"/>'>
<input type="hidden" name="Country" value='<c:out value="${Country}"/>'>                                                    <input type="hidden" name="screenWidth" value='<c:out value="${screenWidth}"/>'>
<input type="hidden" name="Language" value='<c:out value="${Language}"/>'>                                                  <input type="hidden" name="password" value='<c:out value="${password}"/>'>
<input type="hidden" name="login" value="Login">                                                                            <input type="hidden" name="showapplet" value="showapplet">
<input type="hidden" name="javaui" value="javaui">

                                                        <tr> 
                                                          <td align="center" valign="top" > 
                                                            <input type="submit" name="skipPwdBtn" value='<fmt:message key="webclient.login.passwordexpiry.skipchangepassword.button"/>' class="button" onsubmit="window.location.href='/jsp/PasswordExpiry.do?'"></td>
                                                        </tr>
                                                      </table></td>
                                                  </tr>
                                                </table></td>
                                            </tr>
                                          </table></td>
                                      </tr>
                                    </table></td>
				    </c:when>
                                    </c:choose>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                </tr>
                              </table>
			    </td>
                            <td width="7%" align="left" valign="top"><img src="/webclient/common/images/trans.gif" width="60" height="1"></td>
                          </tr>
                          <tr> 
                            <td height="32" align="left" valign="top"><br> <br> 
				    <br> <br> <br> </td>
			    <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                            <td align="left" valign="top">&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="25" align="center" valign="middle" bgcolor="#F9FAFC" ><span class="text">&nbsp;</span></td>
                    </tr>
                    <tr> 
                      <td><img src="/webclient/common/images/botheader.jpg" width="877" height="4"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
          <td width="11" align="left" valign="top" background="/webclient/common/images/righttileshadow.gif"><img src="/webclient/common/images/righttileshadowtop.gif" width="11" height="12"></td>
        </tr>
        <tr> 
          <td align="left" valign="bottom" background="/webclient/common/images/righttileshadow.gif"><img src="/webclient/common/images/righttileshadow.gif" width="11" height="12"></td>
        </tr>
        <tr> 
          <td align="left" valign="top" background="/webclient/common/images/botshadowtile.gif"><img src="/webclient/common/images/botshadow1.gif" width="11" height="12"></td>
          <td><img src="/webclient/common/images/botshadow2.gif" width="11" height="12"></td>
        </tr>
      </table> </td>
  </tr>
</table>
</form>
</body>
 </c:when>	
 	 	
 	 <c:otherwise>	
 	 	
 	 <table width="100%" height="95%" cellpadding="0" cellspacing="0">	
 	 <tr> 	
 	     <td align="center" valign="top"><br>	
 	       <br>	
 	       <br>	
 	       <br>	
 	       <table width="890" cellspacing="0" cellpadding="0">	
 	 	
 	         <tr> 	
 	           <td width="884" border="0" rowspan="2" align="left" valign="top"> <table width="10%"  align="center" cellpadding="1" cellspacing="0" bgcolor="#666666">	
 	               <tr> 	
 	                 <td align="left" valign="top"> <table width="877" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">	
 	                     <tr> 	
 	                       <td width="877"><img src="/webclient/common/images/adventnet/topheader.jpg" width="877" height="92" border="0"></td>	
 	                     </tr>	
 	                     <tr> 	
 	                       <td background="/webclient/common/images/header_bot_grayline.gif"><img src="/webclient/common/images/header_bot_grayline.gif" width="5" height="10"> 	
 	                       </td>	
 	                     </tr>	
 	 	
 	                     <tr> 	
 	                       <td align="left" valign="top"> 	
 	 	
 	 <table width="100%"  border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">	
 	 	
 	                           <tr> 	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="center" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                           </tr>	
 	                           <tr> 	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                           </tr>	
 	                           <tr> 	
 	                             <td height="30" align="left" valign="top">&nbsp;</td>	
 	                             <td colspan="3" align="left" valign="top"><span class="text"><br>	
 	                               <c:out value="${requestScope.errorMessage}"/> 	
 	                                 <br>	
 	                               <br>	
 	                               </span></td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                           </tr>	
 	 	
 	 	
 	 	
 	                           <tr> 	
 	                             <td width="7%" align="left" valign="top"><img src="/webclient/common/images/trans.gif" width="60" height="1"></td>	
 	                             <td width="43%" align="left" valign="top"><table width="334" cellspacing="0" cellpadding="0">	
 	                                 <tr> 	
 	                                   <td width="332" height="20">	
 	 </td>	
 	                                 </tr>	
 	                                 <tr> 	
 	                                   <td><img src="/webclient/common/images/trans.gif" width="1" height="3"></td>	
 	                                 </tr>	
 	                                 <tr> 	
 	                                   <td> </td>	
 	                                 </tr>	
 	                               </table></td>	
 	 	
 	                             <td width="4%" align="left" valign="top"><img src="/webclient/common/images/trans.gif" width="60" height="1"></td>	
 	                             <td width="39%" align="left" valign="top"> <table width="340" border="0" cellspacing="3" cellpadding="0">	
 	 	
 	                                       <tr> 	
 	                                         <td width="294"><img src="/webclient/common/images/trans.gif" width="1" height="3"></td>	
 	                                       </tr>	
 	 	
 	                                       <tr> 	
 	                                         <td align="left" valign="top" class=""></td>	
 	                                       </tr>	
 	                                     </table></td>	
 	                                 </tr>	
 	 	
 	                                 <tr> 	
 	                                   <td>&nbsp;</td>	
 	                                 </tr>	
 	                           <tr> 	
 	                               <td height="32" align="left" valign="top"><br> <br> 	
 	                               <br> <br> <br> </td>	
 	                             <td align="left" valign="bottom"><span class="text"><a href="http://www.adventnet.com" target="_blank"><img src="/webclient/common/images/adventnet/adventnetlogo.gif" alt="AdventNet.com" width="88" height="28" hspace="2" border="0"></a></span></td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                             <td align="left" valign="top">&nbsp;</td>	
 	                           </tr>	
 	 	
 	                         </table></td>	
 	                     </tr>	
 	 	
 	                     <tr> 	
 	                       <td height="25" align="center" valign="middle" bgcolor="#F9FAFC" ><span class="text">&nbsp;</span></td>	
 	                     </tr>	
 	 	
 	                     <tr> 	
 	                       <td><img src="/webclient/common/images/botheader.jpg" width="877" height="4"></td>	
 	                     </tr>	
 	 	
 	       </table></td>	
 	 </tr>	
 	 </table>	
 	 </td>	
 	 	
 	 <tr>	
 	           <td width="11" align="left" valign="top" background="/webclient/common/images/righttileshadow.gif"><img src="/webclient/common/images/righttileshadowtop.gif" width="11" height="12"></td>	
 	         </tr>	
 	         <tr> 	
 	           <td align="left" valign="top" background="/webclient/common/images/botshadowtile.gif"><img src="/webclient/common/images/botshadow1.gif" width="11" height="12"></td>	
 	           <td><img src="/webclient/common/images/botshadow2.gif" width="11" height="12"></td>	
 	         </tr>	
 	       </table> 	
 	 </td>	
 	 </tr>	
 	 </table>	
 	 	
 	 </c:otherwise>	
 	 </c:choose>
</html>
