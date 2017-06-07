<%--$Id: WebNMSManagementUI.jsp,v 1.28 2010/10/29 13:46:54 swaminathap Exp $--%>
<%@ taglib uri = "http://www.adventnet.com/webclient/component-tags" prefix="component" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html-el" uri="http://jakarta.apache.org/struts/tags-html-el" %>
<%@include file="/webclient/common/jspf/commonIncludes.jspf" %>	
<%@include file="/webclient/common/jspf/ModalPopup.jspf" %>	
<html>
<head>
<title>Task Manager</title>
<style>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/LoadPageScript.js"></SCRIPT>
<SCRIPT LANGUAGE="javascript" SRC="/webclient/admin/js/jvmsorttable.js"></SCRIPT>
<script language="javascript" SRC="/webclient/common/js/navigation.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
body {
	margin:0px;
	padding:0px;
}
</style>
	<script>
	var cpuUrl=null;
	var memUrl=null;
	var threadUrl=null;
function getGraph(graphType)
{
	
	var cpuSrc=document.getElementById("cpuframe");
	if(cpuUrl==null)
	{
		cpuUrl=cpuSrc.src;
	}	
	cpuSrc.src=cpuUrl+"&graphType="+graphType;

	var memSrc=document.getElementById("memframe");
	if(memUrl==null)
	{
		memUrl=memSrc.src;
	}
	memSrc.src=memUrl+"&graphType="+graphType;

	var threadSrc=document.getElementById("threadframe");
	if(threadUrl==null)
	{
		threadUrl=threadSrc.src;
	}	
	threadSrc.src=threadUrl+"&graphType="+graphType;

}
function tabSelection(tab)
{
	if(tab == "BE")
	{
		hidediv('tab1','tab2','tab3');
	}
	else if(tab == "FE")
	{
		hidediv('tab2','tab1','tab3');
	}
	else if(tab == "CLIENT")
	{
		hidediv('tab3','tab1','tab2');
	}	
}
var selectedTab="BE";
function hidediv(tab1,tab2,tab3)
{
		document.getElementById('linegraph').className='lineGraph';
		document.getElementById('linetext').className='norTxt';	
		document.getElementById('areagraph').className='areaGraph';
		document.getElementById('areatext').className='norTxt';
		document.getElementById('periodtext').className='text';
		document.getElementById('graphPeriod').className='norTxt';
	if(tab1 == "tab1")
	{
		document.getElementById('cell1').className='selTabLeft1';
		document.getElementById('cell2').className='selTabCenter1';	
		document.getElementById('cell3').className='selTabRight1';
		document.getElementById('cell4').className='norTabLeft1';
		document.getElementById('cell5').className='norTabCenter1';
		document.getElementById('cell6').className='norTabRight1';
		document.getElementById('cell7').className='norTabLeft1';
		document.getElementById('cell8').className='norTabCenter1';
		document.getElementById('cell9').className='norTabRight1';
                selectedTab = "BE";
	}
	if(tab1 == "tab2")
	{
		document.getElementById('cell1').className='norTabLeft1';
                document.getElementById('cell2').className='norTabCenter1';     
                document.getElementById('cell3').className='norTabRight1';
                document.getElementById('cell4').className='selTabLeft1';
                document.getElementById('cell5').className='selTabCenter1';
                document.getElementById('cell6').className='selTabRight1';
                document.getElementById('cell7').className='norTabLeft1';
                document.getElementById('cell8').className='norTabCenter1';
                document.getElementById('cell9').className='norTabRight1';
		selectedTab = "FE";
		<c:if test='${empty FEJVMs}'>		
		document.getElementById('linegraph').className='hide';
		document.getElementById('linetext').className='hide';	
		document.getElementById('areagraph').className='hide';
		document.getElementById('areatext').className='hide';
		document.getElementById('periodtext').className='hide';
		document.getElementById('graphPeriod').className='hide';
		</c:if>
	}
	if(tab1 == "tab3")
	{
		document.getElementById('cell1').className='norTabLeft1';
                document.getElementById('cell2').className='norTabCenter1';     
                document.getElementById('cell3').className='norTabRight1';
                document.getElementById('cell4').className='norTabLeft1';
                document.getElementById('cell5').className='norTabCenter1';
                document.getElementById('cell6').className='norTabRight1';
                document.getElementById('cell7').className='selTabLeft1';
                document.getElementById('cell8').className='selTabCenter1';
                document.getElementById('cell9').className='selTabRight1';
		selectedTab = "CLIENT";
		<%-- To hide the graph for client.--%>
		document.getElementById('linegraph').className='hide';
		document.getElementById('linetext').className='hide';	
		document.getElementById('areagraph').className='hide';
		document.getElementById('areatext').className='hide';
		document.getElementById('periodtext').className='hide';
		document.getElementById('graphPeriod').className='hide';
	}
    document.getElementById(tab1).style.display = "";
    document.getElementById(tab2).style.display = "none";
    document.getElementById(tab3).style.display = "none";
    
}
function loadDetails(id)
{       
        var tempClassName = document.getElementById(id).className;
        if(tempClassName == 'hide')
        {
                document.getElementById(id).className='';
        }
        else
        {
                document.getElementById(id).className='hide';
        }
}
  
