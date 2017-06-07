<%-- $Id: EditDeviceDetailsLayout2.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
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
      <td>:
        <html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="displayName"/>
		      <html-el:errors property="displayName"/>
		      <c:set target="${ObjectDetailsBean.map}" property="displayName" value="${null}"/> </td>
    <tr class="oddRow" > 
      <td><fmt:message key='webclient.topo.objectdetails.type'/></td> 
      <td>: <c:out value='${ObjectDetailsBean.map.type}'/></td> 
<c:choose>
<c:when test="${ObjectDetailsBean.map.type eq 'Port' || classname eq 'ManagedObject'}">
    
</c:when>
<c:otherwise> 
     <tr> 
       <td><fmt:message key='webclient.topo.objectdetails.ipaddress'/></td> 
       <td>: <c:out value='${ObjectDetailsBean.map.ipAddress}'/></td>
</c:otherwise>
</c:choose>
<c:choose>
<c:when test="${ObjectDetailsBean.map.type eq 'Port' || classname eq 'ManagedObject'}">
    
</c:when>
<c:otherwise>
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
</c:otherwise>
</c:choose>    
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
    <tr class="oddRow"> 
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
<c:choose>
<c:when test="${ObjectDetailsBean.map.type eq 'Port' || classname eq 'ManagedObject'}">
    
</c:when>
<c:otherwise> 
    <tr> 
        <td><fmt:message key='webclient.topo.objectdetails.isdhcp'/></td> 
        <td>: <c:out value='${ObjectDetailsBean.map.isDHCP}'/></td>
