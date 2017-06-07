<%-- $Id: perfList.jsp,v 1.10 2010/10/29 13:47:12 swaminathap Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri = "http://www.adventnet.com/webclient/component-tags" prefix="component" %>
<Script>
//Function : Used for form submission from the list view - for sorting/ordering by column
function PerfSorting(isAscending,orderByColumn)
{
    //alert("Creative work");

        if(orderByColumn != document.pagexform.orderByColumn.value )
        {
	        document.pagexform.isAscending.value = "true";
	        document.pagexform.orderByColumn.value = orderByColumn;
        }
        else
        {
                if(isAscending == "true")
                {
                        isAscending="false";
                }       
                else if(isAscending == "false")
                {
                        isAscending="true";
                }
	        document.pagexform.isAscending.value = isAscending;
	        document.pagexform.orderByColumn.value = orderByColumn;
                
        }
        //document.pagexform.FROM_INDEX.value="1";
        //document.pagexform.TO_INDEX.value = parseInt(document.pagexform.FROM_INDEX.value) + parseInt(document.pagexform.viewLength.value)-1;
        //document.pagexform.PAGE_NUMBER.value="1";
	document.pagexform.submit();
}


</Script>
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >




<table width="100%" cellspacing="0" cellpadding="0" border="0">
  <tr> 
    <Td height="22" colspan="2">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="4" height="4"><img src="/webclient/common/images/SteelBlue/top-left3.gif" width="4" height="4"></td>
    <td colspan="2" class="navigation2Bg"><img src="/webclient/common/images/SteelBlue/spacer.gif" width="1" height="1"></td>
    <td width="4"><img src="/webclient/common/images/SteelBlue/top-right3.gif" width="4" height="4"></td>
  </tr>
  <tr>
    <td class="navigation2Bg"><img src="/webclient/common/images/spacer.gif" width="1" height="1"></td>
    <td class="navigation2Bg" align="left" style="padding-left:5px;padding-right:10px;">
	<table width="25%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <form name="pagexform" method="POST" action='<c:out value="${action}"/>'>
            <INPUT TYPE="hidden" NAME="viewId" VALUE='<c:out value="${viewId}"/>'>
            <INPUT TYPE="hidden" NAME="isAscending" VALUE='<c:out value="${isAscending}"/>'>
            <INPUT TYPE="hidden" NAME="orderByColumn" VALUE='<c:out value="${orderByColumn}"/>'>
            <INPUT TYPE="hidden" NAME="displayName" VALUE='<c:out value="${param.displayName}"/>'>
            <component:XPage totalRecords='<%=(Long)request.getAttribute("RECORDS")%>'  recordsPerPage='<%=(Integer)request.getAttribute("viewLength")%>' linksPerPage="5" forwardTo="" pageNumber='<%=(String)request.getAttribute("PAGENUMBER")%>'> 
            <INPUT TYPE="hidden" NAME="viewLength" VALUE='25'>
            <td nowrap align="left"> <c:choose> <c:when test="${requestScope.PAGE_NUMBER != 1}"> 
              &nbsp;<a href='javascript:showPage("<c:out value="${requestScope.FIRST_LINK}"/>")'><IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/firstpage.gif" border="0"></a>&nbsp;<a href='javascript:showPage("<c:out value="${requestScope.PREVIOUS_LINK}"/>")'><IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/prevpage.gif" border="0"></a> 
              </c:when> <c:otherwise>&nbsp;<IMG SRC="/webclient/common/images/<c:out value = "${sessionScope.selectedskin}"/>/firstpage-blur.gif" 
              border="0">&nbsp;<IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/prevpage-blur.gif" border="0"> 
              </c:otherwise> </c:choose> </td>
            <td nowrap class=textSmall align="center"> 
			<fmt:message key="webclient.perf.viewrange.description"> 
              <fmt:param value="${requestScope.FROM_INDEX}"/> <fmt:param value="${requestScope.TO_INDEX}"/> 
              <fmt:param value="${requestScope.TOTAL_RECORDS}"/> </fmt:message> 
            </td>
            <td nowrap align="right"> <c:choose> <c:when test="${requestScope.PAGE_NUMBER != requestScope.TOTAL_PAGES}"> 
              <a href='javascript:showPage("<c:out value="${requestScope.NEXT_LINK}"/>")'> 
              <IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/nextpage.gif" border="0"></a>&nbsp;<a href='javascript:showPage("<c:out value="${requestScope.LAST_LINK}"/>")'><IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/lastpage.gif" border="0"></a></c:when> 
              <c:otherwise> <IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/nextpage-blur.gif" border="0">&nbsp;<IMG SRC="/webclient/common/images/<c:out value='${sessionScope.selectedskin}'/>/lastpage-blur.gif" border="0"> 
              </c:otherwise> </c:choose>&nbsp;</td>
            </component:XPage> 
            <INPUT TYPE="hidden" NAME="FROM_INDEX" VALUE='<c:out value="${FROM_INDEX}"/>'>
            <INPUT TYPE="hidden" NAME="TO_INDEX" VALUE='<c:out value="${TO_INDEX}"/>'>
            <INPUT TYPE="hidden" NAME="PAGE_NUMBER" VALUE='<c:out value="${PAGE_NUMBER}"/>'>
            <INPUT TYPE="hidden" NAME="RECORDS" VALUE='<c:out value="${RECORDS}"/>'>
          </form>
        </tr>
      </table></Td>
    <td align="right" class="navigation2Bg"> 
	
	
	<table class="headerInclude" border=0 cellspacing=0 cellpadding="2">
        <tr> 
          <td class="pageHeader" align="left">&nbsp; </td>
          <td  align="center" nowrap class="pageHeader"><fmt:message key='webclient.perf.statistic.header'/> 
             </td>
          <Td > <a class="textSmall" href="javascript:addStatistics('/perf/StatisticDetails.do?toPerform=addStatisticsForm&agentName=<c:out value="${agentName}"/>')"><fmt:message key='webclient.perf.header.add'/></a></td>
          <td width="10" align="center" class="textSmall"> | </td>
          <td nowrap><a class="textSmall" href="javascript:deleteStatistics('/perf/StatisticDetails.do?toPerform=deleteStatistics&agentName=<c:out value="${agentName}"/>','<fmt:message key="webclient.perf.statistics.deletestats.nostatserror"/>','<fmt:message key="webclient.perf.statistics.deletestats.confirm"/>')"><fmt:message key='webclient.perf.header.delete'/></a></td>
        </tr>
      </table>


