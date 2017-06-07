<%-- $Id: portObjectTabDetails.jsp,v 1.3 2007/10/18 06:25:06 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="swaptableid"  value="${swaptableid+2}" scope='request'/>

      <tr id='<c:out value="swipecontent${swaptableid-1}" />'>

    <td class="htableBorder" height="20">

         <table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >


        <table border="0" cellpadding="0" cellspacing="0" class="table">
<%--
      <tr>
        <td colspan="2"><img src="/webclient/topo/images/spacer.gif" width="1" height="1"></td>
      </tr>
--%>
 <tr >  
<td colspan="4" >
<table cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg" >
         <td width="720" class="propFormBlackText"> <fmt:message key='webclient.topo.objectdetails.tab.port.header'/> </td>
        <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' >
<%-- <a href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" >Edit</a> --%> </td>
		<td width="20"  id='<c:out value="editswipe${swaptableid}" />'><%--<img src="/webclient/common/images/edit.gif" height="15" width="15">--%></td>
</tr>
</table>
</td>
      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.portifspeed'/></td>
        <td width="210" class="blackText" > <c:out value='${ObjectDetailsBean.map.portIfSpeed}'/> </td>
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.portifdescr'/> </td>
        <td width="210" class="blackText" > <c:out value='${ObjectDetailsBean.map.portIfDescr}'/> </td>
      </tr>
      <tr class="odd"> 
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.portstate'/> </td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.portState}'/></td>
        <td class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.portifindex'/> </td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.portIfIndex}'/></td>
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
</td> </tr>



      <tr id='<c:out value="swipecontent${swaptableid}" />' class="hide">
       <td >
<table style="margin-bottom:10px;" width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td class="generalCurveLeftTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td align="left" valign="top" nowrap class="generalCurveTop" style="padding-right:10px;">
         <img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightTop"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
        <tr>
          <td class="generalCurveLeft">&nbsp;</td>
          <td valign="top" class="generalTBPadding" >
<table border="0" cellpadding="2" cellspacing="0" class="table">
      <tr>
        <td colspan="4"><img src="/webclient/topo/images/spacer.gif" width="1" height="1"></td>
      </tr>
    <tr>  
<td colspan="4" >
<table class="htableBorder"  cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg"   >

  <td width="710" class="boldText"> <fmt:message key='webclient.topo.objectdetails.tab.port.header'/> </td>
  <td width="40" id='<c:out value="editswipe${swaptableid-1}" />' class="header2bg" colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  >Cancel</a></td>
  <td width="20" id='<c:out value="editswipe${swaptableid}" />'  colspan="2" ><img src="/webclient/common/images/edit.gif" width="14" height="15"></td>

</tr>
</table>
</td>

      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText"  > <fmt:message key='webclient.topo.objectdetails.portifspeed'/> </td>
        <td width="210" class="blackText"  > <c:out value='${ObjectDetailsBean.map.portIfSpeed}'/> </td>
        <td width="175" class="blackBoldText"  > <fmt:message key='webclient.topo.objectdetails.portifdescr'/> </td>
        <td width="210" class="blackText"  ><c:out value='${ObjectDetailsBean.map.portIfDescr}'/> 
        </td>
      </tr>
      <tr class="odd"> 
        <td >  <fmt:message key='webclient.topo.objectdetails.portstate'/> </td>
        <td ><c:out value='${ObjectDetailsBean.map.portState}'/></td>
        <td > <fmt:message key='webclient.topo.objectdetails.portifindex'/> </td>
        <td ><c:out value='${ObjectDetailsBean.map.portIfIndex}'/></td>
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
</td> </tr>
