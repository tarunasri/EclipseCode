<%-- $Id: MOGraphs.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>

<c:choose>
<c:when test="${ForMOGrahps eq 'false'}" >
<html>
<body>

  
 <c:forEach begin="0" end="2" step="1">
  <table  style="margin-top:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        
        <tr>
          
          <td valign="top" >
            <table border="0" cellspacing="0" cellpadding="0" class="tablebdr1" width="100%" style="padding:0px; ">
             
              <tr class="homeHeader"><td>&nbsp; </td></tr>
              <tr><td>&nbsp; </td></tr>
              <tr> 
                 <td height="170" align="center" > 
                   <div style='text-align:center;padding:10px;height:180px'><img src='/webclient/common/images/LoadingTC.gif' style='margin-top:74px' onClick="javascript:interfaceTableRequest('<c:out value="${MOName}"/>','<c:out value="${TypeForMO}"/>','<c:out value="${SnmpCheckForMO}"/>');"/></div>
                 </td>
	          </tr>
	          <tr><td>&nbsp; </td></tr>
              <tr><td>&nbsp; </td></tr>
             </table>
           </td>
         </tr>
       </table>
     </c:forEach>
     
     
 
</body>
</html>
</c:when>
<c:otherwise>

<html>
<body>

 <!-- Graphs for Interface and Port starts -->
<c:choose>
           
<c:when test="${MOTYPE eq 'Interface' || MOTYPE eq 'Port'}" >


          <table border="0" cellspacing="0" cellpadding="0" class="tablebdr1" width="100%" style="padding:0px; ">                     
                         <tr class="homeHeader">
                           <td colspan="3" > &nbsp;
		                       <fmt:message key='webclient.devices.details.intf.trafficgraph'><fmt:param value="${info.desc}"/></fmt:message>
	                       </td>
                         </tr>
                         <c:choose>
                          <c:when test='${(IntfGraph==null) || (IntfGraph.InterfaceTraffic == "NODATA")}'>
                            <tr><td colspan=2 class="txtGlobal" align="center"><fmt:message key='webclient.devices.details.na'/></td></tr>
                          </c:when>
                          <c:otherwise>
                          <tr>
                          <td align="center" style="padding:20px;">
                               <img src="<c:out value='${IntfGraph.InterfaceTraffic.imageFileName}'/>" border=0 }/>
                          </td>
                          </tr>
                          </c:otherwise>
                          </c:choose>

             </table>
     
      <br>
      
                 <table border="0" cellspacing="0" cellpadding="0" class="tablebdr1" width="100%" style="padding:0px; ">                     
                         <tr class="homeHeader">
                           <td colspan="3" > &nbsp;
		                       <fmt:message key='webclient.devices.details.intf.utilgraph'><fmt:param value="${info.desc}"/></fmt:message></font>
	                       </td>
                         </tr>
                         <c:choose>
                          <c:when test='${(IntfGraph==null) || (IntfGraph.InterfaceUtilization == "NODATA")}'>
                            <tr><td colspan=2 class="txtGlobal" align="center"><fmt:message key='webclient.devices.details.na'/></td></tr>
                          </c:when>
                          <c:otherwise>

                          <tr>
                          <td align="center" style="padding:20px;">
                               <img src="<c:out value='${IntfGraph.InterfaceUtilization.imageFileName}'/>" border=0 }/>
                          </td>
                          </tr>
                          </c:otherwise>
                          </c:choose>

             </table>
      
      <br>
      
          <table border="0" cellspacing="0" cellpadding="0" class="tablebdr1" width="100%" style="padding:0px; ">                     
                         <tr class="homeHeader">
                           <td colspan="3" > &nbsp;
		                       <fmt:message key='webclient.devices.details.intf.errorgraph'><fmt:param value="${info.desc}"/></fmt:message></font>
	                       </td>
                         </tr>
                         <c:choose>
                          <c:when test='${(IntfGraph==null) || (IntfGraph.InterfaceErrors == "NODATA")}'>
                            <tr><td colspan=2 class="txtGlobal" align="center"><fmt:message key='webclient.devices.details.na'/></td></tr>
                          </c:when>
                          <c:otherwise>

                          <tr>
                          <td align="center" style="padding:20px;">
                               <img src="<c:out value='${IntfGraph.InterfaceErrors.imageFileName}'/>" border=0 }/>
                          </td>
                          </tr>
                          </c:otherwise>
                          </c:choose>

             </table>               

</c:when>
          
<c:otherwise>
             <!-- Graphs for Interface and Port ends -->



