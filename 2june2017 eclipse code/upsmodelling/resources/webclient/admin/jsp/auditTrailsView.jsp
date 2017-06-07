<%-- $Id: auditTrailsView.jsp,v 1.4 2010/10/29 13:46:54 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<meta http-equiv="Refresh" content="<c:out value='${refreshInterval}'/>; ">

<form name="listView">		  

<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
  <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="htableBorder">
     <tr class="tableHeaders"> 
	<c:if test="${empty ComplexSearchView}">     
	     <td nowrap width="3%"><input name="toggleAll"  type="checkbox" onclick="javascript:ToggleAll(this,this.form)"></td>
	</c:if>
         <c:forEach var="value" items="${headerList}" >
            <c:set var="val" value="${value.columnName}"/>
            <TD nowrap class="tableHeaders">
               <c:choose>
                   <c:when test="${!empty ComplexSearchView}">     
                       <span class="boldWhiteText"><fmt:message key='webclient.admin.authaudit.${value.columnName}'/></span>
                   </c:when>
                   <c:otherwise>
                     <a class="boldWhiteText" href="javascript:doSorting('<c:out value="${isAscending}"/>','<c:out value="${val}"/>')"><fmt:message key='webclient.admin.authaudit.${value.columnName}'/>
                      <c:if test='${value.columnName == orderByColumn}'>
                          <c:choose>
                             <c:when test="${param.isAscending == 'true'}">
                                 <img src="/webclient/common/images/sortup.gif" border=0 width="11" height="7" hspace="2" vspace="1" alt="">
                             </c:when>
                             <c:otherwise>
                                 <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1" alt="">
                             </c:otherwise>
                          </c:choose>
                      </c:if>
                      <c:if test="${empty orderByColumn}"> 
                         <c:if test="${value.columnName == 'authAuditId'}">
                            <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1">
                         </c:if>
                      </c:if>
                   </a>
                </c:otherwise>
            </c:choose>
         </TD>
      </c:forEach>

      <c:forEach var="prop" items="${viewData}" varStatus="status" >
         <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="reportsOddRow" height=22>
           </c:when>
           <c:otherwise>
              <TR class="reportsEvenRow" height=22>
           </c:otherwise>
         </c:choose>
	<c:if test="${empty ComplexSearchView}">
	        <td nowrap><input name="rowSelection"  type = "checkbox" value="<c:out value='${prop.authAuditId}:${prop.userName}'/>" onclick = "javascript:Toggle(this,this.form,event)"></td>
	</c:if>
          <c:forEach var="value1" items="${headerList}">
            <c:set var="val" value="${value1.columnName}"/>
            <c:url var="url" value="/admin/AuthAuditDetails.do?authAuditId=${prop.authAuditId}" />
            <c:choose>
              <c:when test="${val != 'authAuditId' && val != 'userName' && val != 'operation'}"> 
                <td nowrap class=text>   
                  <c:choose>
                    <c:when test='${prop[val] != ""}'>
                      <c:out value="${prop[val]}"/>
                    </c:when>
                    <c:otherwise>
                      &nbsp;
                    </c:otherwise>
                  </c:choose>
                </td>
              </c:when> 

              <c:otherwise> 
                <c:choose>
                  <c:when test="${val == 'userName'}"> 
                    <td nowrap>
                      <a class="text" href="<c:out value='${url}'/>" > <c:out value="${prop.userName}"/>
                    </td>
                  </c:when>
		  <c:when test="${val == 'operation'}">
                    <td nowrap class="text">
                      <fmt:message key="${prop.operation}"/>
                    </td>
                  </c:when>
                  <c:otherwise>
                    <td nowrap> <div align="center"><img src="<c:out value="${prop.imgsrc}" />" border=0 width="16" height="16" hspace="1"></div></td>
                  </c:otherwise>      
                </c:choose>        
              </c:otherwise> 
            </c:choose>
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
</form>

