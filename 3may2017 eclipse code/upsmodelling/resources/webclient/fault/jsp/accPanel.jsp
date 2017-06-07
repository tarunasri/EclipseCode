<%-- $Id: accPanel.jsp,v 1.3 2007/10/05 07:30:38 gnanasekar Exp $ --%>

<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>
<script>
function openAlarmView(category)
{
     var agt=navigator.userAgent.toLowerCase();
     var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
                && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
                && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1));
     var is_gecko = (agt.indexOf('gecko') != -1);

	if(category=='empty')
	{
		top.location.href='/fault/AlarmView.do?displayName=Alarms&selectedTab=Fault&selectedNode=Alerts';
	}
	else
	{
            if(is_nav)
            {
               top.location.href='/fault/AlarmView.do?category='+category+'&displayName=Alarms&selectedTab=Fault&selectedNode=Alerts';                      
            }
            else
            {
top.location.href='/fault/AlarmView.do?category='+escape(category)+'&displayName=Alarms&selectedTab=Fault&selectedNode=Alerts';
            }
	}
}

function viewAlarms(url,category)
{
    var agt=navigator.userAgent.toLowerCase();
    var is_nav  = ((agt.indexOf('mozilla')!=-1) && (agt.indexOf('spoofer')==-1)
                && (agt.indexOf('compatible') == -1) && (agt.indexOf('opera')==-1)
                && (agt.indexOf('webtv')==-1) && (agt.indexOf('hotjava')==-1));
    var is_gecko = (agt.indexOf('gecko') != -1);

	if(category=='empty')
	{
		top.location.href=url;
	}
	else
	{
          if(is_nav)
           {   
		top.location.href=url+"&category="+category;
            }
            else
            {
              	top.location.href=url+"&category="+escape(category); 
            } 
	}
}

</script>
    <TABLE BORDER="0" WIDTH="100%" CELLPADDING="0" CELLSPACING="0" ALIGN="CENTER">
<%--
    <tr height="22">
<td class="accHeader topStrip" align=center valign="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<fmt:message key='webclient.alarm.accpanel.title'/> 
</td>

<TD align="right" class="topStrip">
<a class="txtReport" href="/fault/accPanel.do?showaccpanel=false"><img align="middle" src="/webclient/common/images/<c:out value = "${selectedskin}"/>/up.gif" hspace="2" border="0" valign="bottom">

</TR>
--%>
    <TR >
    <TD >
    <TABLE BORDER="0" WIDTH="100%" CELLPADDING="0" CELLSPACING="1" ALIGN="CENTER">
    <TR>
    <TD height="17" COLSPAN="5" nowrap align="center" ><span class="boldTxt"><fmt:message key='webclient.alarm.accpanel.severitytitle'/></span></TD>
    <TD width="40"  align="center"><span class="boldTxt"><fmt:message key='webclient.alarm.accpanel.category'/></span></TD>
    </TR>

    <c:forEach var="category" items="${categoryList}">

    <c:set var="sevCount" value="${accCount}"/>
    <tr height="22"> 


    <c:forEach var="sev" items="${sevCount[category]}" varStatus="status">
    <c:choose>
        <c:when test="${category == 'Total'}">
    
            <td bgcolor="<c:out value='${colors[status.count-1]}'/>" width="17%" align="center"><a href="javascript:viewAlarms('/fault/AlarmView.do?severity=<c:out value="${severityValues[status.count-1]}"/>&displayName=Alarms&selectedTab=Fault&selectedNode=Alerts','empty')" class="text1"><c:out value="${sev}"/></a></td>

        </c:when>               

        <c:when test="${category == 'Categories-Total'}">

            <td bgcolor="<c:out value='${colors[status.count-1]}'/>" width="17%" align="center"><a href="javascript:viewAlarms('/fault/AlarmView.do?severity=<c:out value="${severityValues[status.count-1]}"/>&displayName=Alarms&&selectedTab=Fault&selectedNode=Alerts','<c:out value="${categories}"/>')" class="text1"><c:out value="${sev}"/></a></td>  

        </c:when>   


        <c:otherwise>          

           <td bgcolor="<c:out value='${colors[status.count-1]}'/>" width="17%" align="center"><a href="javascript:viewAlarms('/fault/AlarmView.do?severity=<c:out value="${severityValues[status.count-1]}"/>&displayName=Alarms&selectedTab=Fault&selectedNode=Alerts','<c:out value="${categoryMap[category]}"/>')" class="text1"><c:out value="${sev}"/></a></td>

        </c:otherwise>   

     </c:choose>
     </c:forEach>  



     <c:choose>             
   
         <c:when test="${category == 'Total'}">

             <td class="accGrey" nowrap width="15%" align="center"><a href="javascript:openAlarmView('empty')"><c:out value="${category}"/></a></td>

        </c:when>   

        <c:when test="${category == 'Categories-Total'}">

             <td class="accGrey" nowrap width="15%" align="center"><a href="javascript:openAlarmView('<c:out value="${categories}"/>')"><c:out value="${category}"/></a></td>

        </c:when>   

        <c:otherwise>            
            

             <td class="accGrey"  nowrap width="15%" align="center"><a href="javascript:openAlarmView('<c:out value="${categoryMap[category]}"/>')"><c:out value="${category}"/></a></td>

        </c:otherwise>   

     </c:choose>

     </tr>

   </c:forEach>

 </table>

    </TD></TR>
</TABLE>
