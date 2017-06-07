<%-- $Id: auditList.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
<tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
    <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
</tr>
<tr>
    <td class="generalCurveLeft">&nbsp;</td>  
    <td valign="top" class="generalTBPadding" >
<form name="listView">
    <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="homeTableBorder">
    <tr class="tableHeaders"> 
    <c:forEach var="value" items="${headerList}">
        <c:set var="val" value="${value.columnName}"/>
        <TD nowrap class="tableHeaders">
            <c:choose>
	    <c:when test="${!empty ComplexSearchView}">     
	        <span class="boldWhiteText"><fmt:message key='webclient.config.audit.cv.${value.columnName}'/></span>
	    </c:when>
	    <c:otherwise>
	        <a class="boldWhiteText" href="javascript:doSorting('<c:out value="${isAscending}"/>','<c:out value="${val}"/>')"><fmt:message key='webclient.config.audit.cv.${value.columnName}'/>
         	<c:if test='${value.columnName == orderByColumn}'>
		    <c:choose>
		        <c:when test="${isAscending == 'true'}">
		            <img src="/webclient/common/images/sortup.gif" border=0 width="11" height="7" hspace="2" vspace="1" alt="">
	                </c:when>
		        <c:otherwise>
		            <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1" alt="">
		        </c:otherwise>
		    </c:choose>
		</c:if>
			        <%--c:if test="${empty orderByColumn}"> 
			 	       <c:if test="${value.columnName == 'id'}">
				               <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1">
			               </c:if>
			        </c:if--%>
		</a>
	    </c:otherwise>
        </c:choose>
      </TD>
    </c:forEach>
        </tr>
        <c:forEach var="prop" items="${viewData}" varStatus="status" >
         <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="generalOddRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="generalEvenRow" height=22>
           </c:otherwise>
        </c:choose>
        <c:forEach var="value1" items="${headerList}">
           <c:set var="val" value="${value1.columnName}"/>
	   <td  nowrap class=text>   
		   <c:choose>
               <c:when test="${val == 'deviceName'}">
	       <a href="javascript:openNewWindow('/config/AttributeAuditAction.do?id=<c:out value='${prop.id}'/>&timeOfStart=<c:out value='${prop.timeOfStart}'/>&deviceName=<c:out value='${prop[val]}'/>','<fmt:message key='webclient.config.audit.attribute'/>','scrollbars=yes,width=550,height=450,screenX=300,screenY=200')"><c:out value="${prop[val]}"/></a>&nbsp;
               </c:when>
               <c:when test='${prop[val] != ""}'>
                 <c:out value="${prop[val]}"/>&nbsp;
               </c:when>
               <c:otherwise>
                  &nbsp;
               </c:otherwise>
            </c:choose>
        </td>
    </c:forEach>
   </TR>
</c:forEach>
</table>
  </form>
  </td>
 <td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