</c:otherwise>
</c:choose> 

       <c:choose>
            <c:when test="${classname eq 'Network' && ObjectDetailsBean.map.type != 'Interface' && ObjectDetailsBean.map.type != 'Port'}">
                <tr class="oddRow"> 
                  <td><fmt:message key='webclient.topo.objectdetails.discoverystatus'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.discoveryStatus}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.discover'/></td> 
                  <td width="210">
                   <html-el:radio name="ObjectDetailsBean" property="discover" value="true"/><fmt:message key='webclient.topo.objectdetails.discover.yes'/>
                   <html-el:radio name="ObjectDetailsBean" property="discover" value="false"/><fmt:message key='webclient.topo.objectdetails.discover.no'/>
                    </td>
                
                 <tr class="oddRow">
                  <td> <fmt:message key='webclient.topo.objectdetails.network.subnets'/> </td>
                  <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.subNets}">
                           <select  id="subnetslist" class="formStyle" >
                              <c:forTokens items="${ObjectDetailsBean.map.subNets}" var="token" delims=" " varStatus="counter" >
                                <option value ='<c:out value="${token}"/>'>
                                  <c:out value="${token}"/>
                                </option>
                               </c:forTokens> 
                           </select><a href="#" ><fmt:message key='webclient.topo.objectdetails.network.subnets.details'/></a>
                         </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                  </td>
                 <tr>
                  <td> <fmt:message key='webclient.topo.objectdetails.network.subnetmasks'/> </td>
                  <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.subNetNetmasks}">
                           <select  id="subnetmaskslist" class="formStyle" >
                              <c:forTokens items="${ObjectDetailsBean.map.subNetNetmasks}" var="token" delims=" " varStatus="counter" >
                                <option value ='<c:out value="${token}"/>'>
                                  <c:out value="${token}"/>
                                </option>
                               </c:forTokens> 
                           </select>
                         </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                  </td>
                 <tr class="oddRow">
                  <td> <fmt:message key='webclient.topo.objectdetails.network.parentnetmask'/> </td>
                  <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentNetmask and ObjectDetailsBean.map.parentNetmask != 'null'}">
                           <c:out value='${ObjectDetailsBean.map.parentNetmask}'/>
                        </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                  </td>
                 <tr>
                  <td> <fmt:message key='webclient.topo.objectdetails.network.parentnetwork'/> </td>
                  <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentNetwork and ObjectDetailsBean.map.parentNetwork != 'null'}">
                           <c:out value='${ObjectDetailsBean.map.parentNetwork}'/>
                        </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                  </td>
            </c:when>
            </c:choose>
            
            <c:choose>
            <c:when test="${classname eq 'Node' && ObjectDetailsBean.map.type != 'Interface' && ObjectDetailsBean.map.type != 'Port'}">
                  <tr class="oddRow">
                    <td> <fmt:message key='webclient.topo.objectdetails.network.interfacelist'/> </td>
                    <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.InterfaceList}">
                           <select  id="interfacelist" class="formStyle" >
                              <c:forTokens items="${ObjectDetailsBean.map.InterfaceList}" var="token" delims=" " varStatus="counter" >
                                <option value ='<c:out value="${token}"/>'>
                                  <c:out value="${token}"/>
                                </option>
                               </c:forTokens> 
                           </select>
                         </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                     </td>
                 <tr> 
                  <td nowrap><fmt:message key='webclient.topo.objectdetails.parentnet'/></td> 
                  <td nowrap>: <select id="parentnetslist2" class="formStyle">
                            <c:forTokens items="${ObjectDetailsBean.map.parentNet}" var="token" delims=" " >
                                <option value ='<c:out value="${token}"/>'><c:out value="${token}"/></option>
                             </c:forTokens> 
                        </select><a href='#'><fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a>
                        
                  </td>
                 <tr class="oddRow">
                     <td><fmt:message key='webclient.topo.objectdetails.parentkey'/></td>
                     <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentKey}">
                           <A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentKey}'/>
                           </A> </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                     </td>
                  <tr> 
                      <td nowrap><fmt:message key='webclient.topo.objectdetails.groupnames'/></td> 
                      <td nowrap>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupNames}">
                             <select name="groupnames"  class="formStyle">
                                 <c:forTokens items="${ObjectDetailsBean.map.groupNames}" var="token" delims=" " varStatus="counter" >
                                     <option value ='<c:out value="${token}"/>'>
                                        <c:out value="${token}"/>
                                     </option>
                                 </c:forTokens> 
                              </select><a href='#'><fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a>
                            </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose> 
                       </td>
                   <tr class="oddRow"> 
                        <td><fmt:message key='webclient.topo.objectdetails.iscontainer'/></td> 
                        <td>: <c:out value='${ObjectDetailsBean.map.isContainer}'/></td> 
                   <c:choose>
                   <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
                   <tr class="oddRow">   
                          <td><fmt:message key='webclient.topo.objectdetails.childrenkeys'/></td>
                          <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.childrenKeys}">
                              <select name="childerenkeyslist" class="formStyle">
                                   <c:forTokens items="${ObjectDetailsBean.map.childrenKeys}" var="token" delims=" " varStatus="counter" >
                                        <option value ='<c:out value="${token}"/>'>
                                          <c:out value="${token}"/>
                                        </option>
                                    </c:forTokens> 
                              </select> 
                              </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                       </td>
                     
                   </c:when>
                   </c:choose>
                   <tr> 
                             <td><fmt:message key='webclient.topo.objectdetails.isgroup'/></td> 
                             <td>: <c:out value='${ObjectDetailsBean.map.isGroup}'/></td>
                <c:choose>
                <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'>
                 <tr>    
                         <td> <fmt:message key='webclient.topo.objectdetails.groupmembers'/> </td>
                          <td> <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}">
                                 <select name="groupmembers"  class="formStyle">
                                      <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter" >
                                           <option value ='<c:out value="${token}"/>'>
                                               <c:out value="${token}"/>
                                           </option>
                                       </c:forTokens> 
                                 </select> 
                                 </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                           </td>
                  </c:when>
                  </c:choose>
                   <tr class="oddRow">
                        <td><fmt:message key='webclient.topo.objectdetails.snmpport'/></td>
                        <td>: <c:out value='${ObjectDetailsBean.map.snmpport}'/></td>
                   <tr>
                        <td><fmt:message key='webclient.topo.objectdetails.basemibs'/></td>
                        <td>: <c:out value='${ObjectDetailsBean.map.baseMibs}'/></td>
                   <tr class="oddRow"> 
                        <td><fmt:message key='webclient.topo.objectdetails.readcommunity'/></td> 
                         <td>: <c:out value='${ObjectDetailsBean.map.community}'/></td> 
                   <tr> 
                         <td><fmt:message key='webclient.topo.objectdetails.writecommunity'/></td> 
                         <td>: <c:out value='${ObjectDetailsBean.map.writeCommunity}'/></td> 
                   <tr class="oddRow"> 
                         <td><fmt:message key='webclient.topo.objectdetails.version'/></td> 
                         <td>: <c:out value='${ObjectDetailsBean.map.version}'/></td> 
                   <c:choose>
                   <c:when test='${ObjectDetailsBean.map.version == "v3"}'>
                   <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.contextname'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.contextName}'/></td>
                   </tr>
                   <tr class="oddRow">
                        <td><fmt:message key='webclient.topo.objectdetails.username'/></td>
                        <td>: <c:out value='${ObjectDetailsBean.map.userName}'/></td>
                   </tr>
                   </c:when>
                   <c:otherwise>
                   </c:otherwise>
                   </c:choose>
            </c:when>
            </c:choose>
            
            <c:choose>
            <c:when test="${ObjectDetailsBean.map.type eq 'Interface'}">
            
                 <tr>
                     <td><fmt:message key='webclient.topo.objectdetails.parentnet'/></td>
                     <td>: <A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentNet}'/>" > <c:out value='${ObjectDetailsBean.map.parentNet}'/>  </A></td>
                </tr>
                <tr class="oddRow">
                     <td><fmt:message key='webclient.topo.objectdetails.parentnode'/></td>
                     <td>: <A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentNodeKey}'/>" > <c:out value='${ObjectDetailsBean.map.parentNodeKey}'/>  </A></td>
                </tr>
                <tr>
                     <td><fmt:message key='webclient.topo.objectdetails.parentkey'/></td>
                     <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentKey}">
                           <A href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentKey}'/>
                           </A> </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                     </td>
                </tr>
                <tr class="oddRow">
                     <td><fmt:message key='webclient.topo.objectdetails.iscontainer'/></td>
                     <td>: <c:out value='${ObjectDetailsBean.map.isContainer}'/>
                     
                               
                </tr>
                <c:choose>
                <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
                <tr class="oddRow">   
                      <td><fmt:message key='webclient.topo.objectdetails.childrenkeys'/></td>
                      <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.childrenKeys}">
                              <select name="childerenkeyslist" class="formStyle">
                                   <c:forTokens items="${ObjectDetailsBean.map.childrenKeys}" var="token" delims=" " varStatus="counter" >
                                        <option value ='<c:out value="${token}"/>'>
                                          <c:out value="${token}"/>
                                        </option>
                                    </c:forTokens> 
                              </select> 
                              </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                       </td>
                  </tr> 
                  </c:when>
                  </c:choose>
                 <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.isgroup'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.isGroup}'/></td>
                 </tr>
                 <c:choose>
                 <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'>
                 <tr>    
                         <td> <fmt:message key='webclient.topo.objectdetails.groupmembers'/> </td>
                          <td> <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}">
                                 <select name="groupmembers"  class="formStyle">
                                      <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter" >
                                           <option value ='<c:out value="${token}"/>'>
                                               <c:out value="${token}"/>
                                           </option>
                                       </c:forTokens> 
                                 </select> 
                                 </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                           </td>
                  </tr>
                  </c:when>
                  </c:choose>
                
                <tr class="oddRow"> 
                  <td nowrap><fmt:message key='webclient.topo.objectdetails.groupnames'/></td> 
                  <td nowrap>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupNames}">
                             <select name="groupnames"  class="formStyle">
                                 <c:forTokens items="${ObjectDetailsBean.map.groupNames}" var="token" delims=" " varStatus="counter" >
                                     <option value ='<c:out value="${token}"/>'>
                                        <c:out value="${token}"/>
                                     </option>
                                 </c:forTokens> 
                              </select><a href='#'><fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a>
                        </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose> 
                           
                    </td>
                 </tr>
            
            </c:when>
            </c:choose>
            
            <c:choose>
            <c:when test="${ObjectDetailsBean.map.type eq 'Port'}">
                   <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.parentkey'/></td>
                       <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentKey}">
                         <a href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentKey}'/>
                         </a> </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                   </td>
                   <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.iscontainer'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.isContainer}'/>
                   <c:choose>
                   <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
                   <tr class="oddRow">   
                      <td><fmt:message key='webclient.topo.objectdetails.childrenkeys'/></td>
                      <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.childrenKeys}">
                              <select name="childerenkeyslist" class="formStyle">
                                   <c:forTokens items="${ObjectDetailsBean.map.childrenKeys}" var="token" delims=" " varStatus="counter" >
                                        <option value ='<c:out value="${token}"/>'>
                                          <c:out value="${token}"/>
                                        </option>
                                    </c:forTokens> 
                              </select> 
                              </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                       </td>
                   </tr> 
                  </c:when>
                  </c:choose>
                  <tr>
                   <td nowrap><fmt:message key='webclient.topo.objectdetails.groupnames'/></td> 
                   <td nowrap>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupNames}">
                             <select name="groupnames"  class="formStyle">
                                 <c:forTokens items="${ObjectDetailsBean.map.groupNames}" var="token" delims=" " varStatus="counter" >
                                     <option value ='<c:out value="${token}"/>'>
                                        <c:out value="${token}"/>
                                     </option>
                                 </c:forTokens> 
                              </select><a href='#'><fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a>
                        </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose> 
                           
                    </td>
                  <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.isgroup'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.isGroup}'/></td>
                    </tr>
                    <c:choose>
                    <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'>
                    <tr class="oddRow">    
                         <td> <fmt:message key='webclient.topo.objectdetails.groupmembers'/> </td>
                          <td> <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}">
                                 <select name="groupmembers"  class="formStyle">
                                      <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter" >
                                           <option value ='<c:out value="${token}"/>'>
                                               <c:out value="${token}"/>
                                           </option>
                                       </c:forTokens> 
                                 </select> 
                                 </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                           </td>
                     </tr>
                     </c:when>
                     </c:choose>
                    <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.portifspeed'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.portIfSpeed}'/> </td>
                    </tr>
                    <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.portifdescr'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.portIfDescr}'/> </td>
                    </tr>
                    <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.portstate'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.portState}'/> </td>
                    </tr>
                    <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.portifindex'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.portIfIndex}'/> </td>
                    </tr>
                    
                    
             </c:when>
             </c:choose>
             
             <c:choose>
            <c:when test="${classname eq 'ManagedObject'}">
                
                   <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.parentkey'/></td>
                       <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentKey}">
                         <a href="/topo/objectdetails.do?name=<c:out value='${ObjectDetailsBean.map.parentKey}'/>" ><c:out value='${ObjectDetailsBean.map.parentKey}'/>
                         </a> </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                        </td>
                  <tr class="oddRow">
                        <td><fmt:message key='webclient.topo.objectdetails.iscontainer'/></td>
                         <td>: <c:out value='${ObjectDetailsBean.map.isContainer}'/>
                   <c:choose>
                   <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
                   <tr class="oddRow">   
                      <td><fmt:message key='webclient.topo.objectdetails.childrenkeys'/></td>
                      <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.childrenKeys}">
                              <select name="childerenkeyslist" class="formStyle">
                                   <c:forTokens items="${ObjectDetailsBean.map.childrenKeys}" var="token" delims=" " varStatus="counter" >
                                        <option value ='<c:out value="${token}"/>'>
                                          <c:out value="${token}"/>
                                        </option>
                                    </c:forTokens> 
                              </select> 
                              </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                       </td>
                   </tr> 
                  </c:when>
                  </c:choose>
                  <tr>
                   <td nowrap><fmt:message key='webclient.topo.objectdetails.groupnames'/></td> 
                   <td nowrap>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupNames}">
                             <select id="groupslist"  class="formStyle">
                                 <c:forTokens items="${ObjectDetailsBean.map.groupNames}" var="token" delims=" " varStatus="counter" >
                                     <option value ='<c:out value="${token}"/>'>
                                        <c:out value="${token}"/>
                                     </option>
                                 </c:forTokens> 
                              </select><a href='javascript:showGroups()'><fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a>
                        </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose> 
                           
                    </td>
                  <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.isgroup'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.isGroup}'/></td>
                    </tr>
                    <c:choose>
                    <c:when test='${ObjectDetailsBean.map.isGroup == "true"}'>
                    <tr class="oddRow">    
                         <td> <fmt:message key='webclient.topo.objectdetails.groupmembers'/> </td>
                          <td> <c:choose> <c:when test="${!empty ObjectDetailsBean.map.groupMembers}">
                                 <select name="groupmembers"  class="formStyle">
                                      <c:forTokens items="${ObjectDetailsBean.map.groupMembers}" var="token" delims=" " varStatus="counter" >
                                           <option value ='<c:out value="${token}"/>'>
                                               <c:out value="${token}"/>
                                           </option>
                                       </c:forTokens> 
                                 </select> 
                                 </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose>
                           </td>
                     </tr>
                     </c:when>
                     </c:choose>
                    
                                        
             </c:when>
             </c:choose>
            
 
    <tr>
      
     <td colspan="2" align="center"> <input type="submit" class="button" value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="update" /> <input type="button" class="button" value="<fmt:message key='webclient.topo.objectdetails.cancelbutton'/>" onClick="hidediv1('devicedetail','devicedetail_edit','cancel')"/> <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td>
    </tr> 
  </table> 
 
