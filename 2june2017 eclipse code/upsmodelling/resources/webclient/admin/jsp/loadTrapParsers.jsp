<%-- $Id: loadTrapParsers.jsp,v 1.3 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.fault.trapparser.title'/></title>
</head>

<script language="Javascript" SRC="/webclient/admin/js/trapParserAdmin.js" type="text/javascript"></script>
<script type="text/javascript" language="JavaScript" src="/webclient/common/js/validation.js"></script>

<body>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.fault.trapparser.link.loadparsers'/>
</h1></td>
</tr>
</table>

<form action="/admin/TrapParserOperations.do" name="loadParser" onSubmit="return false;">

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
            <td valign="top"> <table width="100%" border="0" align="left" cellpadding="2" cellspacing="0">
                <tr> 
                  <td height="30" colspan="3" class="text"> 
                   <input type="checkbox" name="overWriteParsers" value="yes" checked><fmt:message key='webclient.fault.trapparser.overwrite'/></td>
                </tr>
                <tr> 
                  <td height="25" colspan="3" class="header2Bg"><span class="header2"><fmt:message key='webclient.fault.trapparser.loadmib'/></span></td>
                </tr>
                <tr> 
                  <td width="26%" height="50" class="text">&nbsp;<fmt:message key='webclient.fault.trapparser.loadmib.mibname'/></td>
                      <td width="20%" align="left" class="text">

                      <select name="selectedMib">

                       <c:forEach var="list" items="${mibsList}">
                         <option><c:out value="${list}"/></option>
                       </c:forEach>
                      
                      </select>

                   </td>
                  <td width="54%" align="left" class="text">
                      <input name="LoadMib" type="button" class="button" value="<fmt:message key='webclient.fault.trapparser.load'/>" onclick="javascript:loadMibs()"> 
                      <input name="Cancel" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/admin/TrapParser.do';"> 
                  </td>
                </tr>
              </table></td>
          </tr>

          <tr>
            <td>&nbsp;</td>
            <td valign="top"><table width="100%" border="0" align="left" cellpadding="2" cellspacing="0">
                <tr> 
                  <td height="25" colspan="3" class="header2Bg"><span class="header2"><fmt:message key='webclient.fault.trapparser.loadfile'/></span></td>
                </tr>
                <tr> 
                  <td width="26%" height="50" class="text"> &nbsp;<fmt:message key='webclient.fault.trapparser.loadmib.filename'/></td>
                  <td width="20%" align="left" class="text">
                      <input name="parserFileName" type="text" class="formStyle" value="conf/trap.parsers">
                  </td>
		  <td width="54%" align="left" class="text"><input name="LoadParsers" type="button" class="button" value="<fmt:message key='webclient.fault.trapparser.load'/>" onclick="javascript:loadParsers('<fmt:message key="webclient.fault.eventparser.saveparser.provide.filename"/>')"> 
                    <input name="Submit222" type="button" class="button" value="<fmt:message key='webclient.fault.event.customview.button.cancel'/>" onclick="javascript:location.href='/admin/TrapParser.do';"> 
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
