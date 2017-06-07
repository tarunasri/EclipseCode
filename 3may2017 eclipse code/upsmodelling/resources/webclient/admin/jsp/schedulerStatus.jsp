<%-- $Id: schedulerStatus.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<form>
  <table width="95%" border="0" cellspacing="0" cellpadding="0">
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

                    <table width="98%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
                     <tr> 
                       <td height="25" colspan="7" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulerdetails'/></span></td>
					   </tr>
					   <tr>
					   <td width="2%">&nbsp;</td>
					   <td width="10%" height="25"<span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulerindex'/></span></td>
					   <td width="40%"<span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulername'/></span></td>
					   <td width="12%"<span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulertask'/></span></td>
					   <td width="12%"<span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulerthread'/></span></td>
					   <td width="12%"<span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.scheduleractive'/></span></td>
					   <td width="12%"<span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.scheduleridle'/></span></td>
					   </tr>

					 <c:forEach var="schdulerList" items="${schDetails}">
					 	<c:set var="schduler" value = "${schdulerList}"/>
						<tr>
						<td valign="top">&nbsp;</td>

						<td  class="text"><c:out value="${schduler.index}"/></td>
						<c:set target="${schduler}" property = "index" value = "${null}"/>

						<td  class="text"><c:out value="${schduler.descriptor}"/></td>
						<c:set target="${schduler}" property = "descriptor" value = "${null}"/>

						<td  class="text"><c:out value="${schduler.numTasks}"/></td>
						<c:set target="${schduler}" property = "numTasks" value = "${null}"/>

						<td  class="text"><c:out value="${schduler.numThreads}"/></td>
						<c:set target="${schduler}" property = "numThreads" value = "${null}"/>

						<td  class="text"><c:out value="${schduler.activeThreads}"/></td>
						<c:set target="${schduler}" property = "activeThreads" value = "${null}"/>

						<td  class="text"><c:out value="${schduler.idleThreads}"/></td>
						<c:set target="${schduler}" property = "idleThreads" value = "${null}"/>
						</tr>
				 </c:forEach>

			 </td>    
          </tr>
        </table></td>
    </tr>
  </table>
</form>

