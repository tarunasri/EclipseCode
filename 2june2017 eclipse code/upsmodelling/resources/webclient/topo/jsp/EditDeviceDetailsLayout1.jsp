<%-- $Id: EditDeviceDetailsLayout1.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
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
      <td>:
	      <html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="displayName"/>
		      <html-el:errors property="displayName"/>
		      <c:set target="${ObjectDetailsBean.map}" property="displayName" value="${null}"/> 
	      </td> 
        
    </tr>
    <tr class="oddRow" > 
      <td><fmt:message key='webclient.topo.objectdetails.type'/></td> 
      <td>: <c:out value='${ObjectDetailsBean.map.type}'/></td> 
    <tr> 
      <td><fmt:message key='webclient.topo.objectdetails.ipaddress'/></td> 
      <td>: <c:out value='${ObjectDetailsBean.map.ipAddress}'/></td>
    <tr class="oddRow"> 
      <td><fmt:message key='webclient.topo.objectdetails.netmask'/></td> 
      <td>:
        <html-el:select styleClass="formStyle" name="ObjectDetailsBean" property="netmask" >
          <html-el:option value='255.192.0.0'>255.192.0.0</html-el:option> <html-el:option value='255.224.0.0'>255.224.0.0</html-el:option>
          <html-el:option value='255.240.0.0'>255.240.0.0</html-el:option> <html-el:option value='255.248.0.0'>255.248.0.0</html-el:option>
          <html-el:option value='255.252.0.0'>255.252.0.0</html-el:option> <html-el:option value='255.254.0.0'>255.254.0.0</html-el:option>
          <html-el:option value='255.255.0.0'>255.255.0.0</html-el:option> <html-el:option value='255.255.128.0'>255.255.128.0</html-el:option>
          <html-el:option value='255.255.192.0'>255.255.192.0</html-el:option>
          <html-el:option value='255.255.224.0'>255.255.224.0</html-el:option>
          <html-el:option value='255.255.240.0'>255.255.240.0</html-el:option>
          <html-el:option value='255.255.248.0'>255.255.248.0</html-el:option>
          <html-el:option value='255.255.252.0'>255.255.252.0</html-el:option>
          <html-el:option value='255.255.254.0'>255.255.254.0</html-el:option>
          <html-el:option value='255.255.255.0'>255.255.255.0</html-el:option>
          <html-el:option value='255.255.255.128'>255.255.255.128</html-el:option>
          <html-el:option value='255.255.255.192'>255.255.255.192</html-el:option>
          <html-el:option value='255.255.255.224'>255.255.255.224</html-el:option>
          <html-el:option value='255.255.255.240'>255.255.255.240</html-el:option>
          <html-el:option value='255.255.255.248'>255.255.255.248</html-el:option>
          <html-el:option value='255.255.255.252'>255.255.255.252</html-el:option>
          </html-el:select> </td> 
          <c:set target="${ObjectDetailsBean.map}" property="netmask" value="${null}"/>
    <tr> 
           <td><fmt:message key='webclient.topo.objectdetails.managed'/></td> 
           <td>: <html-el:radio name="ObjectDetailsBean" property="managed" value="true"/>
            <fmt:message key='webclient.topo.objectdetails.managed.yes'/>
            <html-el:radio name="ObjectDetailsBean" property="managed" value="false"/><fmt:message key='webclient.topo.objectdetails.managed.no'/> 
           </td>   
    <tr class="oddRow"> 
      <td><fmt:message key='webclient.topo.objectdetails.status'/></td> 
      <td><img src="<c:out value="${ObjectDetailsBean.map.statusImage}" />" border=0 width="16" alt="<c:out value='${ObjectDetailsBean.map.stringstatus}'/>" > <c:out value='${ObjectDetailsBean.map.stringstatus}'/></td> 
    <tr> 
      <td><fmt:message key='webclient.topo.objectdetails.statuspollenabled'/></td> 
      <td width="210"> <html-el:radio name="ObjectDetailsBean" property="statusPollEnabled" value="true"/>
          <fmt:message key='webclient.topo.objectdetails.statuspollenabled.yes'/><html-el:radio name="ObjectDetailsBean" property="statusPollEnabled" value="false"/>
          <fmt:message key='webclient.topo.objectdetails.statuspollenabled.no'/> </td>
        <c:set target="${ObjectDetailsBean.map}" property="statusPollEnabled" value="${null}"/> 
    <tr  class="oddRow"> 
      <td><fmt:message key='webclient.topo.objectdetails.pollinterval'/></td> 
      <td>:
        <html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="pollInterval"/> 
        <fmt:message key='webclient.topo.objectdetails.pollinterval.seconds'/>
        <html-el:errors property="pollInterval"/> 
      </td>
      <c:set target="${ObjectDetailsBean.map}" property="pollInterval" value="${null}"/> 
    <tr> 
      <td><fmt:message key='webclient.topo.objectdetails.tester'/></td> 
      <td width="210">: <html-el:select styleClass="formStyle" name="ObjectDetailsBean" property="tester" >
          <html-el:option value='max'>Max</html-el:option> <html-el:option value='ping'>Ping</html-el:option>
          <html-el:option value='snmpping'>SNMP Ping</html-el:option> <html-el:option value='usertest'>User
          Tester</html-el:option><html-el:option value='latest'>Latest</html-el:option><html-el:option value='none'>None</html-el:option>
          </html-el:select> </td>
        <c:set target="${ObjectDetailsBean.map}" property="tester" value="${null}"/>
 
    <tr class="oddRow"> 
      <td><fmt:message key='webclient.topo.objectdetails.userclass'/></td> 
      <td>: <html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="uClass"/>
          <html-el:errors property="uClass"/>
		      <c:set target="${ObjectDetailsBean.map}" property="uClass" value="${null}"/> </td>
    <tr> 
      <td><fmt:message key='webclient.topo.objectdetails.statusupdatetime'/></td> 
      <td>: <c:out value='${ObjectDetailsBean.map.statusUpdateTime}'/></td> 
    <tr class="oddRow"> 
      <td><fmt:message key='webclient.topo.objectdetails.statuschangetime'/></td> 
      <td>: <c:out value='${ObjectDetailsBean.map.statusChangeTime}'/></td> 
    </tr>
    <tr> 
       <td><fmt:message key='webclient.topo.objectdetails.failurecount'/></td> 
       <td>: <c:out value='${ObjectDetailsBean.map.failureCount}'/></td> 
    <tr class="oddRow"> 
       <td><fmt:message key='webclient.topo.objectdetails.failurethreshold'/></td> 
       <td>:
            <html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="failureThreshold"/>
            <html-el:errors property="failureThreshold"/>
            <c:set target="${ObjectDetailsBean.map}" property="failureThreshold" value="${null}"/> </td> 
    <tr> 
        <td><fmt:message key='webclient.topo.objectdetails.isdhcp'/></td> 
        <td>: <c:out value='${ObjectDetailsBean.map.isDHCP}'/></td> 
    <tr>
       <td colspan="2" align="center"> <input type="submit" class="button" value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="update" /> <input type="button" class="button" value="<fmt:message key='webclient.topo.objectdetails.cancelbutton'/>" onClick="hidediv1('devicedetail','devicedetail_edit','cancel')"/> <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td>
    </tr>
  </table> 
 
