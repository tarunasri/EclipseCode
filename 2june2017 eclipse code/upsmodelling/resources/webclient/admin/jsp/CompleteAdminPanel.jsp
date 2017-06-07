<%-- $Id: CompleteAdminPanel.jsp,v 1.9 2010/10/29 13:46:54 swaminathap Exp $ --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<html>
<head>
<title><fmt:message key='webclient.common.tree.adminnode.completeview'/></title>
</head>

<body>
<table class="pageHeaderStr" width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
  <td><h1><fmt:message key = 'webclient.admin.page.header'/></h1></td>
</tr>
</table>

<table style="margin-bottom:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" style="padding-right:20px;">
	
	
	
	 <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key = 'webclient.admin.discovery.header'/></span></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
		  <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
<div class="adminDiv">
		<table border="0" cellspacing="0" cellpadding="0">

<c:choose>

<c:when test="${runtimeAdmin=='true'}">  
        <tr>
              <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/admindiscparam.gif' ></td>
              <td nowrap><a href="/admin/ConfigDiscParam.do"><fmt:message key="webclient.admin.runtimeadmin.discpara.link"/></a></td>
            </tr>
</c:when>

<c:otherwise>
        <tr>
              <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/admindiscparam.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.runtimeadmin.discpara.link"/></td>
            </tr>
</c:otherwise>

</c:choose>

<c:choose>

<c:when test="${runtimeAdmin=='true'}">  
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admindisccriteria.gif' ></td>
              <td nowrap><a href="/admin/CriteriaBasedDiscovery.do"><fmt:message key="webclient.admin.runtimeadmin.disccriteria.link"/></a></td>
            </tr>
</c:when>

<c:otherwise>
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admindisccriteria.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.runtimeadmin.disccriteria.link"/></td>
            </tr>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${runtimeAdmin=='true'}">
         <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/rediscoveryscheduler.gif' ></td>
              <td nowrap><a href="/admin/ReDiscoverySchedular.do"><fmt:message key="webclient.admin.runtimeadmin.rediscpara.link"/></a></td>
            </tr>
</c:when>

<c:otherwise>
         <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/rediscoveryscheduler.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.runtimeadmin.rediscpara.link"/></td>
            </tr>
</c:otherwise>

</c:choose>
                              
        </table>
		</div></td>
    <td width="45%" valign="top">
	
	<div class="adminDiv">

	<table border="0" cellspacing="0" cellpadding="0">

        <c:choose>

        <c:when test="${addNetwork == 'true'}">
                <tr>
                        <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/adminaddnetwork.gif' ></td>
                        <td nowrap><a href="/topo/addNetwork.do"><fmt:message key="webclient.admin.networkadmin.addnetwork.title"/></a></td>
                </tr>
        </c:when>

        <c:otherwise>
                <tr>
                        <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/adminaddnetwork.gif' ></td>
                        <td nowrap><fmt:message key="webclient.admin.networkadmin.addnetwork.title"/></td>
                </tr>
        </c:otherwise>

        </c:choose>

        <c:choose>

        <c:when test="${addNode == 'true'}">
                <tr>
                        <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminaddnode.gif' ></td>
                        <td nowrap><a href="/topo/addNode.do"><fmt:message key="webclient.admin.networkadmin.addnode.title"/></a></td>
                </tr>
        </c:when>

        <c:otherwise>
                <tr>
                        <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminaddnode.gif' ></td>
                        <td nowrap><fmt:message key="webclient.admin.networkadmin.addnode.title"/></td>
                </tr>
        </c:otherwise>

        </c:choose>

        <c:choose>

        <c:when test="${refreshNode == 'true'}">
                <tr>
                        <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminrefreshnode.gif' ></td>
                        <td nowrap><a href="/topo/refreshNode.do"><fmt:message key="webclient.admin.networkadmin.refreshnode"/></a></td>
                </tr>
        </c:when>

        <c:otherwise>
                <tr>
                        <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminrefreshnode.gif' ></td>
                        <td nowrap><fmt:message key="webclient.admin.networkadmin.refreshnode"/></td>
                </tr>
        </c:otherwise>

        </c:choose>
                                
        </table>
		</div>
	</td>
  </tr>
