
<%-- $Id: supportedBrowser.jsp,v 1.4 2007/10/23 13:47:12 gnanasekar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>

<html>
<head>
<style type="text/css">
<!--
body {
	margin: 0px;
}
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
-->
</style>
<title><fmt:message key="webclient.login.page.title"/></title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
</head>

<body >

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="/webclient/common/images/header-bg.gif"><img src="/webclient/common/images/rawHTMLHeader-Logo.gif" width="147" height="76"></td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><br>
      <br>
      <br>
      <table width="40%" border="0" cellpadding="5" cellspacing="0">
        <tr>
          <td align="center" bgcolor="#FFFF99">
      <p>We regret to inform that we are not able to support your browser version. Currently, our product supports the following browser version or above.</p></td>
    </tr>
 </table>
      <br>


<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" cellpadding="1" cellspacing="1">
          <tr class="header2Bg"> 
            <td height="25" class="boldText">Web Browsers</td>
            <td class="boldText">Windows</td>
            <td class="boldText">Linux</td>
            <td class="boldText">Solaris</td>
          </tr>
          <tr> 
            <td height="25" class="text"><a href="http://www.microsoft.com/windows/ie/default.asp">IE 
              6.0 & Above</a><br> </td>
            <td class="text">Yes<br> </td>
            <td class="text">N/A<br> </td>
            <td class="text">N/A </td>
          </tr>
          <tr> 
            <td height="25" class="text"><a href="http://www.mozilla.org/products/">Mozilla Firefox
              2.0 & Above </a></td>
            <td class="text">Yes </td>
            <td class="text">Yes </td>
            <td class="text">Yes </td>
          </tr>
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

</body>
</html>
