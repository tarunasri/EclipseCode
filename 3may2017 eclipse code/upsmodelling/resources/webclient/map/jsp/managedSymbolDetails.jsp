<%-- $Id: managedSymbolDetails.jsp,v 1.3 2007/10/18 06:45:25 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>


<table style="margin-bottom:10px;" width="98%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >


<table width="100%" border="0" cellpadding="0" cellspacing="0"  >

      <tr>
       <td height="20"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
     
      <tr> 
        <td colspan="2" >
<table width="100%" cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg" >
         <td width="100%" class="propFormBlackText"> <fmt:message key='webclient.map.mapsymboldetails.tab.managed.header'/>   </td>
       
</tr>
</table>
</td>
  </tr>

      <tr class="even"> 
        <td width="170" class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.status'/> </td>
        <td width="210" class="blackText" > <img src="<c:out value="${MapSymbolForm.map.statusImage}" />" 
          border=0 width="16" height="16" alt="<c:out value='${MapSymbolForm.map.stringstatus}'/>" 
          > <span ><c:out value='${MapSymbolForm.map.stringStatus}'/></span> 
        </td>
      </tr>
     <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.type'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.type}'/>
        </td>
      </tr>

     <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.objtype'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.objType}'/> 
        </td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.managed'/>  </td>
        <td class="blackText" >

<c:choose>
<c:when test='${MapSymbolForm.map.managed=="true"}'>
          <fmt:message key='webclient.map.mapsymboldetails.managed.yes'/>
</c:when>
<c:otherwise>
          <fmt:message key='webclient.map.mapsymboldetails.managed.no'/> 
</c:otherwise>
</c:choose>
        </td>
      </tr>

 <c:if test='${!empty MapSymbolForm.map.discover}'>
      <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.discover'/>  </td>
        <td class="blackText" >
<c:choose>
<c:when test='${MapSymbolForm.map.discover=="true"}'>
		<fmt:message key='webclient.map.mapsymboldetails.discover.yes'/>
</c:when>
<c:otherwise>
		<fmt:message key='webclient.map.mapsymboldetails.discover.no'/> 
</c:otherwise>
</c:choose>
        </td>
      </tr> 
 </c:if>

    </table></td> </tr>
</table>
</td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>










