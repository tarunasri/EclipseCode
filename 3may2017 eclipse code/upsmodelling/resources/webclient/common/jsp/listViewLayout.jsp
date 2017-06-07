<%-- $Id: listViewLayout.jsp,v 1.5 2007/10/22 14:49:09 gnanasekar Exp $ --%>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<tiles:insert attribute="PageIncludes"/>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="bottom">
        <td valign=bottom width="100%">
	<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1>
<fmt:message key='${displayName}'/>
		<td align="right"><tiles:insert attribute="HeaderIncludes"/></td>
        </tr>
        </table>	
	</td>
</tr>

<tr>
	<td>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="4" height="4"><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/top-left3.gif" width="4" height="4"></td>
    <td colspan="2" class="navigation2Bg"><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/spacer.gif" width="1" height="1"></td>
    <td width="4"><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/top-right3.gif" width="4" height="4"></td>
  </tr>
  <tr>
    <td class="navigation2Bg"><img src="/webclient/common/images/spacer.gif" width="1" height="1"></td>
    <td class="navigation2Bg" style="padding-left:10px;padding-right:10px;">
<tiles:insert attribute="Toolbar"/>

</td>

                        <td class="navigation2Bg" style="padding-left:10px;padding-right:10px;"> <tiles:insert attribute="PageTraversal"/>  </td>

<td class="navigation2Bg"><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/spacer.gif" width="1" height="1"></td>
  </tr>
  <tr>
    <td width="4" height="4"><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/bot-left3.gif" width="4" height="4"></td>
    <td colspan="2" class="navigation2Bg"><img src="/webclient/common/images/spacer.gif" width="1" height="1"></td>
    <td ><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/bot-right3.gif" width="4" height="4"></td>
  </tr>
</table>
        </td>
</tr>

 <tr>
	<td>
	        <table align="center" width="100%" cellpadding="0" cellspacing="0" border="0">
	        <tr>
        	<td>
		<tiles:insert attribute="StatusMessage"/> 
		</td>
		</tr>     
		</table>
	</td>
 </tr>

 <tr>
	<td><tiles:insert attribute="ListView"/></td>
 </tr>	
</table>
