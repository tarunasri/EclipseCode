<%-- $Id: ReportsMainPage.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<script language="javascript" SRC="/webclient/report/js/reports.js" type="text/javascript"></script>

<c:choose>
<c:when test="${empty ReportsLength}">
<c:set var="ReportsLength" value="10"/>
</c:when>
</c:choose>

<table width="75%" border="0" cellpadding="15" cellspacing="0" align="left" >
<tr>
<td>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">

<%--
        <tr> 
        <td colspan="4">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">
        <tr>
		<td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        <tr> 
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashboard width=100% align=center><font class="txtGlobalBold">Devices : Top <c:out value="${ReportsLength}"/> Reports</font></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
		<td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        </table>
        </td>
	    </tr>
--%>

        <tr> 
        <td colspan="4">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">
        <tr>
		<td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        <tr> 
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashboard width=100% align=center><font class="txtGlobalBold">Reports Summary Page</font></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
		<td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        </table>
        </td>
	    </tr>


        <tr>
        <td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

	<tr>
            <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
			<td class="txtGlobal" nowrap height="22"><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Device&amp;type=CPU Utilization" >Devices by CPU Utilization </a></td>
			<td class="txtGlobal" nowrap> Identify busy devices with high CPU Utilization </td>
            <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	</tr>
	 

	<tr>
            <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
			<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Device&amp;type=Memory Utilization" >Devices by Memory Utilization </a></td>
			<td class="txtGlobal" nowrap> Identify overloaded devices with high Memory Utilization </td>
            <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	</tr>
	 

	<tr>
            <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
			<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Device&amp;type=Rx Traffic" >Devices by Rx Traffic </a></td>
			<td class="txtGlobal" > Identify devices with heavy incoming traffic </td>
            <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	</tr>
	 

	<tr>
            <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
			<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Device&amp;type=Tx Traffic" >Devices by Tx Traffic </a></td>
			<td class="txtGlobal" > Identify devices with heavy outgoing traffic </td>
            <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	</tr>
	 

	<tr>
            <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
			<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Device&amp;type=Rx Utilization" >Devices by Rx Utilization </a></td>
			<td class="txtGlobal" > Identify devices with heavy incoming traffic utilization </td>
            <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	</tr>
	 

	<tr>
            <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
			<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Device&amp;type=Tx Utilization" >Devices by Tx Utilization </a></td>
			<td class="txtGlobal" > Identify devices with heavy outgoing traffic utilization </td>
            <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	</tr> 

    <tr>
	<td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	<td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
    <td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	<td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	</tr>
	
</table>

<br>


<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">

<%--
        <tr> 
        <td colspan="4">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">
        <tr>
		<td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        <tr> 
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashboard width=100% align=center><font class="txtGlobalBold">Routers : Top <c:out value="${ReportsLength}"/> Reports</font></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
		<td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        </table>
        </td>
	    </tr>
--%>


        <tr>
        <td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>
        

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=CPU Utilization" >Routers by CPU Utilization </a></td>
		<td class="txtGlobal" nowrap> Identify busy routers with high CPU Utilization </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=Memory Utilization" >Routers by Memory Utilization </a></td>
		<td class="txtGlobal" nowrap> Identify overloaded routers with high Memory Utilization </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=Rx Traffic" >Routers by Rx Traffic </a></td>
		<td class="txtGlobal" nowrap> Identify routers with heavy incoming traffic </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=Tx Traffic" >Routers by Tx Traffic </a> </td>
		<td class="txtGlobal" > Identify routers with heavy outgoing traffic </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 
        <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=Rx Errors" >Routers by Rx Errors </a></td>
		<td class="txtGlobal" nowrap> Identify routers with most Receive errors </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=Tx Errors" >Routers by Tx Errors </a> </td>
		<td class="txtGlobal" nowrap> Identify routers with most Transmit errors </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

 	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=Rx Utilization" >Routers by Rx Utilization </a> </td>
		<td class="txtGlobal" > Identify routers with high % Receive utilization</td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Router&amp;type=Tx Utilization" >Routers by Tx Utilization </a></td>
		<td class="txtGlobal" > Identify routers with high % Transmit utilization </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 
	    <tr>
 	    <td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    <td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    <td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

