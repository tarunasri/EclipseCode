<html>
<!-- $Id: webnmsDetails.jsp,v 1.2 2007/10/17 15:46:03 gnanasekar Exp $ -->
<head>
<LINK REL="SHORTCUT ICON" HREF="/favicon.ico">
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script>

function hidediv(tab1,tab2,tab3)
{
    document.getElementById(tab1).style.display = "";
    document.getElementById(tab2).style.display = "none";
	document.getElementById(tab3).style.display = "none";
}

function showDetails(divid)
{
        if(divid == 'four')
        {
                alert(document.getElementById("ha"));
                //document.getElementById("four").src = "/admin/AdminServerStatus.do?toPerform=portDetails";        
        }
}

</script>
</head>
<body>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
                <td><h1><fmt:message key='webclient.admin.webnms.details.header'/></h1></td>
        </tr>
</table>

<table style="margin-bottom:10px;" width="40%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.title'/></span></td>    
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
					 <tr>
					 <td align="center" width="50%" nowrap><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.eventQ'/></span></td>
					 <td  class="text"><c:out value="${faultProps.EventQ}"/></td>
					 </tr>

					 <tr>
					 <td align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.alertQ'/></span></td>
					 <td  class="text"><c:out value="${faultProps.AlertQ}"/></td>
					 </tr>

					 <tr>
					 <td align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.trapcount'/></span></td>
					 <td  class="text"><c:out value="${faultProps.TrapCount}"/></td>
					 </tr>

					 <tr>
					 <td align="center" ><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.fault.lasttraptime'/></span></td>
					 <td  class="text"><c:out value="${faultProps.LastTrapTime}"/></td>
					 </tr>

        </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>

<br>

<table style="margin-bottom:10px;" width="40%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.systemadmin.serverstatus.portdetails'/></span></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >

                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
					 <tr>
					 <td align="center" width="50%"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.rmi'/></span></td>
					 <td  class="text"><c:out value="${portProps.RMI}"/></td>
					 </tr>

					 <tr>
					 <td align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.nmsbe'/></span></td>
					 <td  class="text"><c:out value="${portProps.NMS_BE}"/></td>
					 </tr>

					 <tr>
					 <td align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.webserver'/></span></td>
					 <td  class="text"><c:out value="${portProps.WEBSERVER}"/></td>
					 </tr>

					 <tr>
					 <td align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.webcontainer'/></span></td>
					 <td  class="text"><c:out value="${portProps.WEBCONTAINER}"/></td>
					 </tr>

					 <tr>
					 <td align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.tomcatshutdown'/></span></td>
					 <td  class="text"><c:out value="${portProps.TOMCAT_SHUTDOWN}"/></td>
					 </tr>

					 <tr>
					 					 
					 <td align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.serverstatus.trap'/></span></td>
					 <td  class="text"><c:out value="${portProps.TRAP}"/></td>
					 
					 </td>
					 </tr>
					 
				 </td>    
          </tr>
        </table>

</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>

<br>

<table style="margin-bottom:10px;" width="40%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.subtilte'/></span></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >

                    <table width="100%" border="0" cellpadding="3" cellspacing="0">
					 
					 <tr>
					 <td align="center" width="50%"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.network'/></span></td>
					 <td  class="text"><c:out value="${discProps.networkCount}"/></td>
					 </tr>

					 <tr>
					 <td  align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.mo'/></span></td>
					 <td  class="text"><c:out value="${discProps.moCount}"/></td>
					 </tr>

					 <tr>
					 <td  align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.node'/></span></td>
					 <td  class="text"><c:out value="${discProps.nodeCount}"/></td>
					 </tr>

					 <tr>
					 <td  align="center"><span class="text"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.interface'/></span></td>
					 <td  class="text"><c:out value="${discProps.interfaceCount}"/></td>
					 </tr>

        </table>


</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>

<br>


<table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.networktitle'/></span></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
        <table width="100%" border="0" cellpadding="3" cellspacing="0">
        <tr>
            <td nowrap height="25" class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.networkip'/></span></td>
            <td nowrap class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.lastdisc'/></span></td>
            <td nowrap class="header2Bg"><span class="header2"><fmt:message key='webclient.admin.systemadmin.modulestatus.disc.nextdisc'/></span></td>
            </tr>
            
            <c:forEach var="networkDetails" items="${networkDiscDetails}"> 
            <c:set var="network" value = "${networkDetails}"/>
            <tr>
                <c:forEach var="detail" items="${network}">
                <td  class="text"><c:out value="${detail}"/></td>
                </c:forEach>
                </tr>
                </c:forEach>
</table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>



<table style="margin-bottom:10px;" width="80%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulerdetails'/></span></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" cellpadding="3" cellspacing="0">
        <tr>
            <td  class="header2Bg" height="25"><span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulerindex'/></span></td>
            <td  class="header2Bg"><span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulername'/></span></td>
            <td  class="header2Bg"><span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulertask'/></span></td>
            <td  class="header2Bg"><span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.schedulerthread'/></span></td>
            <td  class="header2Bg"><span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.scheduleractive'/></span></td>
            <td  class="header2Bg"><span class="boldText"><fmt:message key='webclient.admin.systemadmin.serverstatus.scheduleridle'/></span></td>
            </tr>
            
            <c:forEach var="schdulerList" items="${schDetails}">
            <c:set var="schduler" value = "${schdulerList}"/>
            <tr>
                
                <td  class="text"><c:out value="${schduler.index}"/></td>
                <td  class="text"><c:out value="${schduler.descriptor}"/></td>
                <td  class="text"><c:out value="${schduler.numTasks}"/></td>
                <td  class="text"><c:out value="${schduler.numThreads}"/></td>
                <td  class="text"><c:out value="${schduler.activeThreads}"/></td>
                <td  class="text"><c:out value="${schduler.idleThreads}"/></td>
                </tr>
                </c:forEach>
                
                </td>    
                </tr>
                </table>
</td>
    <td class="generalCurveRight">&nbsp;</td>
  </tr>
  <tr>
    <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
</table>



        
   
</body>
</html>

