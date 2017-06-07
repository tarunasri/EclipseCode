<%-- $Id: objectDetailsHeader.jsp,v 1.2 2007/09/14 11:51:08 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<%@ page import="java.util.*" %>

<%-- 
    for(Enumeration en=request.getAttributeNames();en.hasMoreElements();)
    {
        String key = (String)en.nextElement();
        out.println("The key is "+key);
        out.println("The value is "+request.getParameter(key));
    }
--%>


<TABLE width="100%" class="pageHeaderStr" border=0 cellPadding=0 cellSpacing=0>
    <TR>    
    <TD vAlign=bottom align=left >
     <h1>  <c:if test="${! empty ObjectDetailsBean.map.typeImage}">
  <c:out value='${ObjectDetailsBean.map.name}'/>
</c:if></h1>	 </TD>
</TD>
</TR>
</TABLE>


