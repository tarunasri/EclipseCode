<%-- $Id: operationResponse.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

 <SCRIPT language=JavaScript type=text/JavaScript>
 <!--
 function reloadListView(url)
 {
       location.href = url;
 }

 //-->
 </SCRIPT>


<META content="MSHTML 6.00.2800.1226" name=GENERATOR></HEAD>
<BODY >
     <c:url var="url" value="NetworkInventory.do?viewId=${param.viewId}&displayName=${param.displayName}&isAscending=${param.isAscending}&FROM_INDEX=${param.FROM_INDEX}&PAGE_NUMBER=${param.PAGE_NUMBER}&orderByColumn=${param.orderByColumn}"> </c:url>

<TABLE width=100% border=0 " align=left cellPadding=0 cellSpacing=0 >
  <TBODY>
<c:if test="${!empty success}">
    <TR> 
      <TD class=header1Bg vAlign=center align=middle>
<TABLE width="100%" border=0 cellPadding=3 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD width=15 height="40"><IMG height=15 hspace=4  src="/webclient/common/images/tick.gif" width=15></TD>
              <TD class=header1><fmt:message key='webclient.topo.operations.response.success'/> 
              </TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
    <TR> 
      <TD class=propertyBg vAlign=center align=middle height=38><TABLE class=botBorder cellSpacing=0 cellPadding=4 width=560 border=0>
          <TBODY>
            <TR> 
              <TD width=16>&nbsp;</TD>
              <TD width=60><SPAN class=boldtext><fmt:message key='webclient.topo.operations.response.name'/></SPAN></TD>
            </TR>
            <c:forEach var="item" items="${success}"  varStatus="status"> 
            <TR vAlign=top align=left> 
              <TD align=right><img src=/webclient/common/images/trans.gif border=0 width="10" height="0"></TD>
              <TD><SPAN class=text><A href="/topo/objectdetails.do?name=<c:out value='${item}'/>" ><c:out value='${item}'/> 
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
<c:if test="${!empty failure}">
    <TR> 
      <TD align=left vAlign=center class=header1Bg> 
        <TABLE width="100%" border=0 cellPadding=3 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD width=15 height="40"><IMG height=15 hspace=4 src="/webclient/topo/images/negativeRes.gif" width=15></TD>
              <TD class=header1><c:out value='${message}'/> </TD>
            </TR>
          </TBODY>
        </TABLE></TD>
    </TR>
    <TR> 
      <TD class=propertyBg vAlign=top align=left height=30> 
        <TABLE width=560 border=0 align="left" cellPadding=4 cellSpacing=0 class=botBorder>
          <TBODY>
            <TR> 
              <TD height="5" colspan="3"><img src="/webclient/common/images/trans.gif" width="1" height="1"></TD>
            </TR>
            <TR> 
              <TD width=16>&nbsp;</TD>
              <TD width=60><SPAN class=boldtext><fmt:message key='webclient.topo.operations.response.name'/></SPAN></TD>
              <TD width=460><SPAN class=boldtext><fmt:message key='webclient.topo.operations.response.reasons'/></SPAN></TD>
            </TR>
            <c:forEach var="item" items="${failure}"  varStatus="status"> 
            <TR vAlign=top align=left> 
              <TD align=right><img src=/webclient/common/images/trans.gif border=0 width="10" height="0"></TD>
              <TD><SPAN class=text><A href="/topo/objectdetails.do?name=<c:out value='${item.key}'/>" ><c:out value='${item.key}'/> 
                </A></SPAN></TD>
              <TD><SPAN class=text><c:out value='${item.value}'/></SPAN></TD>
            </TR>
            </c:forEach> 
            <TR vAlign=top align=left> 
              <TD align=right>&nbsp;</TD>
              <TD>&nbsp;</TD>
              <TD>&nbsp;</TD>
            </TR>
          </TBODY>
        </TABLE>
        <br>
      </TD>
   </TR>
</c:if>
    <TR> 
      <TD class="propertyHeader" vAlign=center align=middle height=38><table height="35" width="668" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="97" align="left" valign="top" >&nbsp; </td>
            <td width="560" align="left" valign="middle"> <input class=button type=submit value="<fmt:message key='webclient.topo.operations.response.back'/>" name="backbutton" onClick="history.back();">
<!--
              &nbsp;&nbsp; <input name="reloadButton" type=button class=button onClick="reloadListView('<c:out value="${url}"/>');" value="<fmt:message key='webclient.topo.operations.response.reloadlist'/>"> 
-->
</td>
            <td width="11" align="center">&nbsp;</td>
          </tr>
        </table></TD>
    </TR>
  </TBODY>
</TABLE>
</BODY></HTML>
