<%-- $Id: backEndStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<form>
  <table width="90%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="10">&nbsp;</td>
      <td height="30" valign="bottom"><span class="header1"><fmt:message key='webclient.admin.systemadmin.serverstatus.title'/></span></td>
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

                    <table width="70%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
                     <tr> 
                       <td height="25" colspan="3" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.serverstatus.serverdetails'/></span></td>
                     </tr>

					 <tr>
					 <td width="40%"mo><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.hostname'/></span></td>
					 <td  class="text"><c:out value="${beProps.HostName}"/></td>
					 <c:set target="${beProps}" property = "HostName" value = "${null}"/>
					 </tr>

					 <tr>
					 <td width="40%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.ipaddress'/></span></td>
					 <td  class="text"><c:out value="${beProps.IPAddress}"/></td>
					 <c:set target="${beProps}" property = "IPAddress" value = "${null}"/>
					 </tr>

					 <tr>
					 <td width="40%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.starttime'/></span></td>
					 <td  class="text"><c:out value="${beProps.StartTime}"/></td>
					 <c:set target="${beProps}" property = "StartTime" value = "${null}"/>
					 </tr>

					 <tr>
					 <td width="40%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.osname'/></span></td>
					 <td  class="text"><c:out value="${beProps.OSName}"/></td>
					 <c:set target="${beProps}" property = "OSName" value = "${null}"/>
					 </tr>

					 <tr>
					 <td width="40%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.database'/></span></td>
					 <td  class="text"><c:out value="${beProps.DBName}"/></td>
					 <c:set target="${beProps}" property = "DBName" value = "${null}"/>
					 </tr>

					 <tr>
					 <td width="40%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.totalMem'/></span></td>
					 <td  class="text"><c:out value="${beProps.TotalMemory}"/></td>
					 <c:set target="${beProps}" property = "TotalMemory" value = "${null}"/>
					 </tr>

					 <tr>
					 <td width="40%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.freeMem'/></span></td>
					 <td  class="text"><c:out value="${beProps.FreeMemory}"/></td>
					 <c:set target="${beProps}" property = "FreeMemory" value = "${null}"/>
					 </tr>
					 </td>    
          </tr>
        </table></td>
    </tr>
  </table>
</form>
