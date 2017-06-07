<%-- $Id: portStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

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

                    <table width="50%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
                     <tr> 
                       <td height="25" colspan="3" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.serverstatus.portdetails'/></span></td>
                     </tr>

					 <tr>
					 <td width="60%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.rmi'/></span></td>
					 <td  class="text"><c:out value="${portProps.RMI}"/></td>
					 <c:set target="${portProps}" property = "RMI" value = "${null}"/>
					 </tr>

					 <tr>
					 <td><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.nmsbe'/></span></td>
					 <td  class="text"><c:out value="${portProps.NMS_BE}"/></td>
					 <c:set target="${portProps}" property = "NMS_BE" value = "${null}"/>
					 </tr>

					 <tr>
					 <td><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.webserver'/></span></td>
					 <td  class="text"><c:out value="${portProps.WEBSERVER}"/></td>
					 <c:set target="${portProps}" property = "WEBSERVER" value = "${null}"/>
					 </tr>

					 <tr>
					 <td><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.webcontainer'/></span></td>
					 <td  class="text"><c:out value="${portProps.WEBCONTAINER}"/></td>
					 <c:set target="${portProps}" property = "WEBCONTAINER" value = "${null}"/>
					 </tr>

					 <tr>
					 <td><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.tomcatshutdown'/></span></td>
					 <td  class="text"><c:out value="${portProps.TOMCAT_SHUTDOWN}"/></td>
					 <c:set target="${portProps}" property = "TOMCAT_SHUTDOWN" value = "${null}"/>
					 </tr>

					 <tr>
					 					 
					 <td><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.trap'/></span></td>
					 <td  class="text"><c:out value="${portProps.TRAP}"/></td>
					 <c:set target="${portProps}" property = "TRAP" value = "${null}"/>

					 
					 </td>
					 </tr>
					 
				 </td>    
          </tr>
        </table></td>
    </tr>
  </table>
</form>
