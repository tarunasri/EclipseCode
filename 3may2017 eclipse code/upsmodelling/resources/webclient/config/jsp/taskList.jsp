<%-- $Id: taskList.jsp,v 1.2 2010/10/29 13:47:05 swaminathap Exp $ --%>
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
	        <fmt:message key='webclient.config.task.cv.${value.columnName}'/>
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
		        <c:when test="${val == 'taskName'}">
			<a href="/config/TaskAction.do?operation=execute&actionToPerform=modifyTaskForm&taskName=<c:out value='${prop[val]}'/>"><IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/nextpage.gif" border="0" align="absmiddle" title="<fmt:message key='webclient.config.task.executeTask'/>"></a> &nbsp;
			<a href="javascript:deleteTask('<c:out value="${prop[val]}"/>','<c:out value="${viewId}"/>','<fmt:message key="webclient.config.task.delete.confirmmsg"/>')" title="<fmt:message key='webclient.config.task.delete'/>" ><img src="/webclient/common/images/deleteicon.gif" width="13" height="15" alt="<fmt:message key='webclient.config.task.delete'/>" border="0" align="absmiddle"></a>&nbsp;
			<a href="/config/TaskAction.do?operation=&actionToPerform=modifyTaskForm&taskName=<c:out value="${prop[val]}"/>" title="<fmt:message key='webclient.config.task.viewdetails'/>"><c:out value="${prop[val]}"/></a>
			</c:when>
		       <c:when test="${val == 'description' || val == 'PROTOCOL'}">
		       <c:set var="desc" value="${prop[val]}" scope="request"/>
		       <%
		       	    String desc  = (String) request.getAttribute("desc");
			    if (desc.length() > 35)
			    {
			    	request.setAttribute("desc",desc.substring(0,35)+"...");	
			    }
		       %>
			   <span title="<c:out value='${prop[val]}'/>"><c:out value="${desc}"/></span>
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
