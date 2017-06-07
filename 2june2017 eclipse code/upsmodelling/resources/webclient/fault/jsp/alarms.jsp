<%-- $Id: alarms.jsp,v 1.4 2007/10/24 14:38:46 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%-- <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> --%>


         <table width="100%" cellspacing="0" cellpadding="2" border="0" align="left" class="htableBorder">
         <tr class="generalTBHeader">

	 <c:forEach var="value" items="${headerList}" >
	 <c:set var="val" value="${value.columnName}"/>
        
          <c:choose>  
            <c:when test="${val == 'severity'}"> 
            <TD class="boldWhiteText" width="70" >
            </c:when>
            <c:when test="${val == 'entity'}"> 
            <TD class="boldWhiteText" height="23" width="200">
            </c:when>
            <c:when test="${val == 'modTime'}">
            <TD class="boldWhiteText" height="23" width="200">
            </c:when>
            <c:when test="${val == 'message'}"> 
            <TD class="boldWhiteText" height="23" width="200">
            </c:when>
            <c:otherwise > 
            </c:otherwise>
            </c:choose>   
		<c:if test = "${val == 'severity' || val == 'modTime' || val == 'entity' || val == 'message'}">
                       <fmt:message key='webclient.fault.alarm.${value.columnName}'/>
                </c:if>
		</TD>
	</c:forEach>
	</tr>

       <c:choose>
       <c:when test="${empty viewData}">
        
       <tr class="generalTBHeader">
       <TD class="boldWhiteText" width="70"><fmt:message key='webclient.fault.alarm.severity'/></TD>
       <TD class="boldWhiteText" height="23" width="200"><fmt:message key='webclient.fault.details.properties.entity'/></TD>
       <TD class="boldWhiteText" height="23" width="200"><fmt:message key='webclient.fault.alarm.modTime'/></TD>
       <TD class="boldWhiteText" height="23" width="200"><fmt:message key='webclient.fault.alarm.message'/></TD>
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
		<TR valign="bottom"  >
	  </c:otherwise>
        </c:choose>  	  

		<c:forEach var="value1" items="${headerList}">
		<c:set var="val" value="${value1.columnName}"/>

			<c:if test="${val != 'who' && val!='groupName' }" >
			<c:choose>
				<c:when test="${val == 'severity'}">
					<td nowrap width = 70 class="text"  ><img align="middle" src="<c:out value="${prop.imgsrc}" />" border=0 width="16" height="16" hspace="1" alt="<c:out value="${prop.severity}"/>" title="<c:out value="${prop.severity}"/>"><c:out value="${prop.severity}"/></td>
				</c:when>
		<%--		<c:when test="${val == 'previousSeverity'}">
					 <c:choose>
						<c:when test="${prop.previousSeverity == '-'}">
						<td nowrap width=10> <div align="center">-</div></td>
                                                 </c:when>
						<c:otherwise>
                                      <td nowrap align = "center" width=10> <img src="<c:out value="${prop.preimgsrc}" />" border=0 width="16" height="16" hspace="1" alt="<c:out value="${prop.previousSeverity}"/>" title="<c:out value="${prop.previousSeverity}"/>">
						</c:otherwise>
					</c:choose></td>
				</c:when>--%>
			</c:choose>

					
			<c:choose>
				<c:when test="${val == 'entity'}" >
                                <c:set var="obj" value="${prop.entity}" scope="request" />
                     <%                                                                                                                              String source  = (String) request.getAttribute("obj");                                                                        if (source.length() > 35)                                                                                                      {                                                                                                                               request.setAttribute("trimentity",(source.substring(0,35)+"..."));                                                            }                                                                                                                           else                                                                                                                        {                                                                                                                               request.setAttribute("trimentity",source);                                                                                    }                                                                                                                       %>

                <TD height="23" width="240" class="text" >
		<a class="linkNoUnderline" href="/topo/objectdetails.do?requestid=SNAPSHOT&entity=<c:out value='${prop[val]}'/>&selectedTab=Network Database" title="<c:out value='${prop[val]}' />" ><c:out value="${trimentity}"/></a>

				</c:when>
<%--
				<c:when test="${val == 'message'}" >
                        <TD class="text" >
						<a href="/fault/AlarmDetails.do?method=traversePage&tab=tabOne&&entity=<c:out value="${prop.entity}" />&selectedTab=Fault" title="<c:out value="${prop.message}" />" ><c:out value="${prop.message}"/></a>
				</c:when> 
--%>
                <c:when test="${val == 'message'}" >
                <c:set var="msgs" value="${prop.message}" scope="request" />

                <% 
                    String msg  = (String) request.getAttribute("msgs");
                    if (msg.length() > 45)
                    {
                        request.setAttribute("trimmsg",(msg.substring(0,42)+"..."));
                    } 
                    else
                    {
                        request.setAttribute("trimmsg",msg);
                    }
                %>
                <TD nowrap width="280"  class="text" >
                <a class="linkNoUnderline" href="/fault/AlarmDetails.do?method=traversePage&tab=tabOne&&entity=<c:out value='${prop.entity}' />&selectedTab=Fault" title="<c:out value='${prop.message}' />" > <c:out value="${trimmsg}"/></a>
			</c:when> 

                <c:when test="${val == 'severity'}" >
				</c:when>
                     <c:when test="${val == 'modTime'}">
                      <TD nowrap width="160" class="text" >
                                <c:out value='${prop[val]}'/>         
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
