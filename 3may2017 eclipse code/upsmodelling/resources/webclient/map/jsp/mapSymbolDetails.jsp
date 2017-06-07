<%-- $Id: mapSymbolDetails.jsp,v 1.2 2007/10/05 07:48:00 gnanasekar Exp $ --%>

<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<script language="javascript" src="/webclient/common/js/swipe.js" type="text/javascript"></script>
<SCRIPT LANGUAGE="JavaScript" SRC="/webclient/common/js/dynamicInput.js"  TYPE='text/javascript'></SCRIPT>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><fmt:message key='webclient.topo.objectdetails.title'><fmt:param value="${MapSymbolForm.map.name}"/></fmt:message></title>

</head>
<body >

<tiles:useAttribute id="mode" name="mode" ignore="true" classname="java.lang.String" />
<tiles:useAttribute id="initSelectedTab" name="initSelectedTab" ignore="true" classname="java.lang.String" />


<html-el:form action='/mapSymbolDetailsHandler' onsubmit='return validateMapSymbolForm(this);'>

<c:choose>
<c:when test="${empty param.mode}">
   <c:set var="uiMode" value="${mode}" scope="request"/>  
</c:when>  
<c:otherwise>
   <c:set var="uiMode" value="${param.mode}" scope="request"/>  
</c:otherwise>  
</c:choose>


 <INPUT type="hidden" value="<c:out value='${uiMode}'/>" name="mode">

<c:choose>
<c:when test="${empty param.toBeSelected}">
   <c:set var="selectedMapTabName" value="${initSelectedTab}" scope="request"/>  
</c:when>  
<c:otherwise>
   <c:set var="selectedMapTabName" value="${param.toBeSelected}" scope="request"/>  
</c:otherwise>  
</c:choose>
<logic:messagesPresent>
   <c:set var="selectedMapTabName" value="${param.selectedMapTab}" scope="request"/>  
</logic:messagesPresent>

  <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
    <tr> 
      <td align="left" valign="top"> <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" >
          <tr> 
            <td colspan="2" align="left" valign="top"> 
          <tiles:insert attribute='header'/>
           </td>
         </tr>          
         <tr> 
           <tiles:insert attribute='body'/>
          </tr>
        </table></td>
    </tr>
  </table>
  <!-- Adding Hidden Fields in order to sustain and submit the data from the bean -->
  <c:forEach items="${MapSymbolForm.map}" var="prop">
<c:choose>
<c:when test="${prop.key == 'additionalProps'}">
<c:out value='${prop.key}'/>

</c:when>
<c:otherwise>
   <html-el:hidden name="MapSymbolForm" property="${prop.key}"/> 
</c:otherwise>
</c:choose>
</c:forEach> 

</html-el:form>
</body>
<html-el:javascript formName='MapSymbolForm'/>
</html>













