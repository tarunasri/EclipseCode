<%-- $Id: DeviceNotes.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>
<%@ include file="/webclient/common/jspf/commonIncludes.jspf" %>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/dashboard.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/common/js/general.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript1.2" SRC="/webclient/topo/js/moFunctions.js"></SCRIPT>

<html>
<body>
              <table   width="100%" border="0" cellspacing="0" cellpadding="5"> 
                <tr> 
                  <td></td> 
                  <td></td> 
                </tr>

                
                <c:choose>
                <c:when test="${ObjectDetailsBean.map.type eq 'Interface'}">
                <!-- SnmpInterface specific details starts -->
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
                             <select id="groupslist"  class="formStyle">
                                 <c:forTokens items="${ObjectDetailsBean.map.groupNames}" var="token" delims=" " varStatus="counter" >
                                     <option value ='<c:out value="${token}"/>'>
                                        <c:out value="${token}"/>
                                     </option>
                                 </c:forTokens> 
                              </select><a href='javascript:showGroups()'><fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a>
                        </c:when> <c:otherwise> <span >--</span> </c:otherwise></c:choose> 
                           
                    </td>
                 </tr> 
                <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.snmpport'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.snmpport}'/></td>
                </tr>
                <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.basemibs'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.baseMibs}'/></td>
                </tr>
                <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.readcommunity'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.community}'/></td>
                </tr>
                <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.writecommunity'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.writeCommunity}'/></td>
                </tr>
                <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.physmedia'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.physMedia}'/></td>
                </tr>
                <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.physaddr'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.physAddr}'/></td>
                </tr>
                <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.ifspeed'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.ifSpeed}'/></td>
                </tr>
                <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.ifdescr'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.ifDescr}'/></td>
                </tr>
                <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.sysoid'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.sysOID}'/></td>
                </tr>
                <tr class="oddRow">
                       <td><fmt:message key='webclient.topo.objectdetails.ifindex'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.ifIndex}'/></td>
                </tr>
                <tr>
                       <td><fmt:message key='webclient.topo.objectdetails.version'/></td>
                       <td>: <c:out value='${ObjectDetailsBean.map.version}'/></td>
                </tr>
                <c:choose>
                <c:when test='${ObjectDetailsBean.map.version == "v3"}'> 
                <tr class="oddRow">
                  <td><fmt:message key='webclient.topo.objectdetails.contextname'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.contextName}'/></td>
                </tr>
                <tr>
                  <td><fmt:message key='webclient.topo.objectdetails.username'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.userName}'/></td>
                </tr>
                 </c:when>
                 <c:otherwise>
                 <tr class="oddRow"><td>&nbsp;</td><td>&nbsp;</td></tr>
                 <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
                 </c:otherwise>
                 </c:choose>
                 
                

                <!-- SnmpInterface specific details ends -->
                </c:when>
                <c:otherwise>
                
                <!-- Common Properties starts --> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.interfacelist'/></td> 
                  <td>: <select name="interfacelist" class="formStyle" >
                           <c:forTokens items="${ObjectDetailsBean.map.InterfaceList}" var="token" delims=" " >
                              <option value ='<c:out value="${token}"/>'><c:out value="${token}"/></option>
                           </c:forTokens> 
                        </select>
                  </td> 
                <tr class="oddRow" > 
                  <td><fmt:message key='webclient.topo.objectdetails.parentkey'/></td> 
                  <td>: <c:choose> <c:when test="${!empty ObjectDetailsBean.map.parentKey}">
                                        <c:out value='${ObjectDetailsBean.map.parentKey}'/>
                                     </c:when> <c:otherwise> -- </c:otherwise> </c:choose>
                  </td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.iscontainer'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.isContainer}'/></td> 
                <c:choose>
                <c:when test='${ObjectDetailsBean.map.isContainer == "true"}'> 
                <tr>   
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
                <tr class="oddRow" > 
                  <td nowrap><fmt:message key='webclient.topo.objectdetails.parentnet'/></td> 
                  <td nowrap>: <select id="parentnetslist2" class="formStyle">
                            <c:forTokens items="${ObjectDetailsBean.map.parentNet}" var="token" delims=" " >
                                <option  value ='<c:out value="${token}"/>'><c:out value="${token}"/></option>
                             </c:forTokens> 
                        </select><a href='javascript:showNetworkDetails()'><fmt:message key='webclient.topo.objectdetails.groupnames.details'/></a>
                        
                  </td> 
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
                <tr class="oddRow" > 
                  <td><fmt:message key='webclient.topo.objectdetails.isgroup'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.isGroup}'/></td>
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
                  
                <!-- Common Properties ends -->
                
                
                <!-- Snmp Node specific details starts -->
               
          <c:choose>
            <c:when test="${classname eq 'SnmpNode' || classname eq 'Printer' || classname eq 'SwitchObject'}">    
                
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.snmpport'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.snmpport}'/></td> 
                <tr class="oddRow" > 
                  <td><fmt:message key='webclient.topo.objectdetails.basemibs'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.baseMibs}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.readcommunity'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.community}'/></td> 
                <tr class="oddRow" > 
                  <td><fmt:message key='webclient.topo.objectdetails.writecommunity'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.writeCommunity}'/></td> 
                <tr> 
                  <td><fmt:message key='webclient.topo.objectdetails.version'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.version}'/></td> 
                <tr class="oddRow" > 
                  <td><fmt:message key='webclient.topo.objectdetails.hostnetmask'/></td> 
                  <td>: <c:out value='${ObjectDetailsBean.map.hostNetmask}'/></td> 
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
                
               <tr>
                  <td><fmt:message key='webclient.topo.objectdetails.sysoid'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.sysOID}'/></td>
                </tr>
                <tr class="oddRow">
                  <td><fmt:message key='webclient.topo.objectdetails.sysdescr'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.sysDescr}'/></td>
                </tr>
                
           </c:when>
         </c:choose>
         
             <!-- Snmp Node specific details ends -->
             
            <!-- Printer specific details starts -->
            
            <c:choose>
              <c:when test="${classname eq 'Printer'}">    
                <tr>
                  <td><fmt:message key='webclient.topo.objectdetails.tab.printer.devicestatus'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.deviceStatus}'/></td>
                </tr>
                <tr class="oddRow">
                  <td><fmt:message key='webclient.topo.objectdetails.tab.printer.printerstatus'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.printerStatus}'/></td>
                </tr>
                <tr>
                  <td><fmt:message key='webclient.topo.objectdetails.tab.printer.printerdetectederrstatus'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.printerDetectedErrStatus}'/></td>
                </tr>
                <tr class="oddRow">
                  <td><fmt:message key='webclient.topo.objectdetails.tab.printer.consoledispbuffertext'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.consoleDispBufferText}'/></td>
                </tr>
                
             </c:when>
           </c:choose>
             
            <!-- Printer specific details ends -->
            
            <!-- Switch Object specific details starts -->
            
            <c:choose>
              <c:when test="${classname eq 'SwitchObject'}"> 
            
                 <tr>
                  <td><fmt:message key='webclient.topo.objectdetails.switch.rootcost'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.rootCost}'/></td>
                </tr>
                <tr class="oddRow">
                  <td><fmt:message key='webclient.topo.objectdetails.switch.numports'/></td>
                  <td>: <c:out value='${ObjectDetailsBean.map.numPorts}'/></td>
                </tr>
                
             </c:when>
            </c:choose>
            
            </c:otherwise>
            </c:choose>
            
             <!-- Switch Object specific details ends -->    
              </table> 
          
</body>
</html>