</table>
<br>

<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">

<%--
        <tr> 
        <td colspan="4">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">
        <tr>
		<td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        <tr> 
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashboard width=100% align=center><font class="txtGlobalBold">Switches : Top <c:out value="${ReportsLength}"/> Reports</font></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
		<td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        </table>
        </td>
	    </tr>

--%>


        <tr>
        <td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>
        


	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Switch&amp;type=Rx Traffic" >Ports by Rx Traffic </a></td>
		<td class="txtGlobal" nowrap> Identify ports with heavy incoming traffic </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Switch&amp;type=Tx Traffic" >Ports by Tx Traffic </a></td>
		<td class="txtGlobal" nowrap> Identify ports with heavy outgoing traffic </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Switch&amp;type=Rx Errors" >Ports by Rx Errors </a></td>
		<td class="txtGlobal" nowrap> Identify ports with most Receive errors </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Switch&amp;type=Tx Errors" >Ports by Tx Errors </a> </td>
		<td class="txtGlobal" nowrap> Identify ports with most Transmit errors </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Switch&amp;type=Rx Utilization" >Ports by Rx Utilization </a></td>
		<td class="txtGlobal" nowrap> Identify ports with high percentage of Receive utilization </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>
	 

	    <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><a href="/report/ReportViewAction.do?selectedTab=report&amp;moType=Switch&amp;type=Tx Utilization" >Ports by Tx Utilization </a></td>
		<td class="txtGlobal" nowrap> Identify ports with high % Transmit utilization </td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
	
        <tr>
 	    <td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    <td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    <td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

</table>

</td>
</tr>
</table>
<br>


        <table width="180" border="0" cellspacing="0" cellpadding="0" align="center" class="dashboard">
        <tr>
		<td class=dashTopLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTop width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class=dashTopRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        <tr> 
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashboard width=100% align=center><font class="txtGlobalBold">Preferences</font></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
		<td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td> <hr style="width: 100%; height: 1px; noshade=\"noshade\""> </td>
		<td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>

        <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>       

        <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
		<td class="txtGlobal" nowrap height="22" ><span class="txtTableHeader" nowrap><c:set var="selectedVal" value="${ReportsLength}"/><select name="Length" onchange="javascript:Preferences(this.options[this.options.selectedIndex].value,Period.options[Period.options.selectedIndex].value)">

        <option value="10" 
        <c:if test="${ReportsLength == '10'}">
            selected="true"
        </c:if>
        >10
        </option>

        <option value="25"
        <c:if test="${ReportsLength == '25'}">
            selected="true"
        </c:if>
        >25   
        </option>

        <option value="50"
        <c:if test="${ReportsLength == '50'}">
            selected="true"
        </c:if>
        >50   </option>

        <option value="10">------------- </option>
       </select>
       Top Reports</td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td><br></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr> 
            <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>

            <td> 
            <span class="txtTableHeader" nowrap>

            <c:set var="selectedVal" value="${ReportsPeriod}"/>
            <select name="Period" onchange="javascript:Preferences(Length.options[Length.options.selectedIndex].value,this.options[this.options.selectedIndex].value)">
             <option value="Today" 

             <c:if test="${ReportsPeriod == 'Today'}">
                 selected="true"
             </c:if>
             >Today   </option>

             <option value="Yesterday" 
             <c:if test="${ReportsPeriod == 'Yesterday'}">
                 selected="true"
             </c:if>
             >Yesterday   </option>

             <option value="Last 7 days" 
             <c:if test="${ReportsPeriod == 'Last 7 days'}">
                 selected="true"
             </c:if>
             >Last 7 days   </option>

             <option value="Last 30 days"
             <c:if test="${ReportsPeriod == 'Last 30 days'}">
                 selected="true"
             </c:if>
             >Last 30 days  </option>

             </select> Reports
             </td>

             <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
        <td class=dashLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td><br></td>
        <td class=dashRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        </tr>

        <tr>
 	    <td class=dashBottomLeft><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
        <td class=dashBottom width=100%><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    <td class=dashBottomRight><img src="/webclient/common/images/1spacer.gif" width=7 height=7></td>
	    </tr>
  
        </table>

