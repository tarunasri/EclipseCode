<%-- $Id: objectDetails.jsp,v 1.3 2010/10/29 13:47:16 swaminathap Exp $ --%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script language="javascript" src="/webclient/common/js/swipe.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="JavaScript" SRC="/webclient/common/js/dynamicInput.js"  TYPE='text/javascript'></SCRIPT>

<title><fmt:message key='webclient.topo.objectdetails.title'><fmt:param value="${ObjectDetailsBean.map.name}"/></fmt:message></title>

<tiles:useAttribute id="mode" name="mode" ignore="true" classname="java.lang.String" />
<tiles:useAttribute id="initSelectedTab" name="initSelectedTab" ignore="true" classname="java.lang.String" />


<c:choose>
<c:when test="${empty actionName}">
   <c:set var="actionName" value='${param.actionName}'/>  
</c:when> 
<c:otherwise>
   <c:set var="actionName" value='${actionName}'/>  
</c:otherwise>
</c:choose>

<c:choose>
<c:when test="${empty beanName}">
   <c:set var="beanName" value='${param.beanName}' scope="request" />  
</c:when> 
<c:otherwise>
   <c:set var="beanName" value='${beanName}' scope="request"/>  
</c:otherwise>
</c:choose>

<c:set var="onSubmitFunction">return validate<c:out value="${beanName}"/>(this);</c:set>
<%-- set parameters for V3 query issue in device details page. --%>
<c:set var="version" value="${ObjectDetailsBean.map.version}" scope="request"/>
<c:set var="snmpport" value="${ObjectDetailsBean.map.snmpport}" scope="request"/>
<c:set var="contextName" value="${ObjectDetailsBean.map.contextName}" scope="request"/>
<c:set var="userName" value="${ObjectDetailsBean.map.userName}" scope="request"/>
<c:set var="community" value="${ObjectDetailsBean.map.community}" scope="request"/>

<html-el:form action='${actionName}?requestid=SNAPSHOT&perform=update' onsubmit='${onSubmitFunction}'>
<%-- <c:out value='${actionName}' /> --%>
<c:choose>
<c:when test="${empty param.mode}">
   <c:set var="uiMode" value="${mode}" scope="request"/>  
</c:when>  
<c:otherwise>
   <c:set var="uiMode" value="${param.mode}" scope="request"/>  
</c:otherwise>  
</c:choose>


 <INPUT type="hidden" value="<c:out value='${uiMode}'/>" name="mode">
 <html-el:hidden property="actionName" value="${actionName}" />
 <html-el:hidden property="beanName" value="${beanName}" />

<c:choose>
<c:when test="${empty param.toBeSelected}">
   <c:set var="selectedTopoTabName" value="${initSelectedTab}" scope="request"/>  
</c:when>  
<c:otherwise>
   <c:set var="selectedTopoTabName" value="${param.toBeSelected}" scope="request"/>  
</c:otherwise>  
</c:choose>
<logic:messagesPresent>
   <c:set var="selectedTopoTabName" value="${param.selectedTopoTab}" scope="request"/>  
</logic:messagesPresent>




  <table width="100%" border="0" align="left" valign="top" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="left" valign="top">
	  <tiles:insert attribute='body'/> 
         </td>
    </tr>
    <tr> 
      <td height="35" align="left" valign="top"> 
	  
        <table height="35" width="668" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="250" align="left" valign="top" ><img src="/webclient/topo/images/spacer.gif" width="250" height="1"></td>
            <td width="11" align="center">&nbsp;</td>
          </tr>
        </table>
		
		
		
		</td>
     </tr>




  </table>
  <!-- Adding Hidden Fields in order to sustain and submit the data from the bean -->
            <c:forEach items="${ObjectDetailsBean.map}" var="prop">
             <html-el:hidden name="ObjectDetailsBean" property="${prop.key}"/> 
            </c:forEach> 
</html-el:form>

<html-el:javascript formName='${beanName}'/>












