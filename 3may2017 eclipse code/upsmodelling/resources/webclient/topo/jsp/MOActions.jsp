<%-- $Id: MOActions.jsp,v 1.2 2010/10/29 13:47:16 swaminathap Exp $ --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<script language="javascript" SRC="/webclient/common/js/navigation.js" type="text/javascript"></script>

<%@include file="/webclient/topo/jspf/inventoryViewOperations.jspf" %>

<style>
      #object a, #network a,#others a { cursor: pointer; }
</style>


 <table width="100%" cellspacing="0" cellpadding="0" border="0">
   <tr>
      <td valign="bottom" align="right" style="padding-right: 30px;">
          <table cellspacing="0" cellpadding="0" border="0">
             <tr>
                <td onmouseover="enableMenu('moactions',100);" onmouseout="disableMenu('moactions',100);">
                 <div style="margin-right: 0px;" class="rightF">
                   <table cellspacing="0" cellpadding="0" border="0" class="dropdownnTxt" style="border-bottom: 0px solid; width: 115px;">
                     <tr>
                       <c:choose>
                       <c:when test="${MapActions eq 'true'}">
                       <td nowrap="nowrap" width="95"><fmt:message key='webclient.topo.objectdetails.mapactions'/></td>
                       </c:when>
                       <c:otherwise>
                       <td nowrap="nowrap" width="95"><fmt:message key='webclient.topo.objectdetails.actions'/></td>
                       </c:otherwise>
                       </c:choose>
                       <td width="20" align="right" style="background-image: url(/webclient/common/images/pulldown_arrow.gif); background-position: center center;"></td>
                     </tr>
                   </table>
                   <div style="padding: 2px; width: 133px; display: none; text-align: left; margin-top: 0px;" class="menuDiv1" id="moactions">
                     
                     
                     
                             
                                
                                    <c:set var='obj'>
                                       <fmt:message key='webclient.topo.menu.object'/>
                                    </c:set>
                                    <c:set var='ntk'>
                                       <fmt:message key='webclient.topo.menu.network'/>
                                    </c:set>
                                    <c:set var='mop'>
                                       <fmt:message key='webclient.topo.menu.mop'/>
                                    </c:set>

                                    <c:forEach var="headers" items="${menuVector}" varStatus="loopstatus">
                                     <c:set var="lists" value="${headers.list}"/>
                                      <c:choose>
                                       <c:when test="${headers.displayName == obj}">
                                       <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
                                        <c:if test="${list1.id ne mop}">
                                         
                                         <p id="object" style="margin: 0px; padding: 0px; clear: both; line-height: 20px; cursor: pointer;" class="menuDivider" onmouseover="javascript:mouseSelect(this);" onmouseout="javascript:removeSelect(this);"><a onclick="javascript:performOperation1('<c:out value="${list1.url}" />')" href="javascript:void(0);"><c:out value="${list1.id}" /></a></p>
                                                     
                                       </c:if>
                                     </c:forEach>   

                                   </c:when>
                                   <c:when test="${headers.displayName eq ntk}">

                                    <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
                                                         
                                        <p id="network" style="margin: 0px; padding: 0px; clear: both; line-height: 20px; cursor: pointer;" class="menuDivider" onmouseover="javascript:mouseSelect(this);" onmouseout="javascript:removeSelect(this);"><a onclick="javascript:performOperation1('<c:out value="${list1.url}" />')" href="javascript:void(0);"><c:out value="${list1.id}" /></a></p>   
                                     
                                  </c:forEach>   

                                 </c:when>
                               <c:otherwise>
                             <c:forEach var="list1" items="${lists}" varStatus="loopstatus">
                            
                                 <p id="others" style="margin: 0px; padding: 0px; clear: both; line-height: 20px; cursor: pointer;" class="menuDivider" onmouseover="javascript:mouseSelect(this);" onmouseout="javascript:removeSelect(this);"><a onclick="javascript:performOperation1('<c:out value="${list1.url}" />')" href="javascript:void(0);"><c:out value="${list1.id}" /></a></p>
                             	
                             </c:forEach>
 
                            </c:otherwise>
                            </c:choose>
    
                            </c:forEach>

                      
                   
                     
                     
                     
                   </div>
                 </div>
                </td>
             </tr>
          </table>
      </td>
    </tr>
  </table>
  
 





