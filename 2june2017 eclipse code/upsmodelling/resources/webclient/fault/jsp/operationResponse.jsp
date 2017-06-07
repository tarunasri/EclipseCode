
<%-- $Id: operationResponse.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<HTML><HEAD><TITLE>Operation Response</TITLE>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<SCRIPT language=JavaScript type=text/JavaScript>

function reloadListView(url)
{
    location.href = url;
}
</SCRIPT>
</HEAD>

<BODY class=navbg text=#000000 leftMargin=0 topMargin=0 marginwidth="0" 
marginheight="0">

     <c:url var="url" value="AlarmView.do?viewId=${param.viewId}&displayName=${param.displayName}&isAscending=${param.isAscending}&FROM_INDEX=${param.FROM_INDEX}&PAGE_NUMBER=${param.PAGE_NUMBER}&orderByColumn=${param.orderByColumn}"> </c:url>

    <c:url var="detailsPage" value=" "></c:url>


<TABLE width=100% border="0" align=left cellPadding=0 cellSpacing=0 bgcolor="#FFFFFF">
  <TBODY>
  <c:if test="${!empty failure}">
    <TR> 
      <TD class="tableheader-bg" vAlign=center align=left height=30><TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
          <TBODY>
            <TR> 
              <TD align="center" class="reportsOddRow table-header"><c:out value='${message}'/><fmt:message key='webclient.fault.alarm.operations.failure.title'><fmt:param value="${process}"/></fmt:message></TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
    <TR> 
      <TD class=propertyright-bg vAlign=top align=middle height=30> <TABLE class="botBorder" cellSpacing=0 cellPadding=4 width=540 border=0>
          <TBODY>
            <TR> 
              <TD width=16>&nbsp;</TD>
              <TD width=80 nowrap><SPAN class=boldtext><fmt:message key="webclient.fault.customview.field.entity"/></SPAN></TD>
              <TD width=460><SPAN class=boldtext><fmt:message key="webclient.fault.customview.reason"/></SPAN></TD>
            </TR>
            <c:forEach var="item" items="${failure}"  varStatus="status"> 
            <TR vAlign=top align=left> 
              <TD align=right><SPAN class=text><c:out value='${status.index+1}'/></SPAN></TD>
              <TD nowrap><SPAN class=text><A href="/fault/AlarmDetails.do?method=traversePage&tab=tabOne&entity=<c:out value='${item.key}'/>" ><c:out value='${item.key}'/> 
                </A></SPAN></TD>
              <TD><SPAN class=text><c:out value='${item.value}'/></SPAN></TD>
            </TR>
            </c:forEach> 
            <TR vAlign=top align=left>
        <%--      <TD align=right>&nbsp;</TD>
              <TD>&nbsp;</TD>
              <TD>&nbsp;</TD>--%>
            </TR>

          </TBODY>
        </TABLE></TD>
   </TR>
</c:if>
<c:if test="${!empty success}">
    <TR> 
      <TD class=tableheader-bg vAlign=center align=middle height=38><TABLE cellSpacing=0 cellPadding=3 width="100%" border=0>
          <TBODY>
            <TR> 
              <TD width=15><IMG height=15 hspace=4  src="/webclient/common/images/tick.gif" width=15></TD>
              <TD class=table-header width=537><fmt:message key='webclient.fault.alarm.operations.success.title'/></TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
    <TR> 
      <TD class=propertyright-bg vAlign=center align=middle height=38><TABLE class=botBorder cellSpacing=0 cellPadding=4 width=560 border=0>
          <TBODY>
            <TR> 
              <TD width=16>&nbsp;</TD>
              <TD width=60><SPAN class=boldtext><fmt:message key="webclient.fault.customview.field.entity"/></SPAN></TD>
            </TR>
            <c:forEach var="item" items="${success}"  varStatus="status"> 
            <TR vAlign=top align=left> 
              <TD align=right><SPAN class=text><c:out value='${status.index+1}'/></SPAN></TD>
              <TD><SPAN class=text><c:out value='${item}'/> 
                </A></SPAN></TD>
            </TR>
            </c:forEach> 
            <TR vAlign=top align=left> 
              <TD>&nbsp;</TD>
              <TD colspan="2">&nbsp;</TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
</c:if>
    <TR> 
      <TD class=framebg vAlign=center align=middle height=38><table height="35" width="668" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="97" align="left" valign="top" >&nbsp; </td>
            <td width="560" align="left" valign="middle"> <input class=sbttnnew type=submit value="Go Back" name="backbutton" onClick="history.back();">
              &nbsp;&nbsp; <input name="reloadButton" type=button class=sbttnnew onClick="reloadListView('<c:out value="${url}"/>');" value="Reload List"></td>
            <td width="11" align="center">&nbsp;</td>
          </tr>
        </table></TD>
    </TR>
  </TBODY>
</TABLE>
</BODY></HTML>