function unLoadDetails(id)
{       
        document.getElementById(id).className='hide';
}

function changeGraphPeriod(period)
{
	var graphPeriod = '';
	if(period == 'Last 1 day')
	{
		graphPeriod = '1';
	}
	if(period == 'Last 7 days')
	{
		graphPeriod = '1';
	}
	if(period == 'Last 30 days')
	{
		graphPeriod = '30';
	}
	alert(graphPeriod);
	changePreference('','',graphPeriod,'');
}

function changePreference(BESession,FESession,period,graphType)
{
        if(period != '')
        {
                period = document.getElementById('graphPeriod').value;
        }
        url = "/admin/SavePreferences.do?jvmType="+selectedTab+"&beSession="+BESession+"&feSession="+FESession+"&period="+period+"&graphType="+graphType;
        location.href = url;
}

function report(aElements)
{
       var id = document.getElementById(aElements);
       var runid = document.getElementById('running');

       if (id.style.display == "none")
       {
          if(runid !=null)
          {
             eval("runid.style.display = 'none';");
          }
          eval("id.style.display = 'block';");
       }

	window.location.href="/admin/ExportJVMDetails.do";
}

function confirmReportToSupport()
{
	var con = confirm('<fmt:message key="webclient.common.support.filecreation.confirmation"/> ');
        if(con!=false)
        {
		openWindow('/admin/StatusMessage.do','xyz','700','450');	
	}
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body onLoad="tabSelection('<c:out value="${selectedJVMTab}"/>')">
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td nowrap="nowrap"><h1><fmt:message key='webclient.admin.mgmtgui.title'/></h1></td>
                <td align="right"></td>
        </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width=99%  align = "center" >
<tr>
<td>
	<div Id="Loading" style="display:none">
	<table style="margin-bottom:20px;" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
    	    <td class="curve1LeftTop"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
            <td class="curve1Top"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
            <td class="curve1RightTop"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
  	  </tr>
  	  <tr>
            <td class="curve1Left"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
            <td align="center" class="yellowBg"><table border="0" cellspacing="0" cellpadding="0">
          <tr>
	    <td width="20" height="20" class="greenStatus">&nbsp;</td>
            <td style="padding-left:7px;" nowrap class="boldTxt greenTxt"><fmt:message key='webclient.admin.mgmtgui.statusmsg'/></font></td>
	    </table></td>
    	    <td class="curve1Right"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
          </tr>
          <tr>
            <td class="curve1LeftBot"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
            <td class="curve1Bottom"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
            <td class="curve1RightBot"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
          </tr>
      	</table>
	</div>    	    	    	
	
	<div Id="running" style="display:block">
	<c:if test="${!empty failure}" >
	     <c:out value='${failure}'/>
	    <table border=0 cellspacing=0 cellpadding=5 width=100%>
	    <tr>
	    <td class="text">
	    <table border=0 cellspacing=0 cellpadding=5 width=100%>
	    <tr class="rowOdd">
	    <td align=center valign=top ><img src="/webclient/common/images/info-failure.gif" hspace=0></td>
	    <td class="text" align=left  valign=top> 
	
	    <c:out value='${failure}'/>
	    </td>
	    </tr>
	    </table>
	    </td>
	    </tr>
	    </table>
	 </c:if>


        <c:if test="${!empty DetailsFile}" >
	     
	    <table style="margin-bottom:20px;" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
                 <td class="curve1LeftTop"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
                 <td class="curve1Top"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
                 <td class="curve1RightTop"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
             </tr>
             <tr>
                 <td class="curve1Left"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
                 <td align="center" class="yellowBg"><table border="0" cellspacing="0" cellpadding="0">
             <tr>
	         <td width="20" height="20" class="greenStatus">&nbsp;</td>
                 <td style="padding-left:7px;" nowrap class="boldTxt greenTxt"><fmt:message key='webclient.admin.mgmtgui.jvmfiles'/><a href="#" onClick="javascript:openWindow('/nmsanalyzer/JVMDetails.txt','xyz','1000','700','scrollbars=yes')"><fmt:message key='JVMDetails.txt'/> </a>&nbsp;and&nbsp;<a href="#" onClick="javascript:openWindow('/nmsanalyzer/JVMThreadDump.txt','xyz','1000','700','scrollbars=yes')"><fmt:message key='JVMthreadDump.txt '/>
	     </tr>
             </table></td>
                 <td class="curve1Right"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
             </tr>
             <tr>
                <td class="curve1LeftBot"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
                <td class="curve1Bottom"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
                <td class="curve1RightBot"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
             </tr>
           </table>
	 </c:if>
	 </div>

</td>
</tr>
</table>


<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="curve2LeftTop"><img src="/webclient/admin/images/spacer.gif" width="6px" height="1px"></td>
    <td class="norTabBotline"><img src="/webclient/admin/images/spacer.gif" width="10px" height="4px"></td>
    <td id="cell1" class="selTabLeft1"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
    <td id="cell2" onClick="javascript:hidediv('tab1','tab2','tab3')" nowrap class="selTabCenter1"><fmt:message key='webclient.admin.mgmtgui.bedetails'/></td>
    <td id="cell3" class="selTabRight1"><img src="/webclient/admin/images/spacer.gif" width="5px" height="4px"></td>
    <td class="norTabBotline" width="4"><img src="/webclient/admin/images/spacer.gif" width="4" height="1"></td>
    <td id="cell4" class="norTabLeft1"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
    <td id="cell5" onClick="javascript:hidediv('tab2','tab1','tab3')" nowrap class="norTabCenter1"><fmt:message key='webclient.admin.mgmtgui.fedetails'/></td>
    <td id="cell6" class="norTabRight1"><img src="/webclient/admin/images/spacer.gif" width="5px" height="4px"></td>
    <td class="norTabBotline" width="4"><img src="/webclient/admin/images/spacer.gif" width="4" height="1"></td>
    <td id="cell7" class="norTabLeft1"><img src="/webclient/admin/images/spacer.gif" width="4px" height="4px"></td>
    <td id="cell8" onClick="javascript:hidediv('tab3','tab1','tab2')" nowrap class="norTabCenter1"><fmt:message key='webclient.admin.mgmtgui.clientdetails'/></td>
    <td id="cell9" class="norTabRight1"><img src="/webclient/admin/images/spacer.gif" width="5px" height="4px"></td>
    <td width="55%" align="right" nowrap class="norTabBotline" style="padding-right:10px;"><a href="javascript:report('Loading')"><fmt:message key='webclient.admin.mgmtgui.jvmdetails'/></a> | <a href="javascript:confirmReportToSupport()"><fmt:message key='webclient.admin.mgmtgui.report.webnms'/></a></td>
    <td class="curve2RightTop"><img src="/webclient/admin/images/spacer.gif" width="6px" height="1px"></td>
  </tr>
  <tr>
    <td class="curve2Left">&nbsp;</td>
    <td colspan="13" style="padding:5px 10px 10px 10px;">

    <table style="margin-bottom:15px;" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
          <td id='linegraph' class="lineGraph">&nbsp;</td>
          <td id='linetext' width="75" nowrap class="norTxt" style="padding-left:3px;"><a href="javascript:changePreference('','','','linegraph')"><fmt:message key='webclient.admin.mgmtgui.linegraph'/></a></td>
          <td id='areagraph' class="areaGraph">&nbsp;</td>
          <td id='areatext' width="90" nowrap class="norTxt" style="padding-left:3px;"><a href="javascript:changePreference('','','','areagraph')"><fmt:message key='webclient.admin.mgmtgui.areagraph'/></a></td>
          <td id='periodtext' width="80" style="padding-right:6px;" nowrap class="text"><fmt:message key='webclient.admin.mgmtgui.selectperiod'/></td>
	  <td width="50" align="right">
	    <select class="norTxt" name="select" id="graphPeriod" onchange="javascript:changePreference('','',this.options[selectedIndex].text,'')">
	      <c:choose>
	      <c:when test="${selectedJVMTab=='BE' || empty selectedJVMTab}">
                 <option value="1" <c:if test="${JVMChartRefreshInterval.BE.Period == '1'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.oneday'/></option>
                 <option value="7" <c:if test="${JVMChartRefreshInterval.BE.Period == '7'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.sevendays'/></option>
                 <option value="30" <c:if test="${JVMChartRefreshInterval.BE.Period == '30'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.thirtydays'/></option>
	      </c:when>
	      <c:when test="${selectedJVMTab=='FE'}">
		 <option value="1" <c:if test="${JVMChartRefreshInterval.FE.Period == '1'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.oneday'/></option>
                 <option value="7" <c:if test="${JVMChartRefreshInterval.FE.Period == '7'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.sevendays'/></option>
                 <option value="30" <c:if test="${JVMChartRefreshInterval.FE.Period == '30'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.thirtydays'/></option>
	      </c:when>
	      <c:when test="${selectedJVMTab=='CLIENT'}">
		 <option value="1" <c:if test="${JVMChartRefreshInterval.CLIENT.Period == '1'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.oneday'/></option>
                 <option value="7" <c:if test="${JVMChartRefreshInterval.CLIENT.Period == '7'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.sevendays'/></option>
                 <option value="30" <c:if test="${JVMChartRefreshInterval.CLIENT.Period == '30'}"> selected="true" </c:if> ><fmt:message key='webclient.admin.mgmtgui.thirtydays'/></option>
	      </c:when>
	      </c:choose>
            </select>
          </td>
        </tr>
      </table>
      <table id="tab1" style="display:;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="grayBox1">
	    <table width="100%" border="0" cellpadding="0" cellspacing="0">
   		<tr>
 		<td width="55%" align="right" nowrap class="norTabBotline" style="padding-right:10px;"><a href="javascript:openWindow('/admin/ShowStandbyDetails.do','xyz','500','200')"><fmt:message key='webclient.admin.mgmtgui.standbydetails'/></a></td>	
 		</tr>
 	    </table>
	    <table style="margin-bottom:7px;" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" style="padding-right:15px;"><table border="0" cellspacing="0" cellpadding="3">
                    <tr>
                      <td style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.behostname'/>	</td>
                      <td nowrap>: <c:out value="${BEJVM.HOSTNAME}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.bestartuptime'/></td>
                      <td nowrap >: <c:out value="${BEJVM.StartTime}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.beosdetails'/></td>
                      <td nowrap>: <c:out value="${BEJVM.OSName}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.bevmversion'/></td>
                      <td nowrap>: <c:out value="${BEJVM.VMVersion}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.bememoryutil'/></td>
                      <td nowrap>: <c:out value="${BEJVM.MEMUTIL}"/></td>
                    </tr>
                  </table></td>
                <td valign="top" style="padding-left:15px;"><table border="0" cellspacing="0" cellpadding="3">
                    <tr>
                      <td style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.behostaddress'/></td>
                      <td nowrap>: <c:out value="${BEJVM.HOSTADDRESS}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.dbname'/></td>
                      <td nowrap >: <c:out value="${BEJVM.DBName}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.beosarch'/><br></td>
                      <td nowrap>: <c:out value="${BEJVM.OSArch}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.bevmvendor'/></td>
                      <td nowrap>: <c:out value="${BEJVM.VMVendor}"/></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table style="margin-bottom:20PX;" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph&osName=<c:out value="${BEJVM.OSName}"/>" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph&osName=<c:out value="${BEJVM.OSName}"/>&zoom=yes','BE CPUUtilization Report : <c:out value="${BEJVM.HOSTADDRESS}"/> <c:out value="${BEJVM.SNMP_Port}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph&osName=<c:out value="${BEJVM.OSName}"/>&zoom=yes','BE CPUUtilization Report : <c:out value="${BEJVM.HOSTADDRESS}"/> <c:out value="${BEJVM.SNMP_Port}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
                <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph&osName=<c:out value="${BEJVM.OSName}"/>&zoom=yes','BE MemoryUtilization Report : <c:out value="${BEJVM.HOSTADDRESS}"/> <c:out value="${BEJVM.SNMP_Port}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph&osName=<c:out value="${BEJVM.OSName}"/>&zoom=yes','BE MemoryUtilization Report : <c:out value="${BEJVM.HOSTADDRESS}"/> <c:out value="${BEJVM.SNMP_Port}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
                <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${BEJVM.HOSTADDRESS}"/>&snmpPort=<c:out value="${BEJVM.SNMP_Port}"/>&jvmType=BE&graphType=areagraph&osName=<c:out value="${BEJVM.OSName}"/>&zoom=yes','BE ThreadCount Report : <c:out value="${BEJVM.HOSTADDRESS}"/> <c:out value="${BEJVM.SNMP_Port}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
                <td align="left"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=DataCollectionRate&jvmType=BE&graphType=areagraph" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=DataCollectionRate&jvmType=BE&graphType=areaegraph&zoom=yes','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=DataCollectionRate&jvmType=BE&graphType=areagraph&zoom=yes','DataCollectionRate','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=StatusPollingRate&jvmType=BE&graphType=areagraph" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=StatusPollingRate&jvmType=BE&graphType=areagraph&zoom=yes','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=StatusPollingRate&jvmType=BE&graphType=areagraph&zoom=yes','StatusPollingRate','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
                <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=TrapRate&jvmType=BE&graphType=areagraph" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=TrapRate&jvmType=BE&graphType=areagraph&zoom=yes','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=TrapRate&jvmType=BE&graphType=areagraph&zoom=yes','TrapRate','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
                <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=EventRate&jvmType=BE&graphType=areagraph" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=EventRate&jvmType=BE&graphType=areagraph&zoom=yes','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=EventRate&jvmType=BE&graphType=areagraph&zoom=yes','EventRate','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
                <td align="left"><table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=AlertRate&jvmType=BE&graphType=areagraph" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                    </tr>
                    <tr>
                      <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=AlertRate&jvmType=BE&graphType=areagraph&zoom=yes','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=AlertRate&jvmType=BE&graphType=areagraph&zoom=yes','AlertRate','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
	  
	<table id="tab2" style="display:none;" width="100%" border="0" cellpadding="0" cellspacing="0" height="510">
		<tr>
			<c:choose>
			<c:when test='${!empty FEJVMs}'>
			<td>
				<c:forEach var="feJVM" items="${FEJVMs}" varStatus="status">
		<table class="grayBox1" style="margin-bottom:20PX;" width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr><td>
		<table style="margin-bottom:7px;" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="50%" style="padding-right:15px;"><table border="0" cellspacing="0" cellpadding="3">
                    <tr>
                      <td style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.fehostname'/></td>
                      <td nowrap>: <c:out value="${feJVM.value.HOSTNAME}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.feosdetails'/></td>
                      <td nowrap >: <c:out value="${feJVM.value.OSName}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.fevmversion'/></td>
                      <td nowrap>: <c:out value="Java ${feJVM.value.VMVersion}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.festartuptime'/></td>
                      <td nowrap>: <c:out value="${feJVM.value.StartTime}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.fememoryutil'/></td>
                      <td nowrap>: <c:out value="${feJVM.value.MEMUTIL}"/></td>
                    </tr>
                </table></td>
                <td valign="top" style="padding-left:15px;"><table border="0" cellspacing="0" cellpadding="3">
                    <tr>
                      <td style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.fehostaddress'/></td>
                      <td nowrap>: <c:out value="${feJVM.value.HOSTADDRESS}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.feosarch'/></td>
                      <td nowrap >: <c:out value="${feJVM.value.OSArch}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.fevmvendor'/><br></td>
                      <td nowrap>: <c:out value="${feJVM.value.VMVendor}"/></td>
                    </tr>
                    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.fewebserverport'/></td>
                      <td nowrap>: <c:out value="${feJVM.value.WEBSERVER_PORT}"/></td>
                    </tr>
		    <tr>
                      <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.feservertype'/></td>
                      <td nowrap>: <c:out value="${feJVM.value.FE_SERVER_TYPE}"/></td>
                    </tr>
                </table></td>
              </tr>
            </table>
             <table style="margin-bottom:20PX;" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&osName=<c:out value="${feJVM.value.OSName}"/>" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                      </tr>
                      <tr>
                        <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&osName=<c:out value="${feJVM.value.OSName}"/>&zoom=yes','FE CPUUtilization Report : <c:out value="${feJVM.value.HOSTADDRESS}"/> <c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>','552','232')"><small> <a  href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&osName=<c:out value="${feJVM.value.OSName}"/>&zoom=yes','FE CPUUtilization Report : <c:out value="${feJVM.value.HOSTADDRESS}"/> <c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                      </tr>
                  </table></td>
                  <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&feSession=<c:out value="${feJVM.value.FESESSIONID}"/>" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                      </tr>
                      <tr>
                        <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&feSession=<c:out value="${feJVM.value.FESESSIONID}"/>&zoom=yes','FE MemoryUtilization Report : <c:out value="${feJVM.value.HOSTADDRESS}"/> <c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&feSession=<c:out value="${feJVM.value.FESESSIONID}"/>&zoom=yes','FE MemoryUtilization Report : <c:out value="${feJVM.value.HOSTADDRESS}"/> <c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                      </tr>
                  </table></td>
                  <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td style="padding-top:3px;"  nowrap class="norTxt"><iframe src="/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&feSession=<c:out value="${feJVM.value.FESESSIONID}"/>" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                      </tr>
                      <tr>
                        <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&feSession=<c:out value="${feJVM.value.FESESSIONID}"/>&zoom=yes','FE ThreadCount Report : <c:out value="${feJVM.value.HOSTADDRESS}"/> <c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${feJVM.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>&jvmType=FE&graphType=areagraph&feSession=<c:out value="${feJVM.value.FESESSIONID}"/>&zoom=yes','FE ThreadCount Report : <c:out value="${feJVM.value.HOSTADDRESS}"/> <c:out value="${feJVM.value.FE_JVM_SNMP_PORT}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                      </tr>
                  </table></td>
                </tr>
              </table> 
	     </td></tr>
	    </table>
	   </c:forEach>
   </td>
   </c:when>
    <c:otherwise>
    <td align='center'>
	    <b> <fmt:message key='webclient.admin.mgmtgui.fegraph.empty'/></b>
    </td>
   </c:otherwise>
    </c:choose>
        </tr>
      </table> 
	  <table id="tab3" style="display:none;" width="100%" border="0" cellspacing="0" cellpadding="0" height="510">
  <tr>
    <td class="tableBdr1" valign="top"><table class="norTxt" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="newHeader"><fmt:message key='webclient.admin.mgmtgui.vmhost'/></td>
        <td nowrap class="newHeader"><fmt:message key='webclient.admin.mgmtgui.vmtype'/></td>
        <td align="center" nowrap class="newHeader"><fmt:message key='webclient.admin.mgmtgui.sessionid'/></td>
        <td nowrap class="newHeader"><fmt:message key='webclient.admin.mgmtgui.memoryusage'/>(%)</td>	
        <td class="newHeader" align="center"><fmt:message key='webclient.admin.mgmtgui.terminate'/></td>
        <td width="20%" class="newHeader">&nbsp;</td>
      </tr>
	<c:forEach var="clients" items="${ClientJVMs}" varStatus="status" >
	 <c:choose>
           <c:when test="${status.count%2==0}">
              <TR class="newOddRow" height=22 id="<c:out value='${status.count}'/>">
           </c:when>
           <c:otherwise>
              <TR class="newEvenRow" height=22 id="<c:out value='${status.count}'/>">
           </c:otherwise>
        </c:choose>
        <td class="boldTxt" nowrap><a href="javascript:loadDetails('<c:out value="${clients.key}"/>','<c:out value="${status.count}"/>')"><c:out value="${clients.value.CLIENT_IPADDRESS}"/></a></td>
        <td ><c:out value="${clients.value.CLIENT_TYPE}"/></td>
	<c:choose>
           <c:when test="${clients.value.CLIENT_TYPE == 'WEBCLIENT'}">
         	<td align="center"><c:out value="${clients.value.CLIENT_ID}"/></td>               
           </c:when>
	   <c:otherwise>
        	<td align="center"><c:out value="${clients.value.BESESSION}${clients.value.FESESSION}"/></td>
           </c:otherwise>
           </c:choose>
        	<td align="center"><c:out value="${clients.value.MEMUTIL}"/>&nbsp;</td>
        	<td align="center">
           <c:choose>
	   <c:when test="${clients.value.TerminateClientFeature == 'Disable'}">
	   	<IMG border='0' align=center src='/webclient/common/images/delnode.gif'></IMG>
	   </c:when>
	   <c:otherwise>
	   	<a href="/admin/TerminateClient.do?fesession=<c:out value='${clients.value.FESESSION}'/>&besession=<c:out value='${clients.value.BESESSION}_${clients.value.FE_SERVER_PORT}'/>"><IMG border='0' align=center src='/webclient/admin/images/delete-n1.gif'></IMG></a>
	   </c:otherwise>
	</c:choose>
        <td >&nbsp;</td>
      </tr>
      <tr id="<c:out value='${clients.key}'/>"  class="hide" height=22 class="reportsOddRow">
        <td colspan="6" valign="top" align="center">
	<table  class="selRowDetails" border="0" cellpadding="0" cellspacing="0" style="text-align: left; width: 100%;">
    <tbody>	

        <c:choose>
        <c:when test="${clients.value.CLIENT_TYPE == 'APPLICATIONCLIENT'}">
	<%-- Added graph for application client alone--%>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>

		<td  width="90" nowrap class="norTxt" style="padding-left:3px;"> <img src="/webclient/admin/images/spacer.gif" class="lineGraph"/><a href="javascript:getGraph('linegraph')"><fmt:message key='webclient.admin.mgmtgui.linegraph'/></a></td>

		<td  width="90" nowrap class="norTxt" style="padding-left:3px;"><img src="/webclient/admin/images/spacer.gif" class="areaGraph"/> <a href="javascript:getGraph('areagraph')"><fmt:message key='webclient.admin.mgmtgui.areagraph'/></a></td>
	</tr>
	<%-- Added graph ends here--%>
	<tr>
	<td width="50%" style="padding-right:15px;"><table border="0" cellspacing="0" cellpadding="3">
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienthostname'/></td>
	<td nowrap>: <c:out value="${clients.value.HOSTNAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.serverhostname'/></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clientusername'/></td>
	<td nowrap>: <c:out value="${clients.value.USER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienttype'/></td>
	<td nowrap>: <c:out value="${clients.value.CLIENT_TYPE}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.osdetails'/></td>
	<td nowrap>: <c:out value="${clients.value.OSName}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.vmdetails'/></td>
	<td nowrap>: <c:out value="Java ${clients.value.VMVersion}"/></td>
	</tr>
	<tr>
	<td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.memoryutil'/></td>
	<td nowrap>: <c:out value="${clients.value.MEMUTIL}"/></td>
        <td colspan="2"></td>      
        </tr>
	</table></td>	

	<td valign="top" style="padding-left:15px;"><table border="0" cellspacing="0" cellpadding="3">
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienthostaddress'/></td>
	<td nowrap>: <c:out value="${clients.value.HOSTADDRESS}"/></td>
        </tr>
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.serverport'/></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_PORT}"/></td>
        </tr>     
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clientstarttime'/></td>
	<td nowrap>: <c:out value="${clients.value.CLIENT_TIME}"/>&nbsp;</td>
        </tr>
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.connectedto'/></td>
	<td nowrap>: <c:out value="${clients.value.SERVER_TYPE}"/></td>
        </tr>
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.osarch'/></td>
	<td nowrap>: <c:out value="${clients.value.OSArch}"/></td>
        </tr>     
 	<tr>       
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.totalmemory'/></td>
	<td nowrap>: <c:out value="${clients.value.TotalMemory}"/></td>
        </tr>
	</table></td>

        </tr>
	        <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td style="padding-top:3px;"  nowrap class="norTxt"><iframe id="cpuframe" src="/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&jvmType=CLIENT&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&osName=<c:out value="${clients.value.OSName}"/>" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                      </tr>
                      <tr>
                        <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&jvmType=CLIENT&graphType=areagraph&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&osName=<c:out value="${clients.value.OSName}"/>&zoom=yes','Client CPUUtilization Report : <c:out value="${clients.value.HOSTADDRESS}"/> <c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=CPUUtilization&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&jvmType=CLIENT&graphType=areagraph&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&osName=<c:out value="${clients.value.OSName}"/>&zoom=yes','Client CPUUtilization Report : <c:out value="${clients.value.HOSTADDRESS}"/> <c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                      </tr>
                  </table></td>
                  <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td style="padding-top:3px;"  nowrap class="norTxt"><iframe id="memframe" src="/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&jvmType=CLIENT" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                      </tr>
                      <tr>
                        <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&jvmType=CLIENT&graphType=areagraph&zoom=yes','Client MemoryUtilization Report : <c:out value="${clients.value.HOSTADDRESS}"/> <c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=MemoryUtilization&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&jvmType=CLIENT&graphType=areagraph&zoom=yes','Client MemoryUtilization Report : <c:out value="${clients.value.HOSTADDRESS}"/> <c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
                      </tr>
                  </table></td>
                  <td width="25%" align="left" style="padding-right:10px;"><table border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td style="padding-top:3px;"  nowrap class="norTxt"><iframe id="threadframe" src="/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&jvmType=CLIENT" FRAMEBORDER=0 WIDTH=193 height=159 scrolling="no"></iframe></td>
                      </tr>
                      <tr>
                        <td style="padding-top:3px;" align="right" nowrap class="norTxt"><img style="padding-right:4px;" src="/webclient/admin/images/new-window.gif" align="absmiddle" onClick="Dialog.show('/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&jvmType=CLIENT&graphType=areagraph&zoom=yes','Client ThreadCount Report : <c:out value="${clients.value.HOSTADDRESS}"/> <c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>','552','232')"><small> <a href="javascript:Dialog.show('/admin/MonitorSPR.do?rateType=ThreadCount&hostName=<c:out value="${clients.value.HOSTADDRESS}"/>&snmpPort=<c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>&feSession=<c:out value="${clients.value.FESESSION}"/>&beSession=<c:out value="${clients.value.BESESSION}"/>&jvmType=CLIENT&graphType=areagraph&zoom=yes','Client ThreadCount Report : <c:out value="${clients.value.HOSTADDRESS}"/> <c:out value="${clients.value.CLIENT_JVM_SNMP_PORT}"/>','552','232')"><fmt:message key='webclient.admin.mgmtgui.viewgraph'/></a> </small></td>
		      </tr>
                     </table></td>
             </tr> 
        </c:when>


        <c:when test="${clients.value.CLIENT_TYPE == 'JAVAWEBSTART'}">
        <tr>
	<td width="50%" style="padding-right:15px;"><table border="0" cellspacing="0" cellpadding="3">
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='Client Host Name'/></td>
	<td nowrap>: <c:out value="${clients.value.HOSTNAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='Server Name'/></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='User Name'/></td>
	<td nowrap>: <c:out value="${clients.value.USER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='Client Type'/></td>
	<td nowrap>: <c:out value="${clients.value.CLIENT_TYPE}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='OS Details'/></td>
	<td >: <c:out value="${clients.value.OSName}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='JDK Details'/></td>
	<td nowrap>: <c:out value="Java ${clients.value.VMVersion}"/></td>
	</tr>
	</table></td>
	
	<td valign="top" style="padding-left:15px;"><table border="0" cellspacing="0" cellpadding="3">
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='Client Host Address'/></td>
	<td nowrap>: <c:out value="${clients.value.HOSTADDRESS}"/></td>
        </tr>
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='Server Port'/></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_PORT}"/></td>
        </tr>     
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='Start Time'/></td>
	<td nowrap>: 
	<c:choose>
	<c:when test="${empty clients.value.CLIENT_TIME}">
		<c:out value="NA"/>
	</c:when>
	<c:otherwise>
		<c:out value="${clients.value.CLIENT_TIME}"/>
	</c:otherwise>
	</c:choose>
        </tr>
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='Connected To'/></td>
	<td nowrap>: <c:out value="${clients.value.SERVER_TYPE}"/></td>
        </tr>
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='OS Arch'/></td>
	<td nowrap>: <c:out value="${clients.value.OSArch}"/></td>
        </tr>     
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='Total Memory'/></td>
	<td nowrap>: <c:out value="${clients.value.TotalMemory}"/></td>
        </tr>
	</table></td></tr>
        </c:when>

        <c:when test="${clients.value.CLIENT_TYPE == 'APPLETCLIENT'}">
	<tr>
	<td width="50%" style="padding-right:15px;"><table border="0" cellspacing="0" cellpadding="3">
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienthostname'/></span></td>
	<td nowrap>: <c:out value="${clients.value.HOSTNAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.serverhostname'/></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clientusername'/></td>
	<td nowrap>: <c:out value="${clients.value.USER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienttype'/></td>
	<td nowrap>: <c:out value="${clients.value.CLIENT_TYPE}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.osdetails'/></td>
	<td nowrap>: <c:out value="${clients.value.OSName}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.vmdetails'/></td>
	<td nowrap>: <c:out value="Java ${clients.value.VMVersion}"/></td>
	</tr>
	</table></td>

	<td valign="top" style="padding-left:15px;"><table border="0" cellspacing="0" cellpadding="3">
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienthostaddress'/></td>
	<td nowrap>: <c:out value="${clients.value.HOSTADDRESS}"/></td>
        </tr>
	<tr>       
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.serverport'/></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_PORT}"/></td>
        </tr>     
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clientstarttime'/></td>
	<td nowrap>: 
	<c:choose>
	<c:when test="${empty clients.value.CLIENT_TIME}">
		<c:out value="NA"/>
	</c:when>
	<c:otherwise>
		<c:out value="${clients.value.CLIENT_TIME}"/>
	</c:otherwise>
	</c:choose>
        </tr>
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.connectedto'/></td>
	<td nowrap>: <c:out value="${clients.value.SERVER_TYPE}"/></td>
        </tr>
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.osarch'/></td>
	<td nowrap>: <c:out value="${clients.value.OSArch}"/></td>
        </tr>     
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.totalmemory'/></td>
	<td nowrap>: <c:out value="${clients.value.TotalMemory}"/></td>
        </tr>
	</table></td></tr>
        </c:when>


        <c:otherwise>
        <tr>
	<td width="50%" style="padding-right:15px;"><table border="0" cellspacing="0" cellpadding="3">
        <tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienthostname'/></span></td>
	<td nowrap>: <c:out value="${clients.value.HOSTNAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.serverhostname'/></span></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clientusername'/></span></td>
	<td nowrap>: <c:out value="${clients.value.USER_NAME}"/></td>
	</tr>
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienttype'/></span></td>
	<td nowrap>: <c:out value="${clients.value.CLIENT_TYPE}"/></td>
	</tr>
	</table></td>
	
	<td valign="top" style="padding-left:15px;"><table border="0" cellspacing="0" cellpadding="3">
	<tr>
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clienthostaddress'/></span></td>
	<td nowrap>: <c:out value="${clients.value.CLIENT_IPADDRESS}"/></td>
        </tr>
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.serverport'/></span></td>
	<td nowrap>: <c:out value="${clients.value.FE_SERVER_PORT}"/></td>
        </tr>     
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.clientstarttime'/></span></td>
	<td nowrap>: <c:out value="${clients.value.CLIENT_TIME}"/></td>
        </tr>
	<tr>        
        <td nowrap style="padding-right:20px;"><fmt:message key='webclient.admin.mgmtgui.servertype'/></span></td>
	<td nowrap>: <c:out value="${clients.value.SERVER_TYPE}"/></td>
        </tr>     
	</table></td></tr>
        </c:otherwise>
        </c:choose>

</table>
	</td>
	</c:forEach>
        </tr>
      </table>
	</td>
  </tr>
</table>

	  
	  </td>
    <td class="curve2Right">&nbsp;</td>
  </tr>
  <tr>
    <td class="curve2LeftBot"><img src="/webclient/admin/images/spacer.gif" width="6px" height="6px"></td>
    <td colspan="13" class="curve2Bottom2"><img src="/webclient/admin/images/spacer.gif" width="6px" height="6px"></td>
    <td class="curve2RightBot"><img src="/webclient/admin/images/spacer.gif" width="6px" height="6px"></td>
  </tr>
</table>
</body>
</html>
