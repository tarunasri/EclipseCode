<%-- $Id: frontEndStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.serverstatus.title'/></title>
</head>


<body>
<form>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
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

                    <table width="100%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
                     <tr> 
                       <td height="25" colspan="7" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.serverstatus.fedetails'/></span></td>
					   </tr>
					   <tr>
					   <td width="3%" class="propertyLeftBg">&nbsp;</td>
					   <td width="28%" height="25" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.hostname'/></span></td>
					   <td width="15%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.ipaddress'/></span></td>
					   <td width="15%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.servertype'/></span></td>
					   <td width="15%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.commmode'/></span></td>	
					   <td width="12%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.rmi'/></span></td>
					   <td width="12%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.webserver'/></span></td>
					   </tr>

					 <c:forEach var="feList" items="${feDetails}">
					 	<c:set var="fe" value = "${feList}"/>
						<c:if test="${fe.FE_SERVER_TYPE != 'STANDBY'}">
						<tr>
						<td valign="top">&nbsp;</td>
						<c:url var="url" value="/admin/AdminServerStatus.do?toPerform=clientDetails&hostName=${fe.HOSTNAME}&hostPort=${fe.WEBSERVER_PORT}"></c:url>
						<td  class="text">
						<a href="<c:out value='${url}'/>" ><c:out value="${fe.HOSTNAME}"/> </a>
						</td>
						<c:set target="${fe}" property = "HOSTNAME" value = "${null}"/>

						<td  class="text"><c:out value="${fe.HOSTADDRESS}"/></td>
						<c:set target="${fe}" property = "HOSTADDRESS" value = "${null}"/>

						<td  class="text"><c:out value="${fe.FE_SERVER_TYPE}"/></td>
						<c:set target="${fe}" property = "FE_SERVER_TYPE" value = "${null}"/>

						<td  class="text"><c:out value="${fe.CLIENT_SERVER}"/></td>
						<c:set target="${fe}" property = "CLIENT_SERVER" value = "${null}"/>

						<td  class="text"><c:out value="${fe.RMI_REG_PORT}"/></td>
						<c:set target="${fe}" property = "RMI_REG_PORT" value = "${null}"/>

						<td  class="text"><c:out value="${fe.WEBSERVER_PORT}"/></td>
						<c:set target="${fe}" property = "WEBSERVER_PORT" value = "${null}"/>
						</tr>
						</c:if>
				 </c:forEach>

			 </td>    
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>

