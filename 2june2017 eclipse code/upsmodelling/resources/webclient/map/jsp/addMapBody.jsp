<%-- $Id: addMapBody.jsp,v 1.3 2007/09/14 10:47:48 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="html" uri="http://jakarta.apache.org/struts/tags-html" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title><c:out value="${title}"/></title>

<script>

function topologyStatus(isEnabled)
{
     if(isEnabled == 'layout')
     {
         document.searchForm.currentTopology.disabled = false;
     }
     else
     {
         document.searchForm.currentTopology.disabled = true;
     }
}
    invalidDateMessage = '<fmt:message key="webclient.fault.customview.event.time.invaliddate.message"/>'



</script>

</head>
<body  >

<input type=hidden name="viewId" value="<c:out value='${param.mapName}'/>">
<input type=hidden name="actionToPerform" value="<c:out value='${param.actionToPerform}'/>">
<input type=hidden name="displayName" value="<c:out value='${displayName}'/>">
<span class="errorText"><html:errors/></span>

 <%--   <c:out value='${searchForm.map.reqlayout}' />
    <% java.util.Enumeration enumerate=  request.getAttributeNames();
    for(;enumerate.hasMoreElements();) {
        String key=(String)enumerate.nextElement();
        out.println("the key "+key+" value "+request.getAttribute(key));
    }
    %>
--%>
  <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
  	<tr>
  	<td>&nbsp;</td>
  	<td>        

	<table width="100%" border="0" align="left" cellpadding="3" cellspacing="0">
        <tr> 
        <td width="165"><span class="boldText"><fmt:message key="webclient.map.cv.addmap.name"/></span></td>
        <td>
           <c:choose>
             <c:when test ='${searchForm.map.actionToPerform == "addMap"}'>
             <html-el:text property="name" name="searchForm"  styleClass="formStyle" />
             </c:when>
             <c:when test ='${searchForm.map.actionToPerform == "modifyMap"}'>
             <html-el:text property="name" name="searchForm" value ='${searchForm.map.name}' readonly="true" styleClass="formStyle" />
             </c:when>
             </c:choose><font color="red" size="2" weight="300" >*</font></td>
           <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.label"/></span></td>
            <td><html-el:text property="label"  name="searchForm" value ="${searchForm.map.label}" styleClass="formStyle" /></td>
              <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.imagename"/></span></td>
            <td><html-el:text property="imageName" name="searchForm" value ="${searchForm.map.imageName}" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>

          <tr> 
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.menuName"/></span></td>
            <td><html-el:text property="menuName" name="searchForm" value ="${searchForm.map.menuName}" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>

            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.helpDoc"/></span></td>
             <td><html-el:text property="helpDoc" name="searchForm" styleClass="formStyle"  value ="${searchForm.map.helpDoc}" />
              </td>
                <td>&nbsp;</td>
          </tr>
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.anchored"/></span></td>
            <td>
                <html-el:select property="anchored" name="searchForm" value ="${searchForm.map.anchored}" styleClass="formStyle"> 
                <option>true
                <option selected>false
                </html-el:select></td>
            <td>&nbsp;</td>
          </tr>
           
          <tr> 
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.treeiconfilename"/></span></td>
            <td><html-el:text property="treeIconFileName" name="searchForm" value ="${searchForm.map.treeIconFileName}" styleClass="formStyle" /></td>
            <td>&nbsp;</td>
          </tr>

           <tr> 
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.parentnode"/></span></td>
            <td>
             <html-el:text property="parentMapKey" name="searchForm" readonly="true" value ='${searchForm.map.parentMapKey}' styleClass="formStyle" />
             </td>
             <td>&nbsp;</td> 
          </tr>
                
           <tr class="header1Bg"> 
           <td >
              <html-el:radio property="reqlayout" name="searchForm" value="nolayout" onclick="javascript:topologyStatus('nolayout')"/> 
              <span class="text"><fmt:message key="webclient.map.cv.addmap.htmlview"/></span></td> 
              <td >
              <html-el:radio property="reqlayout" name="searchForm" value="layout" disabled="${isDefaultMap}" onclick="javascript:topologyStatus('layout')"/> 
              <span class="text"><fmt:message key="webclient.map.cv.addmap.layoutview"/></span></td>
              <td>&nbsp;</td>
          </tr>
               
          <tr> 
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.topology"/></span></td>
            <td><html-el:text property="topology" name="searchForm" readonly="true" value ="${searchForm.map.topology}" styleClass="formStyle" />
         </td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td><span class="text"><fmt:message key="webclient.map.cv.addmap.currenttopology"/></span></td>
            <td>
             <html-el:select property="currentTopology" name="searchForm" styleClass="formStyle" >
              <c:forEach items = "${searchForm.map.layouts}" var = "layout">
              <c:choose>
              <c:when test="${layout == searchForm.map.currentTopology}">
              <c:set var = "selected" value = "SELECTED" />
              </c:when>
              <c:otherwise>
              <c:set var = "selected" value = "" />
              </c:otherwise>
              </c:choose>
              <option value = '<c:out value ="${layout}"/>' <c:out value = "${selected}" />><c:out value = "${layout}" /></option>
              </c:forEach>
              </html-el:select>
            </td> 
           
            <td>&nbsp;</td>
          </tr>
          <tr> 
               <td><span class="text"><fmt:message key="webclient.map.cv.addmap.criteria"/></span></td>
               <td>&nbsp;</td>
               <td>&nbsp;</td> 
              </tr> 
        </table>
</td>
    </tr>
  </table>
 <!-- <html:javascript formName="AddCustomMap"/> -->

</body>
</html>

<script>
javascript:topologyStatus("<c:out value='${searchForm.map.reqlayout}' />");
</script>
