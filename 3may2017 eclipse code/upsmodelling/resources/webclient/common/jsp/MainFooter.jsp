<%-- $Id: MainFooter.jsp,v 1.2 2010/10/29 13:47:02 swaminathap Exp $ --%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="footer" valign="top">
<c:if test="${initParam.showPageLoadingTime == 'true'}">
        <%
     long endTime = System.currentTimeMillis();
     Long start = (Long)request.getAttribute("startTime");
     long loadingtime = 0;
     if(start != null)
     {
        long startTime = start.longValue();
        loadingtime = endTime - startTime;
     }
  %>
        Loading Time : <%= loadingtime %> ms </c:if>
    </td>
  </tr>
</table>
