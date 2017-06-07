<%-- $Id: searchHeader.jsp,v 1.2 2007/09/14 11:52:50 gnanasekar Exp $ --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<fmt:message key='webclient.topo.search.headertext'/>
</h1></td>
	        <td align="right"></td>
        
        </tr>
</table>


        <html-el:hidden  name="searchForm" property="actionToPerform" />

