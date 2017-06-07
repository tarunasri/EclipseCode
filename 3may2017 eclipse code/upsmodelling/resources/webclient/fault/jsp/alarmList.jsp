<%-- $Id: alarmList.jsp,v 1.6 2010/10/29 13:47:07 swaminathap Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<meta http-equiv="Refresh" content="<c:out value='${refreshInterval}'/>; ">
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
<form name="listView">		  
  <table width="100%" border="0" cellspacing="0" cellpadding="3" align="center" class="htableBorder">
     <tr class="tableHeaders"> 
	<c:if test="${empty ComplexSearchView}">     
	     <td nowrap width="3%"><input name="toggleAll"  type="checkbox" onclick="javascript:ToggleAll(this,this.form)"></td>
	</c:if>
         <c:forEach var="value" items="${headerList}" varStatus="status">
            <c:set var="val" value="${value.columnName}"/>

         <c:choose>
    <c:when test="${status.count==3}">
<c:choose>
<c:when test="${alertPickup=='true' && alertAnnotation!='true'}">
    <TD colspan="2" nowrap><fmt:message key='webclient.fault.alarm.actions'/>
    </TD>
</c:when>
<c:when test="${ alertAnnotation=='true' && alertPickup!='true'}">
    <TD nowrap><fmt:message key='webclient.fault.alarm.actions'/>
    </TD>
</c:when>
<c:when test="${alertPickup=='true' && alertAnnotation=='true'}">
    <TD colspan="2" nowrap><fmt:message key='webclient.fault.alarm.actions'/>
    </TD>
</c:when>

<c:otherwise>
    <TD nowrap>
</c:otherwise>
</c:choose>
    <TD nowrap>
    </c:when>
    <c:otherwise>
    <TD nowrap>
    </c:otherwise>
    </c:choose>

              <TD class="boldWhiteText" nowrap>


          <c:choose>
           <c:when test="${!empty ComplexSearchView}">     
                    <span class="whiteBoldText"><fmt:message key='webclient.fault.alarm.${value.columnName}'/></span>
           </c:when>
           <c:otherwise>
		     <a class="whiteTextWithLink" href="javascript:doSorting('<c:out value="${isAscending}"/>','<c:out value="${val}"/>')">
                <fmt:message key='webclient.fault.alarm.${value.columnName}'/>
             <c:if test='${value.columnName == orderByColumn}'>
                 <c:choose>
                    <c:when test="${isAscending == 'true'}">
                       <img src="/webclient/common/images/sortup.gif" border=0 width="11" height="7" hspace="2" vspace="1" alt="" title="">
                   </c:when>
                   <c:otherwise>
                       <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1" alt="" title="">
                  </c:otherwise>
                </c:choose>
            </c:if>
            <c:if test="${empty orderByColumn}"> 
               <c:if test="${value.columnName == 'modTime'}">
                   <img src="/webclient/common/images/sortdown.gif" border=0 width="11" height="7" hspace="2" vspace="1" alt="sortdown" title="sortdown">
               </c:if>
            </c:if>

            </a>
            </c:otherwise>    
           </c:choose>     
           </TD>

        </c:forEach>
		
        <c:forEach var="prop" items="${viewData}" varStatus="status">
         <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="reportsOddRow" height="20">
           </c:when>
           <c:otherwise>
              <TR class="reportsEvenRow" height=20>
           </c:otherwise>
        </c:choose>
	<c:if test="${empty ComplexSearchView}">
 		<td nowrap><input name="rowSelection"  type="checkbox" value="<c:out value='${prop.entity}'/>" onclick = "javascript:Toggle(this,this.form,event)"></td> 
	</c:if>	
    <c:forEach var="value1" items="${headerList}"  varStatus="status1">
       <c:set var="val" value="${value1.columnName}"/>
         <c:url var="url" value="/fault/AlarmDetails.do?method=traversePage&tab=tabOne&entity=${prop.entity} "></c:url>

                
    <TD class=text nowrap>&nbsp;

                <c:if test="${status1.count==3}">
<c:if test="${alertPickup=='true'}">
                   
