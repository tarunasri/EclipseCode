<%-- $Id: EventParserFileLoading.jsp,v 1.3 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.fault.eventparser.title'/></title>
</head>

<script language="javascript" src="/webclient/common/js/validation.js"></script>
<%@include file="/webclient/admin/jspf/EventParserAdmin.jspf" %>
<body>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.fault.eventparser.link.loadparsers'/>
</h1></td>
</tr>
</table>

<form action="/admin/EventParserFromFile.do" name="LoadParserFromFileForm" onsubmit="return false;">

<table style="margin-bottom:10px;" width="70%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >

  <table width="100%" border="0" cellspacing="0" cellpadding="0">

    <input type="hidden" name="toPerform" value="">

          <tr> 
            <td>&nbsp;</td>
            <td valign="top"> <table width="100%" border="0" align="left" cellpadding="2" cellspacing="0" class="botBorder">
                <tr> 
                  <td height="30" colspan="3" class="text"> 
                   <input type="checkbox" name="deleteOldParsers" value="true" checked><fmt:message key='webclient.fault.eventparser.delete.oldparsers'/></td>
                </tr>
                </table></td>
          </tr>

          <tr>
            <td>&nbsp;</td>
            <td valign="top"><table width="100%" border="0" align="left" cellpadding="2" cellspacing="0" class="botBorder">
                <tr> 
                  <td height="25" colspan="3" class="header2Bg"><span class="header2"><fmt:message key='webclient.fault.eventparser.loadfile'/></span></td>
                </tr>
                <tr> 
                  <td width="26%" height="50" class="text"> &nbsp;<fmt:message key='webclient.fault.eventparser.filename'/></td>
                  <td width="20%" align="left" class="text">
                      <input name="parserFileName" type="text" class="formStyle" value="conf/event.parsers">
                  </td>
                  <td width="54%" align="left" class="text"><input name="LoadParsers" type="button" class="button" value="<fmt:message key='webclient.fault.eventparser.load'/>" onclick="javascript:loadParsers()"> 
                    <input name="Cancel" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/admin/EventParser.do';"> 
                  </td>
                </tr>
              </table></td>
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
</boby>
</html>