</Td>

<td class="navigation2Bg"><img src="/webclient/common/images/SteelBlue/spacer.gif" width="1" height="1"></td>
  </tr>
  <tr>
    <td width="4" height="4"><img src="/webclient/common/images/SteelBlue/bot-left3.gif" width="4" height="4"></td>
    <td colspan="2" class="navigation2Bg"><img src="/webclient/common/images/SteelBlue/spacer.gif" width="1" height="1"></td>
    <td ><img src="/webclient/common/images/SteelBlue/bot-right3.gif" width="4" height="4"></td>
  </tr>
</table>
</td>
  </tr>



<tr>
  <td width="22%" valign="top"> <table border=0 cellspacing=0 cellpadding="5" width="200"><tr><td align="left"><select style="width:200;height:auto" class="formstyle2" name="AgentList" onchange="showStatistics(this.options[this.selectedIndex].value);" size="25">
      <c:forEach var="hostName" items="${agentList}"> <c:set var="agent" value="${hostName}" scope="request" /> 
      <%
        String name  = (String) request.getAttribute("agent");
        if (name.length() > 27)
        {
            request.setAttribute("trimagent",(name.substring(0,24)+".."));
        }
        else
        {
            request.setAttribute("trimagent",name);
        }
     %><option value='<c:out value="${hostName}"/>' 
      <c:if test="${hostName==agentName}"> selected </c:if>> <c:out value="${trimagent}"/></option> 
      </c:forEach> </select> </td></tr> </table></td><td width="78%" valign="top">
  <form name="listView" style="display:inline">
  <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><font class="generalTitle"><fmt:message key="webclient.perf.listfor.agentname"><fmt:param value="${agentName}"/> </fmt:message></font></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td> 
          <td valign="top" class="generalTBPadding" >
		  
		  
    <table id="perfViewList" width="100%" border="0" cellspacing="0" cellpadding="3"  class="htableBorder">
      <tr class="tableHeaders"> 
        <td nowrap width="3%"><input name="toggleAll"  type="checkbox" onclick="javascript:ToggleAll(this,this.form)"></td>
        <c:forEach var="value" items="${headerList}" varStatus="status"> <c:set var="val" value="${value.columnName}"/> 
        <c:choose> <c:when test="${val eq 'id'}"> </c:when> <c:when test="${val eq 'dnsName'}" > 
        </c:when> <c:when test="${val eq 'name'}" > 
         <td width="16"></td>
        <TD nowrap> <a href="#" onclick="ts_resortTable(this);return false;"> 
		
          <span class="whiteBoldText"><fmt:message key='webclient.performance.list.header.${value.columnName}'/></span></a> 
        </TD>
       
        </c:when> <c:otherwise> 
        <TD nowrap> <a href="#" onclick="ts_resortTable(this);return false;"> 
          <span class="whiteBoldText"><fmt:message key='webclient.performance.list.header.${value.columnName}'/></span> 
          </a> </TD>
        </c:otherwise> </c:choose> </c:forEach> </tr>
      <c:forEach var="prop" items="${viewData}" varStatus="status"> 
      <%--
         <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="reportsOddRow" height="20">
           </c:when>
           <c:otherwise>
              <TR class="reportsEvenRow" height=20>
           </c:otherwise>
        </c:choose> --%>
      <TR class="reportsOddRow" height="20" onMouseOver="this.className='reportsEvenRow'" onMouseOut="this.className='reportsOddRow'"> 
        <c:set var="tname" value="${prop.name}" scope="request" /> <c:set var="tagentName" value="${agentName}" scope="request" /> 
        <c:set var="toid" value="${prop.oid}" scope="request" /> <c:set var="townerName" value="${prop.ownerName}" scope="request" /> 
        <%
        String pname  = (String) request.getAttribute("tname");
        String agentName  = (String) request.getAttribute("tagentName");
        String oid  = java.net.URLEncoder.encode((String) request.getAttribute("toid"),"UTF-8");
        String ownerName  = (String) request.getAttribute("townerName");
        String statisticsKey = null;
    
        if(ownerName == null)
        {
            statisticsKey = pname+"|"+agentName+"|"+oid;
        }   
        else   
        {
            statisticsKey = pname+"|"+agentName+"|"+oid+"|"+ownerName;
        }
        request.setAttribute("statisticsKey",statisticsKey);

        request.setAttribute("oidEncoded",oid);    
    %>
        <td nowrap><input name="rowSelection"  type="checkbox" value="<c:out value='${statisticsKey}'/>" onclick = "javascript:Toggle(this,this.form,event)"></td><c:forEach var="value1" items="${headerList}"  varStatus="status1">
        <c:set var="val" value="${value1.columnName}"/> <c:url var="statsURL" value="/perf/StatisticDetails.do?toPerform=showStatistics&ownerName=${prop.ownerName}&pdName=${prop.name}&agentName=${agentName}&oid=${oidEncoded}" ></c:url>
        <c:choose> <c:when test="${val == 'name'}"> <c:set var="pdName" value="${prop.name}" scope="request" /> 
        <%
                    String name  = (String) request.getAttribute("pdName");
                    if (name.length() > 25)
                    {
                        request.setAttribute("trimName",(name.substring(0,23)+".."));
                    }
                    else
                    {
                        request.setAttribute("trimName",name);
                    }
                  %>
         <c:url var="perfGraphURL" value="/perf/ReportViewAction.do?name=${agentName}&reportType=${prop.name}&displayName=${prop.name}"></c:url> 
        <td width="20"> <a class="text" href="<c:out value='${perfGraphURL}'/>" > 
          <img src="/webclient/common/images/actCfgGraphs.gif" border=0 width="16" height="16" hspace="1" alt="" title="<fmt:message key='webclient.perf.view.graph'/>"></a> 
        </td>
        <td nowrap width="20%"> <a class="text" href="<c:out value='${statsURL}'/>" title="<c:out value='${prop.name}'/>"><c:out value="${trimName}"/></a></td>
       
        </c:when> <c:when test="${val eq 'id'}"> </c:when> <c:when test="${val eq 'dnsName'}" > 
        </c:when> <c:when test="${val eq 'oid'}" > <c:set var="pdOID" value="${prop.oid}" scope="request" /> 
        <%
                    String pdoid  = (String) request.getAttribute("pdOID");
                    if (pdoid.length() > 22)
                    {
                        request.setAttribute("trimOID",(pdoid.substring(0,20)+".."));
                    }
                    else
                    {
                        request.setAttribute("trimOID",pdoid);
                    }
                  %>
        <td nowrap width="20%"> <span title="<c:out value='${prop.oid}'/>"><c:out value="${trimOID}"/></span></td>
        </c:when> <c:otherwise> 
        <td nowrap class=text > <c:choose> <c:when test='${!empty prop[val]}'> 
          <c:out value="${prop[val]}"/> </c:when> <c:otherwise> &nbsp; </c:otherwise> 
          </c:choose> </td>
        </c:otherwise> </c:choose> </td> </c:forEach> </TR> </c:forEach> 
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
	  
  </form></td></tr>
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
