<%-- $Id: snmpOIDsQueryResults.jsp,v 1.3 2007/10/18 06:25:06 gnanasekar Exp $ --%>


<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<BODY>

<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.topo.snmpquery.header'> 
              <fmt:param value="${querySnmpOIDsForm.map.mibTableName}"/> <fmt:param value="${querySnmpOIDsForm.map.HOST}"/> 
              </fmt:message>
</h1></td>
  </TR>

</TABLE>

<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
        <table width="100%"  cellspacing="0" cellpadding="0" border="0">
  
  <TR vAlign=top>
        <td>&nbsp;</td>
        <TD align=left vAlign=top> 
        <c:choose> <c:when test='${empty errorString}'>
        <TABLE class=botBorder width="100%" cellSpacing=0 cellPadding=4 border=0>
            <TR class="header2Bg" id=high vAlign=center align=middle> <c:forEach items="${columns}" var="item" > 
              <TD width=200 align = "left"><SPAN class="text"><c:out value='${item}'/></SPAN></TD>
              </c:forEach> </TR>
            <c:forEach var="row" items="${queryResult}" varStatus="status" > 
            <TR> <c:forEach var="cell" items="${row}" varStatus="colStatus"> 
              <TD align=left valign="top" class=text><c:out value='${cell}'/></TD>
              </c:forEach> </TR>
            </c:forEach> 
        </TABLE>
        </c:when> <c:otherwise> <SPAN class=boldtext><c:out value='${errorString}'/></SPAN> 
        </c:otherwise> </c:choose> 
        </TD>
    </TR>

 </table>
	
	
	</td>
 <td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</BODY>
