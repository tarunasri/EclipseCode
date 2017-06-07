<%-- $Id: discStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

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

                    <table width="60%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
                     <tr> 
                       <td height="25" colspan="4" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.subtilte'/></span></td>
                     </tr>
					 
					 <tr>
					 <td>&nbsp;</td>
					 <td width="60%"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.network'/></span></td>
					 <td  class="text"><c:out value="${discProps.networkCount}"/></td>
					 <c:set target="${discProps}" property = "networkCount" value = "${null}"/>
					 </tr>

					 <tr>
					 <td>&nbsp;</td>
					 <td width="60%"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.mo'/></span></td>
					 <td  class="text"><c:out value="${discProps.moCount}"/></td>
					 <c:set target="${discProps}" property = "moCount" value = "${null}"/>
					 </tr>

					 <tr>
					 <td>&nbsp;</td>
					 <td width="60%"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.node'/></span></td>
					 <td  class="text"><c:out value="${discProps.nodeCount}"/></td>
					 <c:set target="${discProps}" property = "nodeCount" value = "${null}"/>
					 </tr>

					 <tr>
					 <td>&nbsp;</td>
					 <td width="60%"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.interface'/></span></td>
					 <td  class="text"><c:out value="${discProps.interfaceCount}"/></td>
					 <c:set target="${discProps}" property = "interfaceCount" value = "${null}"/>
					 </tr>

					 <tr>
					 <td width="15" height="20">&nbsp;</td>
					 <td>&nbsp;</td>
					 </tr>

					 <tr>
					 <td height="25" colspan="4" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.networktitle'/></span></td>
					 </tr>
					 <tr>
					 <td width="2%">&nbsp;</td>
					 <td width="24%" height="25"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.networkip'/></span></td>
					 <td width="36%"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.lastdisc'/></span></td>
					 <td width="36%"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.nextdisc'/></span></td>
					 </tr>

					<c:forEach var="networkDetails" items="${networkDiscDetails}"> 
						<c:set var="network" value = "${networkDetails}"/>
						<tr>
							<td valign="top">&nbsp;</td>
							<c:forEach var="detail" items="${network}">
							<td  class="text"><c:out value="${detail}"/></td>
							</c:forEach>
						</tr>
					</c:forEach>
					 

        </table></td>
    </tr>
  </table>
</form>
