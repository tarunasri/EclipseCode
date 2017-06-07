<!--$Id: QueryTableResult.jsp,v 1.3 2007/10/16 14:00:09 sumitha Exp $-->
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<table width="100%" cellpadding=2 cellspacing=0 border=0 class="tableLightHeader"> 
<tr>
    <td class="blueband2" align="left" width=100 nowrap><a href="javascript:showLoading('theTableResponse')">[X]</a></td>
    <td class="blueband2">&nbsp;</td>
    <td class="blueband2" align="right"><a href="javascript:showLoading('theTableResponse')">[X]</a></td>
<tr>
<tr>
    <td colspan=3>
	<%@ include file="/webclient/common/jspf/TopBorder.jspf" %>
	<table width="400" cellpadding=2 cellspacing=0 border=0 class="tableLightHeader"> 
	<tr>
	    <td class="blueband2"><fmt:message key="webclient.mibbrowser.tableresult"/></td>
	</tr>
	<tr>
	    <td class="txtGlobal"><c:out value='${result.tablestr}' escapeXml="false"/> </td>
	</tr>
	</table>
	<%@ include file="/webclient/common/jspf/BottomBorder.jspf" %>
    </td>
</tr>
<tr>
    <td class="blueband2" align="left" width=100><a href="javascript:showLoading('theTableResponse')">[X]</a></td>
    <td class="blueband2">&nbsp;</td>
    <td class="blueband2" align="right"><a href="javascript:showLoading('theTableResponse')">[X]</a></td>
<tr>
	
</table>