<c:choose>
<c:when test="${empty prop.who}">
<a class="txtReport" href="javascript:pickOrUnpick('/fault/AlarmOperations.do?methodCall=pickUpAlarm&selectedEntity=<c:out value="${prop.entity}"/>&viewId=<c:out value="${viewId}"/>&displayName=<c:out value="${param.displayName}"/>')"> <img src="/webclient/common/images/alarm_unacknowleged.gif" border=0 width="16" height="16" hspace="1" alt="Alarm Unacknowledged" title="Alarm Unacknowledged"></a>
</c:when>
<c:otherwise>
<a class="txtReport" href="javascript:pickOrUnpick('/fault/AlarmOperations.do?methodCall=unPickAlarm&selectedEntity=<c:out value="${prop.entity}"/>&viewId=<c:out value="${viewId}"/>&displayName=<c:out value="${param.displayName}"/>')"> <img src="/webclient/common/images/alarm_actionack.gif" border=0 width="16" height="16" hspace="1" alt="Alarm Acknowledged" title="Alarm Acknowledged"></a>
</c:otherwise>
</c:choose>

</TD>
<TD class=text nowrap>
</c:if>

<c:if test="${alertAnnotation=='true'}">
                   <a class="txtReport" href="javascript:openWindow('/fault/AlarmDetails.do?method=doAnnotate&entity=<c:out value="${prop.entity}"/>&userName=<c:out value="${userName}"/>','annotate','450','188')"> <img src="/webclient/common/images/alarm_actionaddnote.gif" border=0 width="16" height="16" hspace="1" alt="Annotate" title="Annotate"></a>
</c:if>
</TD>
<TD class=text nowrap>&nbsp;
                    </c:if>


       <c:choose>
         <c:when test="${val == 'severity'}">
              <td nowrap> <div align="center"><img src="<c:out value="${prop.imgsrc}" />" border=0 width="16" height="16" hspace="1" alt="<c:out value="${prop.severity}"/>" title="<c:out value="${prop.severity}"/>"></div></td>
         </c:when>
         <c:when test="${val == 'previousSeverity'}">
             <c:choose>
                <c:when test="${prop.previousSeverity == '-'}">
                  <td nowrap> <div align="center"> - </div></td>
                </c:when>
                <c:otherwise>
                <td nowrap><div align="center"><img src="<c:out value="${prop.preimgsrc}"/>" border=0 width="16" height="16" hspace="1" alt="<c:out value="${prop.previousSeverity}"/>" title="<c:out value="${prop.previousSeverity}"/>"></div></td>
                </c:otherwise>
			 </c:choose>
         </c:when>
         <c:when test="${val != 'message' && val != 'entity'}" > 
           <td nowrap class=text> &nbsp;<c:choose>
               <c:when test='${prop[val] != ""}'>
                  <c:out value="${prop[val]}"/>
               </c:when>
               <c:otherwise>
                  &nbsp;
               </c:otherwise>
            </c:choose></td>
         </c:when>
         <c:otherwise> 
                 <c:choose>
                  <c:when test="${val == 'message'}">
                 <c:set var="msg" value="${prop.message}" scope="request" />
              <%
                    String name  = (String) request.getAttribute("msg");
                    if (name.length() > 35)
                    {
                        request.setAttribute("trimmsg",(name.substring(0,33)+".."));
                    }
                    else
                    {
                        request.setAttribute("trimmsg",name);
                    }
                   %>
            <td nowrap> <a class="text" href="<c:out value='${url}'/>" title="<c:out value='${prop.message}'/>"><c:out value="${trimmsg}"/></a></td>
              </c:when>
                 <c:when test="${permittedToViewAlert == true}">
		<td nowrap><a class="text" href="/topo/objectdetails.do?requestid=SNAPSHOT&entity=<c:out value='${prop.entity}'/>&selectedTab=Network Database" title="<c:out value='${prop.entity}'/>"><c:out value="${prop.entity}"/></a></td>

                 </c:when>
                 <c:otherwise>
                  <td nowrap class=text> <c:out value="${prop.source}"/></td>
                 </c:otherwise>
                </c:choose>
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
