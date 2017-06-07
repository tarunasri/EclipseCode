<%-- $Id: faultStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.modulestatus.title'/></title>
</head>


<body>
<form>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="10">&nbsp;</td>
      <td height="30" valign="bottom"><span class="header1"><fmt:message key='webclient.admin.systemadmin.modulestatus.title'/></span></td>
    </tr>
    <tr> 
      <td height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
      <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
    </tr>

    <tr> 
      <td>&nbsp;</td>
      <td valign="top"><table width="100%" border="0" cellpadding="3" cellspacing="0">
          <tr> 
            <td width="15" height="20">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr class="text"> 
            <td>&nbsp;</td>
            <td>

                    <table width="50%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
                     <tr> 
                       <td height="25" colspan="3" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.title'/></span></td>
                     </tr>

					 <tr>
					 <td align="right"  class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.eventQ'/></span></td>
					 <td  class="text"><c:out value="${faultProps.EventQ}"/></td>
					 <c:set target="${faultProps}" property = "EventQ" value = "${null}"/>
					 </tr>

					 <tr>
					 <td align="right"  class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.alertQ'/></span></td>
					 <td  class="text"><c:out value="${faultProps.AlertQ}"/></td>
					 <c:set target="${faultProps}" property = "AlertQ" value = "${null}"/>
					 </tr>

					 <tr>
					 <td align="right"  class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.trapcount'/></span></td>
					 <td  class="text"><c:out value="${faultProps.TrapCount}"/></td>
					 <c:set target="${faultProps}" property = "TrapCount" value = "${null}"/>
					 </tr>

					 <tr>
					 <td align="right"  class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.lasttraptime'/></span></td>
					 <td  class="text"><c:out value="${faultProps.LastTrapTime}"/></td>
					 <c:set target="${faultProps}" property = "LastTrapTime" value = "${null}"/>
					 </tr>

        </table></td>
    </tr>
  </table>
</form>
</body>
</html>

