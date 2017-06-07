<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- $Id: reportsIndex.jsp,v 1.1.1.1 2006/12/14 11:38:09 gramkumar Exp $ -->
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html>
<head>
<title>AdventNet Web NMS 4</title>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr>
   <td width="25" align="center">&nbsp;</td>
   <td width="300" height="30" class="header1" align="left">&nbsp;</td>
   <td width="275" align="right">&nbsp;</td>
   <td>&nbsp;</td>
 </tr>
 <tr>
   <td align="left" valign="top">&nbsp;</td>
   <td align="left" valign="top"><table width="270" border="0" align="left" cellpadding="0" cellspacing="0">
       <tr>
         <td height="1" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td width="1" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
         <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">

       <c:url var="IFOctetLink" value="/perf/ReportViewAction.do?">
           <c:param name="reportType" value="INTERFACE_in_octets"/>
           <c:param name="displayName">
              <fmt:message key="webclient.performance.reports.index.receivetraffic"/>
           </c:param>
           <c:param name="selectedTab" value="Performance"/>
           <c:param name="selectedNode" value="INTERFACE_in_octets"/>
       </c:url>
             <tr align="center">
               <td colspan="2" class="header2Bg"><a href='<c:out value="${IFOctetLink}"/>' class="header2"><fmt:message key="webclient.performance.reports.index.receivetraffic"/></a></td>
             </tr>
             <tr>
               <td width="55" align="center"><a href='<c:out value="${IFOctetLink}"/>' class="header2"><img src="/webclient/common/images/perf_graph.gif" border="0"></a></td>
               <td class="text" height="75"><fmt:message key="webclient.performance.reports.index.receivetraffic.desc"/></td>
             </tr>
           </table></td>
         <td width="1" align="center" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td height="2" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
     </table></td>
   <td align="left"> <table width="270" border="0" align="left" cellpadding="0" cellspacing="0">
       <tr>
         <td height="1" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td width="1" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
         <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">

       <c:url var="RxUtilizationLink" value="/perf/ReportViewAction.do?">
           <c:param name="reportType" value="InterfaceInUtilization"/>
           <c:param name="displayName">
              <fmt:message key="webclient.performance.reports.index.rxutilization"/>
           </c:param>
           <c:param name="selectedTab" value="Performance"/>
           <c:param name="selectedNode" value="RxUtilization"/>
       </c:url>
             <tr align="center">
               <td colspan="2" class="header2Bg"><a href='<c:out value="${RxUtilizationLink}"/>' class="header2"><fmt:message key="webclient.performance.reports.index.rxutilization"/></a></td>
             </tr>
             <tr>
               <td width="55" align="center"><a href='<c:out value="${RxUtilizationLink}"/>' class="header2"><img src="/webclient/common/images/perf_graphrx.gif" border="0"></a></td>
               <td class="text" height="75"><fmt:message key="webclient.performance.reports.index.rxutilization.desc"/>
               </td>
             </tr>
           </table></td>
         <td width="1" align="center" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td height="2" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
     </table></td>
   <td>&nbsp;</td>
 </tr>
 <tr>
   <td align="center" valign="top">&nbsp;</td>
   <td align="center" valign="top">&nbsp;</td>
   <td align="right">&nbsp;</td>
   <td>&nbsp;</td>
 </tr>
 <tr>
   <td align="center" valign="top">&nbsp;</td>
   <td align="center" valign="top"><table width="270" border="0" align="left" cellpadding="0" cellspacing="0">
       <tr>
         <td height="1" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td width="1" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
         <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">

       <c:url var="TransmitTrafficLink" value="/perf/ReportViewAction.do?">
           <c:param name="reportType" value="INTERFACE_out_octets"/>
           <c:param name="displayName">
             <fmt:message key="webclient.performance.reports.index.transmittraffic"/>
           </c:param>
           <c:param name="selectedTab" value="Performance"/>
           <c:param name="selectedNode" value="INTERFACE_out_octets"/>
       </c:url>

             <tr align="center">
               <td colspan="2" class="header2Bg"><a href='<c:out value="${TransmitTrafficLink}"/>' class="header2"><fmt:message key="webclient.performance.reports.index.transmittraffic"/></a></td>
             </tr>
             <tr>
               <td width="55" align="center"><a href='<c:out value="${TransmitTrafficLink}"/>' class="header2"><img src="/webclient/common/images/perf_graph1.gif" border="0"></a></td>
               <td class="text" height="75"><fmt:message key="webclient.performance.reports.index.transmittraffic.desc"/>             </td>
             </tr>
           </table></td>
         <td width="1" align="center" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td height="2" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
     </table></td>
   <td align="left" valign="top"> <table width="270" border="0" align="left" cellpadding="0" cellspacing="0">
       <tr>
         <td height="1" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td width="1" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
         <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">

       <c:url var="TxUtilizationLink" value="/perf/ReportViewAction.do?">
           <c:param name="reportType" value="InterfaceOutUtilization"/>
           <c:param name="displayName">
              <fmt:message key="webclient.performance.reports.index.txutilization"/>
           </c:param>
           <c:param name="selectedTab" value="Performance"/>
           <c:param name="selectedNode" value="TxUtilization"/>
       </c:url>

             <tr align="center">
               <td colspan="2" class="header2Bg"><a href='<c:out value="${TxUtilizationLink}"/>' class="header2"><fmt:message key="webclient.performance.reports.index.txutilization"/></a></td>
             </tr>
             <tr>
               <td width="55" align="center"><a href='<c:out value="${TxUtilizationLink}"/>' class="header2"><img src="/webclient/common/images/perf_graphtx.gif" border="0"></a></td>
               <td class="text" height="75"><fmt:message key="webclient.performance.reports.index.txutilization.desc"/>              </td>
             </tr>
           </table></td>
         <td width="1" align="center" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td height="2" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
     </table></td>
   <td>&nbsp;</td>
 </tr>
 <tr>
   <td align="center" valign="top">&nbsp;</td>
   <td align="center" valign="top">&nbsp;</td>
   <td align="center">&nbsp;</td>
   <td align="right">&nbsp;</td>
 </tr>
 <tr>
   <td align="center" valign="top">&nbsp;</td>
   <td align="center" valign="top"><table width="270" border="0" align="left" cellpadding="0" cellspacing="0">
       <tr>
         <td height="1" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td width="1" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
         <td><table width="100%" border="0" align="center" cellpadding="2" cellspacing="1">

       <c:url var="CPUUtilizationLink" value="/perf/ReportViewAction.do?">
           <c:param name="reportType" value="CPUUtilization"/>
           <c:param name="displayName">
              <fmt:message key="webclient.performance.reports.index.cpuutilization"/>
           </c:param>
           <c:param name="selectedTab" value="Performance"/>
           <c:param name="selectedNode" value="CPUUtilization"/>
       </c:url>

             <tr align="center">
               <td colspan="2" class="header2Bg"><a href='<c:out value="${CPUUtilizationLink}"/>'  class="header2"><fmt:message key="webclient.performance.reports.index.cpuutilization"/></a></td>
             </tr>
             <tr>
               <td width="55" align="center"><a href='<c:out value="${CPUUtilizationLink}"/>' class="header2"><img src="/webclient/common/images/perf_cpu.gif" border="0"></a></td>
               <td class="text" height="75"><fmt:message key="webclient.performance.reports.index.cpuutilization.desc"/></td>
             </tr>
           </table></td>
         <td width="1" align="center" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
       <tr>
         <td height="2" colspan="3" class="symbolBorder"><img src="/webclient/common/images/trans.gif" width="1" height="1"></td>
       </tr>
     </table></td>
   <td align="center">
</td>
   <td>&nbsp;</td>
 </tr>
</table>
</body>
</html>
