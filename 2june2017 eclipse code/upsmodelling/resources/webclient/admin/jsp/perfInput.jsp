<%-- $Id: perfInput.jsp,v 1.4 2007/10/05 11:19:11 gnanasekar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<%@include file="/webclient/admin/jspf/PerfInputFunction.jspf" %>
<script language="javascript" src="/webclient/common/js/validation.js"></script>
</head>

<body onLoad = "document.perfInputForm.name.focus();">

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key="webclient.admin.systemadmin.modulestatus.perf.viewdata"/>
</h1></td>
	        <td align="right"></td>
        
        </tr>
</table>

<form name="perfInputForm" action="/admin/PerfModuleStatus.do" method="POST" onSubmit="return Validate()">
<table style="margin-bottom:10px;" width="50%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >          
        <table width="100%" border="0" align="left" cellpadding="5" cellspacing="0">
              <tr align="left" valign="top"> 
                <td colspan="3" align="right" valign="middle" class="text"></td>
              </tr>
              <tr align="left" valign="top"> 
                <td colspan="3" align="left" valign="middle" class="text"><fmt:message key="webclient.admin.systemadmin.modulestatus.perf.message"/></td>
              </tr>
              <tr align="left" valign="top"> 
                <td width="91" class="text"><fmt:message key="webclient.admin.systemadmin.modulestatus.perf.nodename"/></td>
                <td width="189"> <input name="name" type="text" class="formStyle"></td>
                <td width="190"><input name="Submit" type="submit" class="button" value='<fmt:message key="webclient.admin.systemadmin.modulestatus.perf.submit"/>'> 
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
</form>
</body>
</html>
