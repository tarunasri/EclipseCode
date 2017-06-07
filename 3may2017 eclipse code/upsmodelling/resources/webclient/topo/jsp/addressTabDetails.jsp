<%-- $Id: addressTabDetails.jsp,v 1.4 2007/10/18 06:26:18 gnanasekar Exp $ --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html-el" prefix="html-el" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>



<c:set var="swaptableid"  value="${swaptableid+2}" scope='request'/>


      <tr  id='<c:out value="swipecontent${swaptableid-1}" />'>
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

   <table border="0" cellpadding="0" cellspacing="1" class="table">

 <tr> 
 
<td colspan="4" >
<table cellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg" >
         <td width="720" class="propFormBlackText"> <fmt:message key='webclient.topo.objectdetails.tab.general.header'/></td>
	 <c:choose>
 	 <c:when test="${modifyObject == 'true'}">

        <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' ><a class="propFormLink" href="javascript:toggleSwipe('<c:out value="${swaptableid-1}" />')" ><fmt:message key='webclient.topo.objectdetails.edit'/></a></td>
	</c:when>
 	 
 	 <c:otherwise>
 	 
 	 <td width="60"> </td>
 	 
 	 </c:otherwise>
 	 </c:choose>
 	 
</tr>
</table>
</td>

      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.type'/></td>
        <td width="210" class="blackText" ><c:out value='${ObjectDetailsBean.map.type}'/>  </td>
        <td width="175" class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.status'/></td>
        <td width="210" class="blackText"  valign="bottom"> <img src="<c:out value="${ObjectDetailsBean.map.statusImage}" />" 
          border=0 width="16"  alt="<c:out value='${ObjectDetailsBean.map.stringstatus}'/>" 
          > <c:out value='${ObjectDetailsBean.map.stringstatus}'/>
        </td>
      </tr>


      <tr class="odd"> 
        <td width="175" class="blackBoldText" > <fmt:message key='webclient.topo.objectdetails.managed'/> </td>
        <td width="210" class="blackText" ><c:out value='${ObjectDetailsBean.map.managed}'/> </td>
        <td width="175" class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.displayname'/></td>
        <td width="210" class="blackText" ><c:out value='${ObjectDetailsBean.map.displayName}'/> </td>
      </tr>

<%-- GENERAL TAB LABEL ENDS HERE. ADDRESS TAB STARTS HERE --%>
<%--
      <tr > 
         <td height="20" class="header2bg" colspan="4"> <span ><fmt:message key='webclient.topo.objectdetails.tab.address.header'/></span></td>
      </tr>
--%>
      <tr class="even"> 
        <td class="blackBoldText"> <fmt:message key='webclient.topo.objectdetails.ipaddress'/> </td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.ipAddress}'/>  </td>
        <td class="blackBoldText"> <fmt:message key='webclient.topo.objectdetails.netmask'/></td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.netmask}'/></td>
      </tr>
      <tr class="odd"> 
        <td class="blackBoldText"> <fmt:message key='webclient.topo.objectdetails.isdhcp'/> </td>
        <td class="blackText" ><c:out value='${ObjectDetailsBean.map.isDHCP}'/></td>
        <td colspan="2">&nbsp;</td>
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
     
      <tr > 

<td colspan="4" >

<table ellpadding="0" cellspacing="0" >
<tr height="20" class="header2bg"   >

  <td width="720" class="propFormBlackText"> <fmt:message key='webclient.topo.objectdetails.tab.general.header'/></td>
  <td width="30" id='<c:out value="editswipe${swaptableid-1}" />' class="header2bg" colspan="2" ><a class="propFormLink" href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><fmt:message key='webclient.topo.objectdetails.cancel'/></a></td>
  <td width="20" id='<c:out value="editswipe${swaptableid}" />'  colspan="2" ><a href= "javascript:closeSwipe('<c:out value="${swaptableid}" />')"  ><img border=0 src="/webclient/common/images/edit.gif" width="14" height="15"></a></td>

