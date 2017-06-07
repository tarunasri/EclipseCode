<%-- $Id: containerSymbolDetails.jsp,v 1.2 2007/10/30 12:57:56 sumitha Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<c:if test='${MapSymbolForm.map.isMapContainer=="true"}'>
      <tr>
       <td height="20">
	<table style="margin-bottom:10px;" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" style="padding-right:20px;"><table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;"></td>
        <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
      <tr>
        <td class="generalCurveLeft">&nbsp;</td>
        <td valign="top" class="generalTBPadding" >
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
     
      <tr> 
        <td colspan="2" >
        <table cellpadding="0" cellspacing="0" width="100%" valign="top">
        <tr height="20" class="header2bg" >
         <td width="98%" class="propFormBlackText">  <fmt:message key='webclient.map.mapsymboldetails.tab.container.header'/> </td>
    </tr>
    </table>
    </td>
  </tr>

      <tr class="even"> 
        <td width="170" class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.currentTopology'/> </td>
        <td width="210" class="blackText" >  <c:out value='${MapSymbolForm.map.currentTopology}'/> 
        </td>
      </tr>
      <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.topology'/> </td>
        <td class="blackText" >  <c:out value='${MapSymbolForm.map.topology}'/> 
        </td>
      </tr>

      <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.containment'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.containment}'/> 
        </td>
      </tr>


    </table>
	</td>
        <td class="generalCurveRight">&nbsp;</td>
      </tr>
      <tr>
        <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
        <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
      </tr>
    </table>
</td> </tr>

</c:if>







