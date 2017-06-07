<%-- $Id: auditDetails.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@page import="java.util.*" %>

<form>
  <table width="90%" border="0" cellspacing="0" cellpadding="0">
   
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
                       <td height="25" colspan="3" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.authaudit.auditdetails'/></span></td>
                     </tr>

 <%
                Properties p = (Properties)request.getAttribute("auditDetails");
                for(Enumeration e = p.keys() ; e.hasMoreElements() ; )
                {
                    String key = (String)e.nextElement();
                    String value = p.getProperty(key);
                    key = key.toUpperCase();
                    request.setAttribute("key",key);
                    request.setAttribute("value", value);
                    %>
                          <tr>
                             <td width="40%"mo><span class="text"><fmt:message key='${key}'/></span></td>
                             <td  class="text"><c:out value="${value}"/></td>
                         </tr>
                <%
                }
                %>

					            </td>    
          </tr>
        </table></td>
    </tr>
  </table>
</form>
