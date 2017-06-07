<%-- $Id: mapDetailsTabLayout.jsp,v 1.3 2007/10/05 07:47:32 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-tiles" prefix="tiles" %>

<tiles:useAttribute name="tabList" classname="java.util.List" />
<tiles:useAttribute id="completeDef" name="completeDef" ignore="true" classname="java.lang.String" />

<SCRIPT language=JavaScript type=text/JavaScript>

<%!
    int tablecount=0;
%>

function traverseTab(tabindex)
{  
document.forms["MapSymbolForm"].toBeSelected.value = tabindex;
}

function changeMode(tabindex)
{  
document.forms["MapSymbolForm"].mode.value = tabindex;
document.forms["MapSymbolForm"].submit();

}

function traverseTabLink(tabindex)
{  
document.forms["MapSymbolForm"].toBeSelected.value = tabindex;
document.forms["MapSymbolForm"].submit();
}

function updatePerform()
{  
document.forms["MapSymbolForm"].perform.value = "update";
}

</SCRIPT>

<INPUT type="hidden" name="perform" value="traverse">
<INPUT type="hidden" value="<c:out value='${selectedMapTabName}'/>" name="selectedMapTab">
<INPUT type="hidden" value="<c:out value='${selectedMapTabName}'/>" name="toBeSelected">

 <c:forEach items="${tabList}" var="tab" varStatus="status"> 
<c:set var='tablecount' value="${status.count}" />
</c:forEach>

<c:set var="swaptableid" value='0' scope='request'/>

<td  width="130" valign="top"  class = "propertyTabLeftbg">

<tiles:insert attribute='header'/> 
<table border="0" cellspacing="0" cellpadding="0" width="100%">

    <tr>
		<td valign="top" width="50%">
                        
			
			<c:forEach items="${tabList}" var="tab" varStatus="status">
                        
                        <table width="100%" border="0" valign="top" align="left" class="htableBorder" cellpadding="0" cellspacing="0">
			<c:choose>
			<c:when test="${status.count lt tablecount/2}" >
			<c:set var="selectedBody" value='${tab.link}'/>
			<tr>
				<td><tiles:insert beanName="selectedBody"/></td>
			</tr>
			</c:when>
			</c:choose>     
                        </table>

			</c:forEach> 
			



		</td>
		<td valign="top" width="50%">
			<table width="100%" border="0" valign="top" align="left" class="htableBorder" cellpadding="0" cellspacing="0">
			<c:forEach items="${tabList}" var="tab" varStatus="status">
			<c:choose>
			<c:when test="${status.count ge tablecount/2}" >
			<c:set var="selectedBody" value='${tab.link}'/>
			<tr>
				<td><tiles:insert beanName="selectedBody"/> </td>
			</tr>
			</c:when>
			</c:choose>
			</c:forEach>
			</table>
		</td>
	</tr>
    </table>
</td>


<%--
    <c:forEach items="${tabList}" var="tab"> 
      <tr> 
         <c:set var="selectedBody" value='${tab.link}'/> 

        <td>
        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
            <tiles:insert beanName="selectedBody"/> 
        </table>
        <br> <br>
        </td>

     </tr>
    </c:forEach> 
  </table>
--%>



<script>

var swaptableid=<c:out value='${swaptableid}' />
</script>
