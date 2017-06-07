<%-- $Id: ShowReports.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>

<script>
    function viewPDF(fileName)
    {
       window.open(fileName,"_top");
    }
    </script>

</head>

<body onLoad="javascript:viewPDF('<c:out value='${PDFFile}'/>')">  
</body>

</html>