</table>

		  
		
		
		  </td>
          <td class="generalCurveRight">&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
		  
	
	
	</td>
    <td width="40%" valign="top">
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.adminpanel.securityadm'></fmt:message></span></td>
        <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
      <tr>
        <td class="generalCurveLeft">&nbsp;</td>
        <td valign="top" class="generalTBPadding" >
		<table  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>




	<div class="adminDiv">
	<table border="0" cellspacing="0" cellpadding="0" width="100%">
                
        <%-- ******* User Details  related Code snippet ******* --%>

        <c:choose>
                <c:when test="${listOfUser == 'true'}">
                        <tr>
                                <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/users.gif' ></td>
                                <td nowrap><a href ="/admin/UserAdmin.do?"><fmt:message key="webclient.admin.adminpanel.userconfig"/></a></td>
                        </tr>
                </c:when>

                <c:otherwise> 
                        <tr>
                                <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/users.gif' ></td>
                                <td nowrap><fmt:message key="webclient.admin.adminpanel.userconfig"/></td>
                        </tr>         
                </c:otherwise>
        </c:choose>

        <%-- ******* User Details related Code snippet ******* --%>

        <%-- ******* Group Details related Code snippet ******* --%>

        <c:choose>
                <c:when test="${groupList == 'true'}">
                        <tr>
                                <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/groups.gif' ></td>
                                <td nowrap><a href ="/admin/GroupAdmin.do?"><fmt:message key="webclient.admin.adminpanel.groupconfig"/></a></td>
                        </tr>  
                </c:when>
                <c:otherwise>
                        <tr>
                                <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/groups.gif' ></td>
                                <td nowrap><fmt:message key="webclient.admin.adminpanel.groupconfig"/></td>
                        </tr> 
                </c:otherwise>
        </c:choose>

        <%-- ******* Group Details related Code snippet ******* --%>

        <%-- ******* Operations settings related Code snippet ******* --%>

        <c:choose>      
                <c:when test="${setOperations == 'true'}">
                        <tr>
                                <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/operations.gif' ></td>
                                <td nowrap><a href ="javascript:openWindow('/admin/OperationsView.do?selectedTab=admin&selectedNode=securityadmin&Operation=AddOperation','OperationTree','450','580',',scrollbars=yes,resizable=yes,directories=no,menubar=no,toolbar=no,addressbar=yes')"><fmt:message key="webclient.admin.adminpanel.operationconfig"/></a></td>
                        </tr> 
                </c:when>

                <c:otherwise>
                <tr>
                        <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/operations.gif' ></td>
                        <td nowrap><fmt:message key="webclient.admin.adminpanel.operationconfig"/></td>
                </tr> 
        </c:otherwise>

        </c:choose>

        <%-- ******* Operation settings related Code snippet ******* --%>
</table>
	</div>
	
</td>
 </tr>
</table>

		
		</td>
        <td class="generalCurveRight">&nbsp;</td>
      </tr>
      <tr>
        <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
    </table></td>
  </tr>
</table>


<table style="margin-bottom:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" style="padding-right:20px;"><table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key = 'webclient.admin.config.header'/></span></td>
        <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
      <tr>
        <td class="generalCurveLeft">&nbsp;</td>
        <td valign="top" class="generalTBPadding" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div class="adminDiv">
          <table border="0" cellspacing="0" cellpadding="0">

        <c:choose>

<c:when test="${getEventFilters=='true' || setEventFilters=='true' || getAlertFilters=='true' || setAlertFilters=='true'}">
        <tr>
              <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/notification_profiles.gif' ></td>
              <td nowrap><a href="/admin/NotificationProfiles.do"><fmt:message key="webclient.admin.filters.notifications"/></a></td>
            </tr>
</c:when>

<c:otherwise>
        <tr>
              <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/notification_profiles.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.filters.notifications"/></td>
            </tr>
</c:otherwise>
</c:choose>

<%-- ******* Trap Parser related Code snippet ******* --%>

<c:choose>

<c:when test="${getTrapParser=='true' || setTrapParser=='true'}">  
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admintrapparsericon.gif' ></td>
              <td nowrap><a href="/admin/TrapParser.do"><fmt:message key="webclient.admin.runtimeadmin.trapparser.link"/></a></td>
            </tr>
</c:when>

<c:otherwise>
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admintrapparsericon.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.runtimeadmin.trapparser.link"/></td>
            </tr>
</c:otherwise>
          
</c:choose>

<%-- ******* Trap Parser related Code snippet ******* --%>

<%-- ******* Event Parser related Code snippet ******* --%>

<c:choose>

<c:when test="${getEventParser=='true' || setEventParser=='true'}">
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admineventparsericon.gif' ></td>
              <td nowrap><a href="/admin/EventParser.do"><fmt:message key="webclient.admin.runtimeadmin.eventparser.link"/></a></td>
            </tr>
</c:when>

<c:otherwise>
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admineventparsericon.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.runtimeadmin.eventparser.link"/></td>
            </tr>
</c:otherwise>

</c:choose>

<%-- ******* Event Parser related Code snippet ******* --%>            
            
            
          </table>
        </div></td>
    <td width="45%" valign="top">
	<div class="adminDiv">
                <table border="0" cellspacing="0" cellpadding="0">

