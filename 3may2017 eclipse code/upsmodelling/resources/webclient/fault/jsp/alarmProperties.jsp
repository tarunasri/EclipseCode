<%-- $Id: alarmProperties.jsp,v 1.3 2007/10/16 09:52:29 gnanasekar Exp $ --%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<table  width="100%" border="0" cellspacing="0" cellpadding="0" align="left">
 <tr> 
  <td>

       <c:choose>
       <c:when test="${pickUpStatus == true}">
         <c:set var="image" value="/webclient/common/images/tick.gif"/>
         <c:set var="result" value="webclient.fault.alarmdetails.pickup.success"/>
       </c:when>
       <c:when test="${pickUpStatus == false}">
         <c:set var="image" value="/webclient/common/images/cross.gif"/>
         <c:set var="result" value="webclient.fault.alarmdetails.pickup.failure"/>
       </c:when>
       <c:otherwise>
       </c:otherwise>
       </c:choose>

       <c:choose>
       <c:when test="${UnPickStatus == true}">
         <c:set var="image" value="/webclient/common/images/tick.gif"/>
         <c:set var="result" value="webclient.fault.alarmdetails.unpick.succes"/>
       </c:when>
       <c:when test="${UnPickStatus == false}">
         <c:set var="image" value="/webclient/common/images/cross.gif"/>
         <c:set var="result" value="webclient.fault.alarmdetails.unpick.failure"/>
       </c:when>
      <c:otherwise>
     </c:otherwise>
     </c:choose>

     <c:choose>
     <c:when test="${clearStatus == true}">
         <c:set var="image" value="/webclient/common/images/tick.gif"/>
         <c:set var="result" value="webclient.fault.alarmdetails.clear.success"/>
     </c:when>
    <c:when test="${clearStatus == false}">
         <c:set var="image" value="/webclient/common/images/cross.gif"/>
         <c:set var="result" value="webclient.fault.alarmdetails.clear.failure"/>
    </c:when>
    <c:otherwise>
   </c:otherwise>
   </c:choose>


    <c:if test="${!empty result}">
    <table width="100%" border="0" align="center" cellpadding="1" cellspacing="0">
      <tr>
        <td width="150" height="30" >&nbsp;</td>
          <td class="responseText" colspan="2"><img src="<c:out value='${image}'/>" alt="" width="17" height="13" hspace="5"><fmt:message><c:out value="${result}"/></fmt:message></td>
      </tr>
    </table>
    </c:if>


    <c:set var="severity" value="${alertProp.stringseverity}"/>
    <c:set var="groupName" value="${alertProp.groupName}"/>
   <table width="100%" height="22" border="0" align="left" cellpadding="5" cellspacing="0">
	   <tr>
        <td width="150"><span class="boldText"><fmt:message key='webclient.fault.details.properties.entity'/></span></td>
        <td  class="text"><c:out value="${alertProp.entity}"/></td></tr>

     <c:set target="${alertProp}" property="entity" value = "${null}"/>

    

    <tr class="generalOddRow">
        <td class="boldText"><fmt:message key='webclient.fault.details.properties.source'/></td>
        <td class="text"><c:out value="${alertProp.source}"/></td></tr>
        <c:set target="${alertProp}" property="source" value = "${null}"/>

    

    <tr> 
        <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.createdtime'/></span></td>
        <td  class="text"><c:out value="${alertProp.createTime}"/></td></tr>
       <c:set target="${alertProp}" property="createTime" value = "${null}"/>

    

    <tr class="generalOddRow" >
        <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.modttime'/></span></td>
        <td class="text"><c:out value="${alertProp.modTime}"/></td></tr>
       <c:set target="${alertProp}" property="modTime" value = "${null}"/>