<table id="Graphs" style="padding:0px; "width="100%" border="0" cellspacing="0" cellpadding="0">        
        <c:choose> <c:when test="${FirstPath eq 'NODATA'}" > 
        <tr > 
          <td align="center"><font class="txtGlobalBold"><fmt:message key='webclient.topo.objectdetails.graphs.na'/></font></td> 
        </tr> 
        </c:when> <c:otherwise> 
           <c:choose>
            <c:when test="${FirstPath eq 'ERROR'}">
              <tr class="homeHeader" >
           
               <td  class="tableBdr1" style="border-bottom:0px; border-right:0px;" > &nbsp;<b><c:out value='${FirstTitle}' /></b></td> 
               <td align="right" class="tableBdr1" style="border-bottom:0px; border-left:0px;">&nbsp; </td> 
              </tr>
              <tr> 
                <td align="center" colspan="2" class="tablebdr1" style="border-top:0px;"><font class="txtGlobalBold"><fmt:message key='webclient.topo.objectdetails.graphs.errmsg'/></font></td> 
              </tr>
            </c:when>
            <c:otherwise>
        <tr class="homeHeader" >
           
          <td  class="tableBdr1" style="border-bottom:0px; border-right:0px;" > &nbsp;<b><c:out value='${FirstTitle}' /></b></td> 
          <td align="right" class="tableBdr1" style="border-bottom:0px; border-left:0px;">&nbsp; </td> 
        </tr> 
        <tr> 
          <td colspan="2" align="center" class="tableBdr1"  style=" padding:0px 0px 3px 0px; border-top:0px;">
          
          
			  <table class="oddRow" height="25" width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td align="right" style="padding-right:5px;">
			    <a title="<fmt:message key='webclient.topo.objectdetails.graphs.daysseven'/>" style="padding:1px 5px 1px 7px;border:0px solid" href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&moReportType=<c:out value='${FirstName}'/>&moGraphType=LineGraph&moPeriod=past7days"><span>7<img style="margin-left:4px;" align="absmiddle" border="0" src="/webclient/common/images/SteelBlue/arrow-1.gif"  ></span></a> |
			    <a title="<fmt:message key='webclient.topo.objectdetails.graphs.daysthirty'/>" style="padding:1px 5px 1px 5px;border:0px solid" href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&moReportType=<c:out value='${FirstName}'/>&moGraphType=LineGraph&moPeriod=past30days"><span>30<img style="margin-left:4px;" align="absmiddle" border="0" src="/webclient/common/images/SteelBlue/arrow-1.gif"  ></span></a> | 
			    
          
          <c:choose>
        <c:when test="${AllInst1 eq 'TRUE'}">
        <a style="margin-left:4px;" href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${FirstName}'/>&displayName=<c:out value='${FirstTitle}'/>"><fmt:message key='webclient.topo.objectdetails.graphs.viewallinst'/></a>
        </c:when>
        <c:otherwise>
       
        </c:otherwise>
        </c:choose>
			    </td>
			  </tr>
			</table>
          
          
          
          
          
          
        
        
        <div id="customGraph" style="text-align:center; padding-top:10px; width:50%; "> 
           <a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${FirstName}'/>&displayName=<c:out value='${FirstTitle}'/>"><img  style="text-align:center; border:0px; "src="<c:out value='${FirstPath}' />" /> </a></div><br>
           
           
           
           </td> 
        </tr> 
       
        </c:otherwise></c:choose>
        <c:choose>
            <c:when test="${SecondPath eq 'NODATA'}">
               <td align="center">&nbsp; </td>
            </c:when>
        <c:otherwise>
        <c:choose>
            <c:when test="${SecondPath eq 'ERROR'}">
			<tr class="homeHeader" >
           
               <td  class="tableBdr1" style="border-bottom:0px; border-right:0px;" > &nbsp;<b><c:out value='${SecondTitle}' /></b></td> 
               <td align="right" class="tableBdr1" style="border-bottom:0px; border-left:0px;">&nbsp; </td> 
              </tr>
              <tr> 
                <td align="center" colspan="2" class="tablebdr1" style="border-top:0px;"><font class="txtGlobalBold"><fmt:message key='webclient.topo.objectdetails.graphs.errmsg'/></font></td> 
              </tr>
            </c:when>
            <c:otherwise>
            <tr> <td colspan="2">&nbsp; </td></tr>
        <tr class="homeHeader">
           <td class="tableBdr1" style="border-bottom:0px; border-right:0px;"> &nbsp;<b><c:out value='${SecondTitle}' /></b></td> 
          <td align="right" class="tableBdr1" style="border-bottom:0px; border-left:0px;">&nbsp; </td> 
        </tr> 
        <tr> 
          <td colspan="2" align="center" class="tableBdr1"  style="padding:0px; border-top:0px;">
          
			  <table class="oddRow" height="25" width="100%" border="0" cellspacing="0" cellpadding="0">
			  <tr>
			    <td align="right" style="padding-right:5px;">
			    <a title="<fmt:message key='webclient.topo.objectdetails.graphs.daysseven'/>" style="padding:1px 5px 1px 7px;border:0px solid" href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&moReportType=<c:out value='${SecondName}'/>&moGraphType=LineGraph&moPeriod=past7days"><span>7<img style="margin-left:4px;" align="absmiddle" border="0" src="/webclient/common/images/SteelBlue/arrow-1.gif"  ></span></a> |
			    <a title="<fmt:message key='webclient.topo.objectdetails.graphs.daysthirty'/>" style="padding:1px 5px 1px 5px;border:0px solid" href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&moReportType=<c:out value='${SecondName}'/>&moGraphType=LineGraph&moPeriod=past30days"><span>30<img style="margin-left:4px;" align="absmiddle" border="0" src="/webclient/common/images/SteelBlue/arrow-1.gif"  ></span></a> | 
			    
          
          <c:choose>
        <c:when test="${AllInst2 eq 'TRUE'}">
        <a style="margin-left:4px;" href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${SecondName}'/>&displayName=<c:out value='${SecondTitle}'/>"><fmt:message key='webclient.topo.objectdetails.graphs.viewallinst'/></a>
        </c:when>
        <c:otherwise>
       
        </c:otherwise>
        </c:choose>
			    </td>
			  </tr>
			</table>
          
          
          <div id="customGraph" style="text-align:center; padding:5px 10px 15px 10px; width:50%; "> 
            &nbsp;&nbsp;<a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${SecondName}'/>&displayName=<c:out value='${SecondTitle}'/>"><img  style="text-align:center; border:0px; "src="<c:out value='${SecondPath}' />" /> </a></div></td> 
         
        </tr> 
        
        </c:otherwise></c:choose>
        </c:otherwise></c:choose>
        </c:otherwise> </c:choose> 
		

     <tr><td colspan="2" align="center"> 
 
     </td> 
  </tr> 
  <tr><td>&nbsp;</td></tr>
 <div  id="showgraph" style="display:none; background-color:#FFFFFF;" >


