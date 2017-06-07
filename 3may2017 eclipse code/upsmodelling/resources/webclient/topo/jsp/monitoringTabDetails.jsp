<%-- $Id: monitoringTabDetails.jsp,v 1.4 2007/10/18 06:25:06 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>

<c:set var="swaptableid"  value="${swaptableid+2}" scope='request'/>

      <tr  id='<c:out value="swipecontent${swaptableid-1}" />' >
       <td class="htableBorder">

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
   <tr> 

<td colspan="4" >
<table cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg" >
         <td width="720" class="propFormBlackText" > <span ><fmt:message key='webclient.topo.objectdetails.tab.monitoring.header'/></span></td>
	<c:choose>
        <c:when test="${modifyObject == 'true'}">
        <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' ><a class="propFormLink" href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><fmt:message key='webclient.topo.objectdetails.edit'/></a></td>
	</c:when>
   <c:otherwise>
   <%--td width="20"  id='<c:out value="editswipe${swaptableid}" />'  ><a href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><img border=0 src="/webclient/common/images/edit.gif" height="15" width="15"></a></td--%>

   <td width="60"></td>

   </c:otherwise>
   </c:choose>
</tr>
</table>
</td>
      </tr>

      <tr class="even"> 
        <td width="175" class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.statuspollenabled'/> </span> </td>
        <td width="210" class="blackText" >  <span ><c:out value='${ObjectDetailsBean.map.statusPollEnabled}'/></span> 
        <td width="175" class="blackBoldText" > <span><fmt:message key='webclient.topo.objectdetails.tester'/> </span></td>
        <td width="210" class="blackText" ><c:out value='${ObjectDetailsBean.map.tester}'/></td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText"> <span><fmt:message key='webclient.topo.objectdetails.statusupdatetime'/></span> </td>
        <td class="blackText" > <c:out value='${ObjectDetailsBean.map.statusUpdateTime}'/></td>
        <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.statuschangetime'/></span> </td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.statusChangeTime}'/></td>
       
      </tr>

      <tr class="even"> 
         <td  class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.userclass'/></span></td>
         <td  class="blackText" ><c:out value='${ObjectDetailsBean.map.uClass}'/></td>
         <td  class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.failurethreshold'/></span></td>
         <td class="blackText" > <c:out value='${ObjectDetailsBean.map.failureThreshold}'/></td>
      </tr>

      <tr class="odd"> 
         <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.failurecount'/></span></td>
         <td class="blackText" ><c:out value='${ObjectDetailsBean.map.failureCount}'/></td> 
         <td class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.pollinterval'/></span></td>
         <td class="blackText" > 
<c:out value='${ObjectDetailsBean.map.pollInterval}'/> <fmt:message key='webclient.topo.objectdetails.pollinterval.seconds'/> 
          </td>
      </tr>

    </table></td> 
<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</tr>




 <tr id='<c:out value="swipecontent${swaptableid}" />' class="hide">
       <td class="htableBorder">

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
     
      <tr> 

<td colspan="4" >
<table cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg"   >

  <td width="700" class="propFormBlackText"  > <span ><fmt:message key='webclient.topo.objectdetails.tab.monitoring.header'/></span></td>
  <td width="50" id='<c:out value="editswipe${swaptableid-1}" />' class="header2bg" colspan="2" ><a class="propFormLink" href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><fmt:message key='webclient.topo.objectdetails.cancel'/></a></td>
  <td width="20" id='<c:out value="editswipe${swaptableid}" />'  colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><img border=0 src="/webclient/common/images/edit.gif" width="14" height="15"></a></td>

</tr>
</table>
</td>

      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText"  > <span ><fmt:message key='webclient.topo.objectdetails.statuspollenabled'/> </span> </td>
        <td width="210" class="blackText"> <html-el:radio name="ObjectDetailsBean" property="statusPollEnabled" value="true"/> 
          <fmt:message key='webclient.topo.objectdetails.statuspollenabled.yes'/><html-el:radio name="ObjectDetailsBean" property="statusPollEnabled" value="false"/> 
          <fmt:message key='webclient.topo.objectdetails.statuspollenabled.no'/> </td>
        <c:set target="${ObjectDetailsBean.map}" property="statusPollEnabled" value="${null}"/> 
         <td width="175" class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.tester'/> </span></td>
         <td width="210"  class="blackText" >  <html-el:select styleClass="formStyle" name="ObjectDetailsBean" property="tester" > 
          <html-el:option value='max'>Max</html-el:option> <html-el:option value='ping'>Ping</html-el:option> 
          <html-el:option value='snmpping'>SNMP Ping</html-el:option> <html-el:option value='usertest'>User 
          Tester</html-el:option> </html-el:select> </td>
        <c:set target="${ObjectDetailsBean.map}" property="tester" value="${null}"/> 
      
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.statuschangetime'/></span> </td>
        <td class="blackText"  ><c:out value='${ObjectDetailsBean.map.statusChangeTime}'/></td>
        <td class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.statusupdatetime'/></span> </td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.statusUpdateTime}'/></td>
      </tr>

      <tr class="even"> 
          <td class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.userclass'/></span></td>
          <td class="blackText"><html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="uClass"/></td>
          <c:set target="${ObjectDetailsBean.map}" property="uClass" value="${null}"/> 
          <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.failurethreshold'/></span></td>
          <td class="blackText"> 
<html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="failureThreshold"/>
               <html-el:errors property="failureThreshold"/>
<!--table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td class="blackText"> <html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="failureThreshold"/></td>
              <td class="blackBoldText"> <html-el:errors property="failureThreshold"/></td>
            </tr>
          </table--><c:set target="${ObjectDetailsBean.map}" property="failureThreshold" value="${null}"/> </td>
      </tr>

      <tr class="odd"> 
         <td class="blackBoldText" > <span ><fmt:message key='webclient.topo.objectdetails.failurecount'/></span></td>
         <td class="blackText" ><c:out value='${ObjectDetailsBean.map.failureCount}'/></td>
         <td class="blackBoldText"> <span ><fmt:message key='webclient.topo.objectdetails.pollinterval'/></span></td>
         <td class="blackText"> 
<html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="pollInterval"/> 
                <fmt:message key='webclient.topo.objectdetails.pollinterval.seconds'/>               
               <html-el:errors property="pollInterval"/>

<!--table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="32%" nowrap class="blackText" nowrap> <html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="pollInterval"/> 
                <fmt:message key='webclient.topo.objectdetails.pollinterval.seconds'/> 
              </td>
              <td width="49%" class="blackText" nowrap> <html-el:errors property="pollInterval"/></td>
            </tr>
          </table--></td>
        <c:set target="${ObjectDetailsBean.map}" property="pollInterval" value="${null}"/> 

      </tr>

     <tr class="even"> 
        <td colspan="2"><img src="/webclient/topo/images/spacer.gif" width="1" height="5"></td>
        <td colspan=2 align="right" valign="middle"> 
          <input class=button type=submit value="<fmt:message key='webclient.topo.objectdetails.updatebutton'/>" name="submitButton" onClick="updatePerform('<c:out value='${beanName}'/>')"> &nbsp;
          <input class=button type=reset value="<fmt:message key='webclient.topo.objectdetails.clearbutton'/>" name="resetButton"></td> 
    </tr>
    
    </table></td> 

<td class="generalCurveRight">&nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td class="generalCurveLeftBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveBottom"><img src="images/spacer.gif" width="1px" height="1px"></td>
          <td class="generalCurveRightBot"><img src="images/spacer.gif" width="1px" height="1px"></td>
        </tr>
      </table>
</tr>

