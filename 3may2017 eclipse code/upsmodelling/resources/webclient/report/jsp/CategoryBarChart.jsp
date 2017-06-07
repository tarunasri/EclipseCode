 <html>
	  <head>
		<script language="javascript" src="/webclient/common/js/general.js" type="text/javascript"></script>
		<script language="javascript" src="/webclient/common/js/dashboard.js" type="text/javascript"></script>
		  
	  </head>
	  <body>
		  <%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
		<img  src="<c:out value='${filepath_barchart}'/>" width="<c:out value='${width}'/>" height="<c:out value='${height}'/>" border="0" usemap="#<c:out value='${filepath_barchart}'/>" />

	  </body>
  </html>
  <%--$Id: CategoryBarChart.jsp,v 1.2 2010/10/29 13:47:14 swaminathap Exp $--%>