<%--$Id: StandbyServerDetails.jsp,v 1.5 2010/10/29 13:46:54 swaminathap Exp $--%>
<%@ taglib uri = "http://www.adventnet.com/webclient/component-tags" prefix="component" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<%@include file="/webclient/common/jspf/ModalPopup.jspf" %>
<html>
<head>
<style>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/admin/js/jvmsorttable.js"></SCRIPT>
<script language="javascript" SRC="/webclient/common/js/navigation.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
</script>
</style>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
<tr><td align="center">
 <table style="margin-bottom:10px;" width="98%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key="webclient.admin.mgmtgui.standbydetails"/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" ><br>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
   <c:if test="${empty STANDBY}">
	<br><br><br>
      	<center><i><span style="color: #003399;font-family"><fmt:message key='webclient.admin.mgmtgui.standbyempty'/></span></i></center>
	<br><br><br>
      </c:if>
      <c:if test="${!empty STANDBY}">
   <tr height=22 class="reportsOddRow">
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyhostname'/></span></td>
	<td  class="text"><c:out value="${STANDBY.HOSTNAME}"/></td>
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyhostaddress'/></span></td>
	<td  class="text"><c:out value="${STANDBY.HOSTADDRESS}"/></td>
        </tr>

        <tr height=22 class="reportsEvenRow">
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyretryperiod'/></span></td>
	<td  class="text"><c:out value="${STANDBY.MAX_RETRY_PERIOD} mSec"/></td>
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyversion'/></span></td>
	<td  class="text"><c:out value="${STANDBY.WebNMSVersion}"/></td>
        </tr>

        <tr height=22 class="reportsOddRow">
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyosdetails'/></span></td>
	<td  class="text"><c:out value="${STANDBY.OSName} ${STANDBY.OSVersion}"/></td>
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyosarch'/></span></td>
	<td  class="text"><c:out value="${STANDBY.OSArch}"/></td>
        </tr>

        <tr height=22 class="reportsEvenRow">
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyvmversion'/></span></td>
	<td  class="text"><c:out value="Java ${STANDBY.VMVersion}"/></td>
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.standbyvmvendor'/></span></td>
	<td  class="text"><c:out value="${STANDBY.VMVendor}"/></td>
        </tr>

        <tr height=22 class="reportsOddRow">	
        <td align="center"><span class="boldText"><fmt:message key='webclient.admin.mgmtgui.rmiregistryport'/></span></td>
	<td  class="text"><c:out value="${STANDBY.RMI_REG_PORT}"/></td>
        <td  class="text" colspan="2">&nbsp;</td>
        </tr> 
	</c:if>
</table>
	<table align="center" style="margin-top:5px;margin-bottom:5px;" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><input type='submit' value='<fmt:message key='webclient.admin.mgmtui.ok'/>' class='buttonNew' name='Submit2' onClick="javascript:window.close()"/></td>
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
		  
</td></tr></table>
</body>