<%-- ******* Event Filters related Code snippet ******* --%>

<c:choose>

<c:when test="${getEventFilters=='true' || setEventFilters=='true'}"> 
         <tr>
                    <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/event_filters.gif' ></td>
                    <td nowrap><a href="/admin/EventFilters.do"><fmt:message key="webclient.admin.filters.event"/></a></td>
                  </tr>
</c:when>

<c:otherwise>
         <tr>
                    <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/event_filters.gif' ></td>
                    <td nowrap><fmt:message key="webclient.admin.filters.event"/></td>
                  </tr>
</c:otherwise>
          
</c:choose>

<%-- ******* Event Filters related Code snippet ******* --%>

<%-- ******* Alert Filters related Code snippet ******* --%>

<c:choose>

<c:when test="${getAlertFilters=='true' || setAlertFilters=='true'}"> 
        <tr>
                    <td height="32" ><IMG border='0' align=center src='/webclient/common/images/alert_filters.gif' ></td>
                    <td nowrap><a href="/admin/AlertFilters.do"><fmt:message key="webclient.admin.filters.alert"/></a></td>
                  </tr>
</c:when>

<c:otherwise>
        <tr>
                    <td height="32" ><IMG border='0' align=center src='/webclient/common/images/alert_filters.gif' ></td>
                    <td nowrap><fmt:message key="webclient.admin.filters.alert"/></td>
                  </tr>
</c:otherwise>
          
</c:choose>

<%-- ******* Alert Filters related Code snippet ******* --%>                 

<c:choose>
<c:when test="${logging=='true'}">
        <tr>
                    <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminloggingicon.gif' ></td>
                    <td nowrap><a href="/admin/log4jAction.do"><fmt:message key="webclient.admin.config.logsconfig"/></a></td>
                  </tr>
</c:when>

<c:otherwise>
        <tr>
                    <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminloggingicon.gif' ></td>
                    <td nowrap>Logs Configurator</td>
                  </tr>
</c:otherwise>

</c:choose>                  
                </table>
            </div>
	</td>
  </tr>
</table>

		
		
            
          </td>
        <td class="generalCurveRight">&nbsp;</td>
      </tr>
      <tr>
        <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
    </table></td>
    <td width="40%" valign="top"><table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key="webclient.admin.monitor.header"/></span></td>
        <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
      <tr>
        <td class="generalCurveLeft">&nbsp;</td>
        <td valign="top" class="generalTBPadding" >
		<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<div class="adminDiv">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/Web-NMS-Details.gif' ></td>
              <td nowrap><a href="/admin/AdminServerStatus.do?toPerform=webnmsDetails"><fmt:message key="webclient.admin.webnms.details"/></a></td>
            </tr>
            <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/JVM-Management.gif' ></td>
              <td nowrap><a href="/admin/TaskManager.do"><fmt:message key="webclient.admin.webnms.management"/></a></td>
            </tr>
            <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminperfstatus.gif' ></td>
              <td nowrap><a href="/admin/PerformanceModule.do"><fmt:message key="webclient.admin.perf.status"/></a></td>
            </tr>
          </table>
        </div>
	</td>
  </tr>
</table>

		
		
          </td>
        <td class="generalCurveRight">&nbsp;</td>
      </tr>
      <tr>
        <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
    </table></td>
  </tr>
</table>
<table style="margin-bottom:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" style="padding-right:20px;"><table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key='webclient.admin.adminoperations.header'></fmt:message></span></td>
        <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
      <tr>
        <td class="generalCurveLeft">&nbsp;</td>
        <td valign="top" class="generalTBPadding" >
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><div class="adminDiv">
          <table border="0" cellspacing="0" cellpadding="0">

            <tr>
              <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/mailserver-settings.gif' ></td>
              <td nowrap><a href="/admin/MailServerSettingsadmin.do?method=defaults"><fmt:message key='webclient.admin.mailsettings.link'></fmt:message></a></td>
            </tr>


        <c:choose>

<c:when test="${backup == 'true'}">
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminbackup.gif' ></td>
              <td nowrap><a href="/admin/Backup.do"><fmt:message key="webclient.admin.systemadmin.services.backup.treename"/></a></td>
            </tr>
</c:when>

<c:otherwise>
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminbackup.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.systemadmin.services.backup.treename"/></td>
            </tr>
</c:otherwise>

</c:choose>
            

<c:choose>

<c:when test="${backup == 'true' && resumeNMS=='true'}">
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminresyncwithbackup.gif' ></td>
              <td nowrap><a href="/admin/ReSyncNEWithBackup.do"><fmt:message key="webclient.admin.sysadmin.resyncbackup.link"/></a></td>
            </tr>
