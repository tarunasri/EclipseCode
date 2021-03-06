<%-- $Id: printableEventList.jsp,v 1.4 2007/10/18 11:15:16 gnanasekar Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key="webclient.fault.eventlist.print.title"><fmt:param value="${displayName}"/></fmt:message></title>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %> 
</head>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding:14px;">
	
	<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><c:out value="${displayName}"/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
    <%@ include file="/webclient/common/jspf/printPage.jspf"%>
<td class="generalCurveRight">&nbsp;&nbsp;</td>
    <tr> 
    <td class="generalCurveLeft">&nbsp;</td>
    <td>
	
	
	
	
    <table width="100%" border="0" cellspacing="1" cellpadding="3" align="left">
    <tr class="header2Bg">
     <c:forEach var="value" items="${headerList}">
           <c:set var="val" value="${value.columnName}"/>
       <td
             <c:if test="${val == 'severity'}">
                   colspan="2"
             </c:if>
                  class="header2">
                 <fmt:message key='webclient.fault.event.${value.columnName}'/>


                 <c:if test='${value.columnName == orderByColumn}'>
                 <c:choose>
                    <c:when test="${param.isAscending == 'true'}">
                       <img src="/webclient/common/images/sortup.gif" border=0 width="11" height="7" hspace="2" vspace="1">
                   </c:when>
                   <c:otherwise>
                       <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1" >
                  </c:otherwise>
                </c:choose>
            </c:if>
           <c:if test="${empty orderByColumn}"> 
               <c:if test="${value.columnName == 'id'}">
                  <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1">
               </c:if>
           </c:if>
       </td>
     </c:forEach>

     <c:forEach var="prop" items="${viewData}" varStatus="status" >
           <c:choose>
              <c:when test="${status.count%2==1}">
                 <TR class="rowOdd">
              </c:when>
              <c:otherwise>
                 <TR class="rowEven">
              </c:otherwise>
          </c:choose>

        <c:forEach var="value1" items="${headerList}">
           <c:set var="val" value="${value1.columnName}"/>

           <c:choose>
             <c:when test="${val == 'severity'}">
                 <td width="2%" class="text"><img src="<c:out value="${prop.imgsrc}" />" border=0 width="16" height="16" hspace="1"></td>
             </c:when>
          </c:choose>
                  <TD class=text nowrap><c:out value="${prop[val]}"/></TD>
    </c:forEach>
   </TR>
</c:forEach>
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
</td>
  </tr>
</table>
</html>
