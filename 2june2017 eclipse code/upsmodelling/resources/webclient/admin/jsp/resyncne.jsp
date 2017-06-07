<%-- $Id: resyncne.jsp,v 1.2 2007/09/14 10:09:47 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.admin.systemadmin.resyncne.title'/></title>
	<script language="javascript" src="/webclient/admin/js/AdminOperations.js" ></script>
</head>

<body>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><h1><fmt:message key='webclient.admin.systemadmin.resyncne.title'/></h1></td>
        </tr>
      </table>


<DIV id="inprogress_msg" STYLE="position:absolute;z-index:5;top:30%;left:42%;visibility:hidden">
	<TABLE  class="progressMsgTable">
    	<TR>
			<TD align="center"><fmt:message key='webclient.admin.systemadmin.resyncne.inprogress.title'/> </TD>
		</TR>
	</TABLE>
</DIV>

<form action="/admin/NEresync.do">
<input type="hidden" name="toPerform" value="resyncNEs" >
<c:choose>
<c:when test="${!empty message}">
    
    <p align="center"><span class="responseText"><c:out value="${message}"/></span></p>
    
</c:when>
<c:otherwise>
    
  <table align="center" class="messageStyle" width="60%" border="0" cellspacing="0" cellpadding="6">

    <tr> 
      <td align="center" valign="top" class="text">
	  
	  <fmt:message key='webclient.admin.systemadmin.resyncne.nobackup.text'/><br><br>

<fmt:message key='webclient.admin.systemadmin.conformation'/>
	  
	  </td>
    </tr>
    <tr> 
      <td align="center"> 
          <input name="confirm" type="submit" class="button" value="<fmt:message key='webclient.admin.systemadmin.conformation.yes'/>"  onClick="showProgress()" > 
          <input name="confirm" type="button" class="button" value="<fmt:message key='webclient.admin.systemadmin.conformation.no'/>" onClick="javascript:history.back()"> 
      </td>
    </tr>
  </table>
</c:otherwise>
</c:choose>

</form>

</body>

</html>
