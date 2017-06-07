<%-- $Id: searchHeader.jsp,v 1.3 2007/09/18 14:14:32 gnanasekar Exp $ --%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<fmt:message key='webclient.fault.operations.search.header'/>
</h1></td>
	        <td align="right"></td>
        
        </tr>
</table>

        <html-el:hidden  name="searchForm" property="actionToPerform" />