<c:choose>
<c:when test="${empty PdList}">
</c:when>
<c:otherwise>

<tr>
<td colspan="2">
    <c:set var="i" value="0"/>
    <c:set var="rowCount" value="0"/>	
 <table width="100%" class="tablebdr1" border="0" cellspacing="0" cellpadding="0" style="padding:0px; ">
    <tr class="header2Bg">
    <td colspan="3" align="left"> &nbsp;<span class="boldText"><fmt:message key='webclient.topo.othergraph.title'/></span>
    </td>
    </tr>    

    <c:forEach var="list" items="${PdList}" varStatus="status">
    <c:choose>
    <c:when test="${list == 'hrStorageType_RAM' || list == 'hrStorageAllocationUnits_RAM' || list == 'hrStorageUsed_RAM' || list == 'hrStorageSize_RAM' || list == 'RouterMemoryUtilization' || list == 'RouterCPUUtilization' || list == 'MemoryUtilization' || list == 'CPUUtilization' || list == 'SwitchMemoryUtilization'}">
    </c:when>


    <c:otherwise>

<%-- ************* Code for displaying the Graphs Links in two columns ***************** --%>
<c:choose>
<c:when test="${list=='Device_INTERFACE_out_octets'}">
<c:set var="graphName" value="Device_Tx_Traffic"/>
</c:when>
<c:when test="${list=='Device_INTERFACE_in_octets'}">
<c:set var="graphName" value="Device_Rx_Traffic"/>
</c:when>
<c:otherwise>
<c:set var="graphName" value="${list}"/>
</c:otherwise>
</c:choose>

            <c:set var="i" value="${i+1}"/>
            <c:choose>
            <c:when test="${i % 2 != 0}">
		<c:set var="rowCount" value="${rowCount+1}"/>
		<c:choose>
		<c:when test="${rowCount %2 == 0}">
		<tr class="oddRow">
		</c:when>
		<c:otherwise>
		<tr >
		</c:otherwise>
		</c:choose>
            <td class="text" nowrap>
            <img src="/webclient/common/images/actCfgGraphs.gif" align="middle"></img>&nbsp;&nbsp;<a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${list}'/>&displayName=<c:out value='${list}'/>"><c:out value="${graphName}"/></a><br>
            </td>   
            </c:when>

            <c:otherwise>
            <td class="text" nowrap>
            <img src="/webclient/common/images/actCfgGraphs.gif" align="middle"></img>&nbsp;&nbsp;<a href="/perf/ReportViewAction.do?name=<c:out value='${name}'/>&reportType=<c:out value='${list}'/>&displayName=<c:out value='${list}'/>"><c:out value="${graphName}"/></a><br>
            </td>
            </c:otherwise>    
            </c:choose> 

            <c:if test="${i % 2 == 0}">
            </tr>
            </c:if>

            </c:otherwise>
            </c:choose>
            </c:forEach>

            </table>
 </td>
</tr>
</c:otherwise>
</c:choose>	
		
</div>	
</table>


</td></tr>

      </table>

<!--div id="showcustomgraph" class="freezeLayer" style="width: 1280px; z-index: 99; height: 765px">
</div-->

</c:otherwise>
</c:choose>

</body>
</html>
</c:otherwise>
</c:choose>
