<%-- $Id: serverLogs.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.serverlogs.title'/></title>
</head>


<body>
<form>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">

     <c:choose>

       <c:when test="${!empty warningMessage}">
    
          <tr> 
            <td width="10">&nbsp;</td>
            <td height="30" valign="bottom"><span class="errorText"><c:out value="${warningMessage}"/></span></td>
          </tr>
    
       </c:when>

       <c:otherwise>
          
         <tr> 
          <td width="10">&nbsp;</td>
          <td valign="bottom" height="30"><span class="header1"><fmt:message key='webclient.admin.systemadmin.serverlogs.index'><fmt:param value='${param.directory}'/></fmt:message></span></td>
         </tr>

         <tr> 
          <td height="1"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
          <td height="1" class="hline"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
         </tr>
      
       </c:otherwise>       

    </c:choose>

    <c:if test="${!empty message}">           
        <tr> 
           <td>&nbsp;</td>
           <td height="30"><span class="responseText"><c:out value="${message}"/></span></td>
         </tr>
    </c:if>

    <tr> 
      <td>&nbsp;</td>
      <td valign="top">
       <table width="70%" border="0" cellpadding="3" cellspacing="0" class="botBorder">
          <tr class="boldText">
            <td width="3%">&nbsp;</td>
            <td width="20%"><fmt:message key='webclient.admin.systemadmin.serverlogs.name'/></td>
            <td width="35%"><fmt:message key='webclient.admin.systemadmin.serverlogs.modified'/></td>
            <td width="12%"><fmt:message key='webclient.admin.systemadmin.serverlogs.size'/></td>
          </tr>

     <c:if test="${!empty directoryList}">
                
       <c:forEach var="directory" items="${directoryList}">         

           <tr class="text"> 
             <td valign="top">&nbsp;</td>
             <td valign="top"><img src="/webclient/admin/images/folder.gif" hspace="2" width="13" height="16" align="left"> 
              <a href="/logs/<c:out value='${directory.key}'/>" target="_top"><c:out value="${directory.key}"/></a></td>
             <td valign="top"><c:out value="${directory.value}"/></td>
             <td valign="top">-</td>
          </tr>

       </c:forEach>          

     </c:if>

     <c:if test="${!empty filesList}">

       <c:forEach var="list" items="${filesList}">

           <tr class="text">
             <td valign="top">&nbsp;</td>
             <td valign="top"><img src="/webclient/admin/images/textfile.gif" hspace="2" width="13" height="16" align="left"> 
              <a href="/<c:out value='${param.directory}'/>/<c:out value="${list.key}"/>" target="_new"><c:out value="${list.key}"/></a>
             </td>

            <c:forEach var="count" items="${list.value}">
             <td valign="top"><c:out value="${count.key}"/></td>
             <td valign="top"><c:out value="${count.value}"/></td>
            </c:forEach>
 
          </tr> 
  
      </c:forEach>
     </c:if>


        </table></td>
    </tr>
  </table>

</form>
</body>
</html>