</c:when>

<c:otherwise>  
        <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminresyncwithbackup.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.sysadmin.resyncbackup.link"/></td>
            </tr>
</c:otherwise>

</c:choose>
            
          </table>
        </div></td>
    <td width="45%" valign="top">
	<div class="adminDiv">
                <table border="0" cellspacing="0" cellpadding="0">
        <c:choose>

<c:when test="${resumeNMS=='true'}"> 
         <tr>
                    <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/adminresync.gif' ></td>
                    <td nowrap><a href="/admin/ReSyncNE.do"><fmt:message key="webclient.admin.sysadmin.resync.link"/></a></td>
                  </tr> 
</c:when>

<c:otherwise>
         <tr>
                    <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/adminresync.gif' ></td>
                    <td nowrap><fmt:message key="webclient.admin.sysadmin.resync.link"/></td>
                  </tr>
</c:otherwise>

</c:choose>
                 

        <c:choose>

<c:when test="${shutDown == 'true'}">
        <tr>
                    <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminshutdown.gif' ></td>
                    <td nowrap><a href="/admin/ShutDown.do"><fmt:message key="webclient.admin.systemadmin.shutdown.treename"/></a></td>
                  </tr>
</c:when>

<c:otherwise>  
        <tr>
                    <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminshutdown.gif' ></td>
                    <td nowrap><fmt:message key="webclient.admin.systemadmin.shutdown.treename"/></td>
                  </tr>
</c:otherwise>

</c:choose>

<%-- *********** Configure MultiThread Event Alert Processing ************ --%>

<c:choose>

<c:when test="${MTAPAdministration == 'true'}">
        <tr>
                <td height="32" ><IMG border='0' align=center src='/webclient/common/images/configureMTEAP.gif' ></td>
                <td nowrap>
                        <a href="/admin/ConfigureMTAPForm.do?toPerform=getConfigDetails">
                        <fmt:message key="webclient.admin.systemadmin.mtap.treename"/>
                        </a>
                </td>
        </tr>
</c:when>

<c:otherwise>
        <tr>
                <td height="32" ><IMG border='0' align=center src='/webclient/common/images/configureMTEAP.gif' ></td>
                <td nowrap><fmt:message key="webclient.admin.systemadmin.mtap.treename"/></td>
        </tr>
</c:otherwise>

</c:choose>

<%-- *********** Configure MultiThread Event Alert Processing ************ --%>

                </table>
              </div>
	
	</td>
  </tr>
</table>

		
		
          </td>
        <td class="generalCurveRight">&nbsp;</td>
      </tr>
      <tr>
        <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
    </table></td>
    <td width="40%" valign="top"><table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"><span class="generalTitle"><fmt:message key="webclient.admin.tools.header"/></span></td>
        <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
      <tr>
        <td class="generalCurveLeft">&nbsp;</td>
        <td valign="top" class="generalTBPadding" >
		
		<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
	<div class="adminDiv">
          <table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="40" height="32" ><IMG border='0' align=center src='/webclient/common/images/admindiscparam.gif' ></td>
              <td nowrap><a href="/admin/MibBrowser.do"><fmt:message key="webclient.mibbrowser.head"/></a></td>
            </tr>

        <c:choose>
<c:when test="${logging=='true'}">
         <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admindisccriteria.gif' ></td>
              <td nowrap><a href="/admin/viewlogAction.do"><fmt:message key="webclient.admin.runtimeadmin.spylog.link"/></a></td>
            </tr>
</c:when>

<c:otherwise>
         <tr>
              <td height="32" ><IMG border='0' align=center src='/webclient/common/images/admindisccriteria.gif' ></td>
              <td nowrap><fmt:message key="webclient.admin.runtimeadmin.spylog.link"/></td>
            </tr>
</c:otherwise>

</c:choose>
           

        <c:choose>

                <c:when test="${auditTrails == 'true'}">
                        <tr>
                                <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminperfstatus.gif' ></td>
                                <td nowrap><a href="/admin/AuthAudit.do?""><fmt:message key="webclient.admin.audit.viewer"/></a></td>
                        </tr>
                </c:when>
                <c:otherwise>
                        <tr>
                                <td height="32" ><IMG border='0' align=center src='/webclient/common/images/adminperfstatus.gif' ></td>
                                <td nowrap><fmt:message key="webclient.admin.adminpanel.audittrails"/></td>
                        </tr>
                </c:otherwise>

        </c:choose>
        </table>
        </div>
	
	</td>
  </tr>
</table>

		</td>
        <td class="generalCurveRight">&nbsp;</td>
      </tr>
      <tr>
        <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
    </table></td>
  </tr>
</table>

</body>
</html>
