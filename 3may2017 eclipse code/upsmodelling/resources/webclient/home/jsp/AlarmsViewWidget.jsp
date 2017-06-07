<%-- $Id: AlarmsViewWidget.jsp,v 1.2 2010/10/29 13:47:08 swaminathap Exp $ --%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>


         <table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" class="htableBorder">
         <tr class="dgeneralTBHeader" style="font-weight:bold;">

	 <c:forEach var="value" items="${headerList}" >
	 <c:set var="val" value="${value.columnName}"/>
        
          <c:choose>  
            <c:when test="${val == 'severity'}"> 
            <TD class="boldWhiteText" height="10%" >
            </c:when>
            <c:when test="${val == 'entity'}"> 
            <TD class="boldWhiteText" height="10%">
            </c:when>
	    <c:when test="${val == 'message'}"> 
            <TD class="boldWhiteText" height="10%">
            </c:when>
            <c:otherwise > 
            </c:otherwise>
            </c:choose>   
		<c:if test = "${ val == 'entity' || val == 'message'}">
                       <fmt:message key='webclient.fault.alarm.${value.columnName}'/>
                </c:if>
		</TD>
	</c:forEach>
	</tr>

       <c:choose>
       <c:when test="${empty viewData}">
        
       <tr class="generalTBHeader">
       <TD class="boldWhiteText" ><fmt:message key='webclient.fault.alarm.severity'/></TD>
       <TD class="boldWhiteText" ><fmt:message key='webclient.fault.details.properties.entity'/></TD>
       <%--TD class="boldWhiteText" ><fmt:message key='webclient.fault.alarm.modTime'/></TD--%>
       <TD class="boldWhiteText" ><fmt:message key='webclient.fault.alarm.message'/></TD>
       </tr>
       <c:forEach begin="0" end="5" varStatus="status">
        <c:choose>
         <c:when test="${status.count%2==1}">
         <TR class="generalEvenRow">
         </c:when>
         <c:otherwise>
         <TR class="generalOddRow">
         </c:otherwise>
         </c:choose>

         <c:choose>
         <c:when test="${status.count==3}">
         <td colspan =4 align="center">
         <font class="Boldtext"><fmt:message key='webclient.home.alarms.notavailable'>
         <fmt:param value="${cprop.displayName}"/><fmt:param value="${moType}"/>
         </fmt:message></font></td>
         </c:when>
         <c:otherwise>
         <td colspan =4 align="center"></td>
         </c:otherwise>
         </c:choose>
         </tr>
         </c:forEach>
         </c:when>

         <c:otherwise>
        <c:forEach var="prop" items="${viewData}" varStatus="status">
        <c:choose> 
	  <c:when test="${status.count % 2 ==0}" > 		
		<TR valign="bottom" class="generalOddRow">
	  </c:when>
          <c:otherwise>
		<TR valign="bottom"  class="generalEvenRow">
	  </c:otherwise>
        </c:choose>  	  

		<c:forEach var="value1" items="${headerList}">
		<c:set var="val" value="${value1.columnName}"/>

			<c:if test="${val != 'who' && val!='groupName' }" >
			<c:choose>
				<c:when test="${val == 'severity'}">
					<td nowrap class="text"  ><img align="middle" src="<c:out value="${prop.imgsrc}" />" border=0 width="16" height="16" hspace="1" alt="<c:out value="${prop.severity}"/>" title="<c:out value="${prop.severity}"/>"></td>
				</c:when>
			</c:choose>

					
			<c:choose>
				<c:when test="${val == 'entity'}" >
                                <c:set var="obj" value="${prop.entity}" scope="request" />
                     <%                                                                                                                              String source  = (String) request.getAttribute("obj");                                                                        if (source.length() > 35)                                                                                                      {                                                                                                                               request.setAttribute("trimentity",(source.substring(0,35)+"..."));                                                            }                                                                                                                           else                                                                                                                        {                                                                                                                               request.setAttribute("trimentity",source);                                                                                    }                                                                                                                       %>

                <TD class="text" >
		<a class="linkNoUnderline" href="/topo/objectdetails.do?requestid=SNAPSHOT&entity=<c:out value='${prop[val]}'/>&selectedTab=Network Database" title="<c:out value='${prop[val]}' />" ><c:out value="${trimentity}"/></a>

				</c:when>
                <c:when test="${val == 'message'}" >
                <c:set var="msgs" value="${prop.message}" scope="request" />

                <% 
                    String msg  = (String) request.getAttribute("msgs");
                    if (msg.length() > 100)
                    {
                        request.setAttribute("trimmsg",(msg.substring(0,42)+"..."));
                    } 
                    else
                    {
                        request.setAttribute("trimmsg",msg);
                    }
%>
                <TD class="text" >
                <a class="linkNoUnderline" href="/fault/AlarmDetails.do?method=traversePage&tab=tabOne&&entity=<c:out value='${prop.entity}' />&selectedTab=Fault" title="<c:out value='${prop.message}' />" > <c:out value="${trimmsg}"/></a>
			</c:when> 

                <c:when test="${val == 'severity'}" >
				</c:when>
				<c:otherwise>
				</c:otherwise> 
			</c:choose>
					</TD>
			</c:if>		
		</c:forEach>
				</TR>
				
	</c:forEach>

</c:otherwise>
</c:choose>
</table>