</tr>
</table>
</td>

      </tr>
      <tr class="even"> 
        <td width="175" class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.type'/></td>
        <td width="210" class="blackText" ><c:out value='${ObjectDetailsBean.map.type}'/> </td>
        <td width="175" class="blackBoldText"> <fmt:message key='webclient.topo.objectdetails.status'/></td>
        <td width="210" class="blackText"  valign="bottom"> <img src="<c:out value="${ObjectDetailsBean.map.statusImage}" />" 
          border=0 width="16"  alt="<c:out value='${ObjectDetailsBean.map.stringstatus}'/>" 
          > <c:out value='${ObjectDetailsBean.map.stringstatus}'/>
        </td>
      </tr>

      <tr class="odd"> 
        <td class="blackBoldText">  <fmt:message key='webclient.topo.objectdetails.managed'/> </td>
        <td class="blackText" > <html-el:radio name="ObjectDetailsBean" property="managed" value="true"/> 
          <fmt:message key='webclient.topo.objectdetails.managed.yes'/>
        <html-el:radio name="ObjectDetailsBean" property="managed" value="false"/><fmt:message key='webclient.topo.objectdetails.managed.no'/> 
        </td>
        <td class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.displayname'/></td>
        <td class="blackText" ><html-el:text styleClass= "formStyle" name="ObjectDetailsBean" property="displayName"/> 
        </td>
        <c:set target="${ObjectDetailsBean.map}" property="displayName" value="${null}"/> 
      </tr>
<%--   
   <tr >
<td height="20" class="header2bg" colspan="4" ><span ><fmt:message key='webclient.topo.objectdetails.tab.address.header'/></span></td>
--%>
      </tr>
      <tr class="even"> 
        <td class="blackBoldText"> <fmt:message key='webclient.topo.objectdetails.ipaddress'/></td>
 <%--  	<td class="blackText"><c:out value='${ObjectDetailsBean.map.ipAddress}'/> </td> --%>
     <td class="blackText" width="225" > 

<html-el:text readonly="true" styleClass="formStyle" name="ObjectDetailsBean" property="ipAddress"/></td>
              <c:set target="${ObjectDetailsBean.map}" property="ipAddress" value="${null}"/> 
              <html-el:errors property="ipAddress"/>

          <!--table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="NobotBorder">
            <tr> 
              <td width="96"><html-el:text readonly="true" styleClass="formStyle" name="ObjectDetailsBean" property="ipAddress"/></td>
              <c:set target="${ObjectDetailsBean.map}" property="ipAddress" value="${null}"/> 
              <td width="260" class="errorText"><html-el:errors property="ipAddress"/></td>
            </tr>
          </table--></td> 
         <td class="blackBoldText" ><fmt:message key='webclient.topo.objectdetails.netmask'/></td>
         <td class="blackText" > <html-el:select styleClass="formStyle" name="ObjectDetailsBean" property="netmask" > 
          <html-el:option value='255.192.0.0'>255.192.0.0</html-el:option> <html-el:option value='255.224.0.0'>255.224.0.0</html-el:option> 
          <html-el:option value='255.240.0.0'>255.240.0.0</html-el:option> <html-el:option value='255.248.0.0'>255.248.0.0</html-el:option> 
          <html-el:option value='255.252.0.0'>255.252.0.0</html-el:option> <html-el:option value='255.254.0.0'>255.254.0.0</html-el:option> 
          <html-el:option value='255.255.0.0'>255.255.0.0</html-el:option> <html-el:option value='255.255.128.0'>255.255.128.0</html-el:option> 
          <html-el:option value='255.255.192.0'>255.255.192.0</html-el:option> 
          <html-el:option value='255.255.224.0'>255.255.224.0</html-el:option> 
          <html-el:option value='255.255.240.0'>255.255.240.0</html-el:option> 
          <html-el:option value='255.255.248.0'>255.255.248.0</html-el:option> 
          <html-el:option value='255.255.252.0'>255.255.252.0</html-el:option> 
          <html-el:option value='255.255.254.0'>255.255.254.0</html-el:option> 
          <html-el:option value='255.255.255.0'>255.255.255.0</html-el:option> 
          <html-el:option value='255.255.255.128'>255.255.255.128</html-el:option> 
          <html-el:option value='255.255.255.192'>255.255.255.192</html-el:option> 
          <html-el:option value='255.255.255.224'>255.255.255.224</html-el:option> 
          <html-el:option value='255.255.255.240'>255.255.255.240</html-el:option> 
          <html-el:option value='255.255.255.248'>255.255.255.248</html-el:option> 
          <html-el:option value='255.255.255.252'>255.255.255.252</html-el:option> 
          </html-el:select> </td>
        <c:set target="${ObjectDetailsBean.map}" property="netmask" value="${null}"/> 



      </tr>
      <tr class="odd"> 
         <td class="blackBoldText"><fmt:message key='webclient.topo.objectdetails.isdhcp'/> </td>
         <td class="blackText" ><c:out value='${ObjectDetailsBean.map.isDHCP}'/></td>
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


