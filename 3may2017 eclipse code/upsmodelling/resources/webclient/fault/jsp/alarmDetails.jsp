<%-- $Id: alarmDetails.jsp,v 1.3 2007/10/18 06:37:45 gnanasekar Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<title><fmt:message key='webclient.fault.alarmdetails.pagetitle'/></title>

<script language="javascript" src="/webclient/fault/js/fault.js" type="text/javascript" >
</script>
<script language="Javascript" SRC="/webclient/common/js/listview.js" type="text/javascript">
</script>

<%@include file="/webclient/fault/jspf/alarmDetailsHeader.jspf" %>
  <%--table width="100%" border="0" cellspacing="0" cellpadding="3">
    <tr> 
    <td valign="top" align="center">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="0" colspan="3">
              <img src="/webclient/common/images/trans.gif" alt="" width="1" height="1">
            </td>
          </tr>
          <tr> 
            <td width="1">
               <img src="/webclient/common/images/trans.gif" alt="" width="1" height="1">
            </td>
            <td>
                <%@include file="/webclient/fault/jspf/alarmDetailsHeader.jspf" %>
            </td>
          </tr>
        </table>
      </td>
    </tr>         


    <tr> 
      <td--%>         


        <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >




         <table border="0" class="lightTableBorder" cellspacing="0" cellpadding="0" align="center">
           <tr> 
             <td width="130" valign="top">
                  <%@include file="/webclient/fault/jspf/alarmTabs.jspf" %>
             </td>

             <td width="1" valign="top" class="seperator">
                <img src="/webclient/common/images/trans.gif" width="2" height="1">
             </td>

             <c:if test="${showTabOne == 'true'}">
             <td valign="top" width="100%">
                <c:import url="/fault/AlarmDetails.do?method=alertProperties&entity=<%=request.getAttribute('entity').toString()%>" charEncoding="UTF-8"/>
             </c:if>

             <c:if test="${showTabTwo == 'true'}"> 
             <td valign="top" width="100%">
             <c:choose>
                <c:when test="${showMerge == 'false'}">
                   <c:import url="/fault/AlarmDetails.do?method=viewAnnotationAndHistory&entity=<%=request.getAttribute('entity').toString()%>" charEncoding="UTF-8"/>
                </c:when>   
                <c:otherwise>
                   <c:import url="/fault/AlarmDetails.do?method=viewMergedAnnotationAndHistory&entity=<%=request.getAttribute('entity').toString() %>" charEncoding="UTF-8"/>
                </c:otherwise>
             </c:choose>
             </td>
             </c:if>

             <c:if test="${showTabThree == 'true'}">
             <td valign="top" width="100%">
              <c:import url="/fault/AlarmDetails.do?method=otherFailures&entity=<%=request.getAttribute('entity').toString() %>&groupName=<%= request.getAttribute('groupName').toString() %>" charEncoding="UTF-8"/>
             </c:if>
             </td>
           </tr>
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
                

        <!--/td>
        
</tr>
      </table-->        
