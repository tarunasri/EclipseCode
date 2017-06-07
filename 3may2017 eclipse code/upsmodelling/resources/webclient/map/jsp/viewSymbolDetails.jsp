<%-- $Id: viewSymbolDetails.jsp,v 1.4 2007/10/18 11:18:48 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>





<table width="100%" border="0" cellpadding="0" cellspacing="0"  >

<c:set var="swaptableid"  value="${swaptableid+2}" scope='request' />

      <tr id='<c:out value="swipecontent${swaptableid-1}" />' >
       <td >

<table style="margin-bottom:10px;" width="98%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
     
      <tr> 
<td colspan="2" >
<table cellpadding="0" cellspacing="0" width="100%" border="0">
<tr height="20" class="header2bg" >
         <td width="100%" class="propFormBlackText"> <fmt:message key='webclient.map.mapsymboldetails.tab.view.header'/> </td>
        <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' ><a href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><fmt:message key='webclient.topo.objectdetails.edit'/></a></td>
		<td width="20"  id='<c:out value="editswipe${swaptableid}" />'  ><a href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><img border=0 src="/webclient/common/images/edit.gif" height="15" width="15"></a></td>
</tr>
</table>
</td>
      </tr>

      <tr class="even"> 
        <td width="170" class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.iconname'/> </td>
        <td width="210" class="blackText" ><c:out value='${MapSymbolForm.map.iconName}'/>
        </td>
      </tr>

      <tr class="odd"> 
        <td width="170" class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.menuname'/> </td>
        <td width="210" class="blackText" > <c:out value='${MapSymbolForm.map.menuName}'/> </td>
      </tr>

      <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.width'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.width}'/>
        </td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.height'/></td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.height}'/>
        </td>
      </tr>

      <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.x'/> </td>
        <td class="blackText" >  <c:out value='${MapSymbolForm.map.x}'/> 
        </td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.y'/></td>
        <td class="blackText" >  <c:out value='${MapSymbolForm.map.y}'/>
        </td>
      </tr>

      <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.anchored'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.anchored}'/>
        </td>
      </tr>

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
</td></tr></table>













<table width="100%" border="0" cellpadding="0" cellspacing="0"  >
 <tr  id='<c:out value="swipecontent${swaptableid}" />' class="hide">

       <td height="20">
<table style="margin-bottom:10px;" width="98%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
    <td align="left" valign="top" nowrap="nowrap" class="generalCurveTop" style="padding-right:10px;"></td>
    <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px" /></td>
  </tr>
  <tr>
    <td class="generalCurveLeft">&nbsp;</td>
    <td valign="top" class="generalTBPadding" >
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="table">
       <tr >

<td colspan="2" >
<table cellpadding="0" cellspacing="0" width="100%">
<tr height="20" class="header2bg"   >

  <td width="100%" class="propFormBlackText"> <span ><fmt:message key='webclient.map.mapsymboldetails.tab.view.header'/></span></td>
  <td width="40" id='<c:out value="editswipe${swaptableid-1}" />' class="header2bg" colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><fmt:message key='webclient.topo.objectdetails.cancel'/></a></td>
  <td width="20" id='<c:out value="editswipe${swaptableid}" />'  colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><img border=0 src="/webclient/common/images/edit.gif" width="14" height="15"></a></td>

</tr>
</table>
</td>

      </tr>
      <tr class="even"> 
        <td width="170" class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.iconname'/> </td>
        <td width="210" class="blackText" ><html-el:text styleClass= "formStyle" name="MapSymbolForm" property="iconName"/> <span class="errorText"> <html-el:errors property="iconName"/></span>
        </td>
        <c:set target="${MapSymbolForm.map}" property="iconName" value="${null}"/> 
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText" >  <fmt:message key='webclient.map.mapsymboldetails.menuname'/> </td>
        <td class="blackText" ><html-el:text styleClass= "formStyle" name="MapSymbolForm" property="menuName"/> <span class="errorText"> <html-el:errors property="menuName"/></span>
        </td>
        <c:set target="${MapSymbolForm.map}" property="menuName" value="${null}"/> 
      </tr>

      <tr class="even"> 
        <td class="blackBoldText" >  <fmt:message key='webclient.map.mapsymboldetails.width'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.width}'/> 
        </td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText" ><fmt:message key='webclient.map.mapsymboldetails.height'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.height}'/> 
        </td>
      </tr>

      <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.x'/> </td>
        <td class="blackText" > <c:out value='${MapSymbolForm.map.x}'/> 
        </td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.y'/> </td>
        <td class="blackText" >  <c:out value='${MapSymbolForm.map.y}'/> 
        </td>
      </tr>

      <tr class="even"> 
        <td class="blackBoldText" > <fmt:message key='webclient.map.mapsymboldetails.anchored'/> </td>
        <td class="blackText" >  <c:out value='${MapSymbolForm.map.anchored}'/> 
        </td>
      </tr>
      <tr class="odd"> 
      <td colspan=2 align="middle" valign="middle"> 
          <input class=button type=submit value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="submitButton" onClick="updatePerform('<c:out value='${beanName}'/>')"> &nbsp;
          <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td> 
    </tr>
    </table>

<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</td></tr></table>
</td> 










