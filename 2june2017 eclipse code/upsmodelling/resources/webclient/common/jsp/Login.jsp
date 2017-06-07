<%-- $Id: Login.jsp,v 1.6 2010/10/29 13:47:02 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<html>
<head>
<title><fmt:message key="webclient.login.page.title"/></title>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/validation.js"></SCRIPT>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script language="JavaScript1.2">
        function loadScreenSize()
        {
                document.forms[0].screenWidth.value = parseInt(screen.width) - 210;
                document.forms[0].screenHeight.value = parseInt(screen.height) - 150;
                document.forms[0].userName.focus();
        }
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><style type="text/css">
<!--

-->
</style></head>

<body style="margin-top:80px;" onLoad="loadScreenSize()">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right" style="padding-right:70px;padding-bottom:6px;">
<span class="greenBoldTxt"><c:out value="${message}"/></span>
<span class="redBoldTxt"><html:errors/></span>
 </td>
  </tr>
</table>


<table class="loginBg1" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding-left:20px;"><table class="loginBg2" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" valign="top" style="padding-right:30px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:50px;"><img src="/webclient/common/images/loginLogo.gif" border="0" alt='<fmt:message key="webclient.login.logogif.alt"/>'></td>
                    </tr>
                  </table>


                  <table style="margin-top:22px;" width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top" style="padding-right:7px;"><img src="/webclient/common/images/quote-left.gif"/></td>
                      <td class="loginTex" align="left" style="line-height:16px;">
                        
                        <fmt:message key="webclient.login.aboutwebnms5.description"/></td>
                      <td valign="bottom" style="padding-left:7px;"><img src="/webclient/common/images/quote-right.gif"/></td>
                    </tr>
                  </table></td>                        
                <td width="300" align="right" valign="top" style="padding-left:20px;"> 
				<form style="margin:0px; padding:0px;" name="loginForm" METHOD=post action="/jsp/Login.do" onSubmit="return validateUser();">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top" width="10"><img src="/webclient/common/images/loginboxleft.gif"></td>
                       
                         <input type="hidden" name="javaui" value="javaui"> 
                                <input type="hidden" name="showapplet" value="showapplet"> 
                                <input type="hidden" name="Language" value='<c:out value="${Language}"/>'> 
                               <input type="hidden" name="Country" value='<c:out value="${Country}"/>'> 
                              <input type="hidden" name="screenHeight">
                              <input type="hidden" name="screenWidth">
                      <td valign="top" class="loginBoxBg" style="padding:15px 7px 7px 7px;" ><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="7"><input type="radio" style="margin:0px; padding:0px;" name="clienttype" value="html" checked></td>
                            <td class="whiteBoldTxt" nowrap><fmt:message key="webclient.login.htmlclient"/>                          
                             </td>                               
                            <td width="7"><input type="radio" style="margin:0px; padding:0px;" name="clienttype" value="applet"></td>
                            <td class="whiteBoldTxt" nowrap><fmt:message key="webclient.login.appletclient"/></td>
                          </tr>
                        </table>
                        <table style="margin-top:20px;" border="0" cellpadding="4" cellspacing="0">
                          <tr>
                            <td class="loginTex" nowrap="nowrap"><fmt:message key="webclient.login.username"/></td>
                            <td align="right"><input  style="margin:0px; padding:0px;" class="inputBox" type="text" maxlength="50" name="userName" /></td>
                          </tr>
                          <tr>
                            <td class="loginTex"><fmt:message key="webclient.login.password"/></td>
                            <td align="right"><input style="margin:0px; padding:0px;" class="inputBox" maxlength="8" type="password" name="password" /></td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td align="right"><input type="submit" style="margin:0px; padding:0px;" class="loginBut" name="Submit" value='<fmt:message key="webclient.login.loginmsg"/>'	></td>
                        
                          </tr>
                        </table></form>
                        <table width="100%" border="0" cellpadding="2" cellspacing="0" style="margin-top:35px;">
                          <tr>
                            <td class="whiteBoldTxt" nowrap><fmt:message key="webclient.login.webstartclient"/></td>
                          </tr>
                          <tr>
                            <td style="line-height:16px;" class="loginTex"><fmt:message key="webclient.login.aboutjwsclientdesc"/></td>
                          </tr>
                          <tr>
                            <td align="right" style="padding-right:25px;">
                            <form  style="margin:0px; padding:0px;" method=get action="/jsp/WebStart.jsp" name="webstartform" >
                            <input type="submit" style="margin:0px; padding:0px;"  class="loginBut" name="webstartclient" value='<fmt:message key="webclient.login.webstartclient"/>'>    
                            <input type="hidden" name="webstart">
                            </form>    
                        </td>
                          </tr>
                        </table></td>
                      <td valign="top" width="10"><img src="/webclient/common/images/loginboxright.gif" ></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td valign="top" nowrap style="padding-left:15px;padding-top:2px;line-height:16px;" class="loginTex2"><fmt:message key="webclient.login.defaultdetails.unconfiguredsystem"/><br>
                        &nbsp;&nbsp;<fmt:message key="webclient.login.defautdetails.username"/>&nbsp;&nbsp;|    &nbsp;&nbsp;<fmt:message key="webclient.login.defaultdetails.password"/></td>
                      <td>&nbsp;</td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td valign="top"><table style="margin-top:8px;" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="loginSmallTxt" nowrap style="padding-left:10px;"><fmt:message key="webclient.login.footer.text5"/>
</td>
        </tr>
      </table></td>
  </tr>
</table>					

<%@include file="/webclient/common/jspf/loginInclude.jspf" %>
</body>
</html>