<c:choose>
   <c:when test="${clearStatus == true}">
 
    <tr> 
       <td align="left"><span class="highlite"><fmt:message key='webclient.fault.details.properties.severity'/></span></td>
       <td  class="highlite"><img src="<c:out value="${alertProp.currentstatusImg}"/>" alt="<c:out value="${alertProp.stringseverity}"/>" title="<c:out value="${alertProp.stringseverity}"/>" width="16" align="top" height="16"><c:out value="${alertProp.stringseverity}"/></td></tr>
  </c:when>
  <c:otherwise>
   <tr> 
       <td align="left"><span class="boldText"><fmt:message key='webclient.fault.details.properties.severity'/></span></td>
       <td  class="text"><img src="<c:out value="${alertProp.currentstatusImg}"/>" alt="<c:out value="${alertProp.stringseverity}"/>" title="<c:out value="${alertProp.stringseverity}"/>" width="16" align="top" height="16"><c:out value="${alertProp.stringseverity}"/></td></tr>
 </c:otherwise>
</c:choose>

        <c:set target="${alertProp}" property="currentstatusImg" value = "${null}"/>
        <c:set target="${alertProp}" property="stringseverity" value = "${null}"/>

    
 
    <tr class="generalOddRow"> 
       <td  align="left"><span class="boldText"><fmt:message key='webclient.fault.details.properties.previousseverity'/></span></td>
       <c:choose>
       <c:when test="${alertProp.prestatusImg == '-'}">
          <td>
          </c:when>
          <c:otherwise>
          <td class="text"><img src="<c:out value="${alertProp.prestatusImg}"/>" alt="<c:out value="${alertProp.stringpreviousseverity}"/>" width="16" align="top" height="16">
           </c:otherwise>
      </c:choose>
      <c:out value="${alertProp.stringpreviousseverity}"/></td></tr>
      <c:set target="${alertProp}" property="stringpreviousseverity" value = "${null}"/>
      <c:set target="${alertProp}" property="prestatusImg" value = "${null}"/>

    
    <tr>
       <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.message'/></span></td>
       <td  class="text"><c:out value="${alertProp.message}"/></td></tr>
        <c:set target="${alertProp}" property="message" value = "${null}"/>

    

    <tr class="generalOddRow">
        <td><span class="boldText"><fmt:message key='webclient.fault.details.properties.category'/></span></td>
        <td class="text"><c:out value="${alertProp.category}"/></td></tr>
        <c:set target="${alertProp}" property="category" value = "${null}"/>


<c:choose>
  <c:when test="${pickUpStatus == true || param.pickUpStatus == true}">
    <tr>
      <td ><span class="highlite"><fmt:message key='webclient.fault.details.properties.owner'/></span></td>
      <td  class="highlite"><c:out value="${alertProp.owner}"/></td></tr>
  </c:when>
  <c:when test="${UnPickStatus == true}">
    <tr>
       <td><span class="highlite"><fmt:message key='webclient.fault.details.properties.owner'/></span></td>
       <td  class="highlite"><c:out value="${alertProp.owner}"/></td></tr>
  </c:when>
  <c:otherwise>
    <tr>
       <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.owner'/></span></td>
       <td  class="text"><c:out value="${alertProp.owner}"/></td></tr>
  </c:otherwise>
</c:choose>

    <c:set target="${alertProp}" property="owner" value = "${null}"/>

    

  <tr class="generalOddRow">
    <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.groupname'/></span></td>
    <td class="text"><c:out value="${alertProp.groupName}"/></td></tr>
    <c:set target="${alertProp}" property="groupName" value = "${null}"/>

    
  <tr>
    <td ><span class="boldText"><fmt:message key='webclient.fault.details.properties.priority'/></span></td>
    <td  class="text"><c:out value="${alertProp.priority}"/></td></tr>
    <c:set target="${alertProp}" property="priority" value = "${null}"/>



 
  <c:forEach var="prop" items="${alertProp}">                  
   <tr>    
     <td><span class="text"><c:out value="${prop.key}"/></span></td>
     <td ><span class="text"><c:out value="${prop.value}"/></span></td></tr>
  </c:forEach>
   </table>
   </td></tr>
  </table>

</td>

<%@include file="/webclient/fault/jspf/alarmDetailsFooter.jspf" %>
