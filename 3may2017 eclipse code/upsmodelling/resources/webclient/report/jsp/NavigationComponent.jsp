<%-- $Id: NavigationComponent.jsp,v 1.4 2007/10/18 06:28:28 gnanasekar Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="tree" uri="http://www.adventnet.com/webclient/tree-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
	  
	  
	  
 <table width="100%" cellpadding=0 cellspacing=0 border=0 align="left">
    <tr>
    <td>
           <c:forEach var="prop1" items="${Hash}" varStatus="status">
            <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td ><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/leftsiteL.gif" border="0" width="5" height="27"></td>
          <td  nowrap class="generalCurveTopLeftBg" style="padding-right:10px;"><c:set var="MOType" value="${prop1.key}"/><fmt:message key='${MOType}'/></td>
          <td ><img src="/webclient/common/images/<c:out value="${selectedskin}"/>/leftsiteR.gif" border="0" width="5" height="27"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding whiteBg" >
		  
		  
            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
            <tr> 
            <td valign="bottom" class="leftHeader">
			

                      </td> </tr>

                <c:forEach var="prop2" items="${prop1.value}" varStatus="status" >

                     <c:set var="PolledDataName" value="${prop2.key}"/>    
                     
                   <c:forEach var="prop3" items="${prop2.value}" varStatus="status" >

                      <c:set var="ReportDetailsKey" value="${prop3.key}"/>
                      <c:set var="ReportDetailsValue" value="${prop3.value}"/>

                      <c:choose> 
                      <c:when test="${ReportDetailsKey=='PolledData'}">
                         <c:set var="pdName" value="${ReportDetailsValue}"/>
                      </c:when>
                      <c:when test="${ReportDetailsKey=='Name'}">
                         <c:set var="displayName" value="${ReportDetailsValue}"/>
                      </c:when>
                      <c:when test="${ReportDetailsKey=='Units'}">
                         <c:set var="Units" value="${ReportDetailsValue}"/>
                      </c:when>
                      </c:choose>

                   </c:forEach>

            <tr> 
            <td height=22 nowrap class="leftLink" ><a  class="txtGlobal" href="/report/ReportViewAction.do?selectedTab=report&amp;moType=<c:out value='${MOType}'/>&amp;type=<c:out value='${displayName}'/>&amp;pdName=<c:out value='${pdName}'/>&amp;units=<c:out value='${Units}'/>"><fmt:message key='${MOType}'/> <fmt:message key='webclient.reports.tree.by'/> <fmt:message key='${displayName}'/></a>
            </td>
            </tr>
              
            </c:forEach>

            </table>
			</td>
 <td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="/webclient/common/images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
            </td>
<tr>
<td> 
            </c:forEach>       

</td>
</tr>
</table>
