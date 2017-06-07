<%-- $Id: ChartsWidget.jsp,v 1.2 2010/10/29 13:47:09 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="java.math.*"%>
<html>


<c:if test="${barchart eq true}">
<br><img src="<c:out value='${filepath_barchart}'/>" border="0" usemap="#<c:out value='${filepath_barchart}'/>"> 
</c:if>

<c:if test="${piechart eq true}">
 <img  src="<c:out value='${homeacc_filepath}'/>" border="0" usemap="#<c:out value='${homeacc_filepath}'/>" >

</c:if>
</html>
