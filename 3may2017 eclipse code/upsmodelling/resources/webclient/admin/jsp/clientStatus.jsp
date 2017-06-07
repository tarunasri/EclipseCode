<%-- $Id: clientStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

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

                    <table width="75%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
                     <tr> 
                       <td height="25" colspan="7" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.serverstatus.clientdetails'/></span></td>
					   </tr>
					   <tr>
					   <td width="3%" class="propertyLeftBg">&nbsp;</td>
					   <td width="30%" height="25" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.fename'/></span></td>
					   <td width="20%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.clienttype'/></span></td>
					   <td width="20%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.username'/></span></td>
					   <td width="27%" class="propertyLeftBg"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.clientstarttime'/></span></td>
					   </tr>

					 <c:forEach var="clientList" items="${clientDetails}">
					 	<c:set var="client" value = "${clientList}"/>
						<tr>
						<td valign="top">&nbsp;</td>

						<td  class="text"><c:out value="${client.FE_SERVER_NAME}"/></td>
						<c:set target="${client}" property = "FE_SERVER_NAME" value = "${null}"/>

						<td  class="text"><c:out value="${client.CLIENT_TYPE}"/></td>
						<c:set target="${client}" property = "CLIENT_TYPE" value = "${null}"/>

						<td  class="text"><c:out value="${client.USER_NAME}"/></td>
						<c:set target="${client}" property = "USER_NAME" value = "${null}"/>

						<td  class="text"><c:out value="${client.CLIENT_TIME}"/></td>
						<c:set target="${client}" property = "CLIENT_TIME" value = "${null}"/>
						</tr>
				 </c:forEach>

			 </td>    
          </tr>
        </table></td>
    </tr>
  </table>
</form>
</body>
</html>

