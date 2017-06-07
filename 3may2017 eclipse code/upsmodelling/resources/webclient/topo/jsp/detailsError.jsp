<%-- $Id: detailsError.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
</head>


<body>
<table   border="0" align="center" cellpadding="0" cellspacing="0" >
<tr><td><br/></td></tr>
<tr><td><br/></td></tr>
<tr><td><br/></td></tr>
<tr><td><br/></td></tr>
 <c:forEach var="message" items="${messages}">
             <tr> 
               <td align=center class="errorText"><c:out value="${message}"/><br> 
                    <br> <a href="javascript:history.go(-1)" class="errorText"><fmt:message key='webclient.topo.details.click.message'/></a>
                    <span class="boldText"> <fmt:message key='webclient.topo.details.goback.message'/></span></td>
              </tr>
  </c:forEach>
</table>
</body>
</html>









