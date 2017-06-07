<%-- $Id: mapLayout.jsp,v 1.4 2010/10/29 13:47:10 swaminathap Exp $ --%>

 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN">
<html>
<head>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
</head>

<body>
<html>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	 
   <tr> 
     <td align="left" valign="top"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr> 
           <td colspan="2" align="left" valign="top"> 
		     <tiles:insert attribute="Header"/>
           </td>
           </tr>
        </table>
    <br> </td> 
    </tr> 
     <tr>	  	  
        <td align="left" valign="top"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
           <tr> 
           <td colspan="2" align="left" valign="top"> 
		     <tiles:insert attribute="Body"/> 
           </td>
           </tr>
        </table>
    <br> </td>
    </tr>
</html>
</table>
<br>
<br>
<br>
<br>
<br>
</body>
</html>
