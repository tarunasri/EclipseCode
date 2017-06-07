<%-- $Id: DeviceDetailsLayout1.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>

      
       
              <table  width="100%" border="0" cellspacing="0" cellpadding="5"> 
                <tr> 
                  <td width="39%"></td> 
                  <td width="61%"></td> 
                </tr> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.displayname'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.displayName}'/></td> 
                <tr class="oddRow" > 
                  <td><fmt:message key='webclient.topo.objectdetails.type'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.type}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.ipaddress'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.ipAddress}'/></td> 
                <tr class="oddRow"> 
                  <td><fmt:message key='webclient.topo.objectdetails.netmask'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.netmask}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.managed'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.managed}'/></td> 
                <tr class="oddRow"> 
                  <td><fmt:message key='webclient.topo.objectdetails.status'/></td> 
                  <td><img src="<c:out value="${ObjectDetailsBean.map.statusImage}" />" border=0 width="16" alt="<c:out value='${ObjectDetailsBean.map.stringstatus}'/>" > <c:out value='${ObjectDetailsBean.map.stringstatus}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.statuspollenabled'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.statusPollEnabled}'/></td> 
                <tr id="pollint" class="oddRow"> 
                  <td><fmt:message key='webclient.topo.objectdetails.pollinterval'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.pollInterval}'/> <fmt:message key='webclient.topo.objectdetails.pollinterval.seconds'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.tester'/> </td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.tester}'/></td> 
                <tr class="oddRow"> 
                  <td><fmt:message key='webclient.topo.objectdetails.userclass'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.uClass}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.statusupdatetime'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.statusUpdateTime}'/></td> 
                <tr class="oddRow"> 
                  <td><fmt:message key='webclient.topo.objectdetails.statuschangetime'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.statusChangeTime}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.failurecount'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.failureCount}'/></td> 
                <tr class="oddRow"> 
                  <td><fmt:message key='webclient.topo.objectdetails.failurethreshold'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.failureThreshold}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.isdhcp'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.isDHCP}'/></td> 
               
                </tr>
                <tr class="oddRow"> 
               
              </table> 
      
			
		
		 
 
